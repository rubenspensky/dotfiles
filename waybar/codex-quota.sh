#!/bin/bash
set -euo pipefail

python3 - <<'PY'
import datetime as dt
import glob
import json
import os
from pathlib import Path

WARN_AT = int(os.environ.get("CODEX_QUOTA_WARN", "75"))
CRIT_AT = int(os.environ.get("CODEX_QUOTA_CRIT", "90"))
ICON = os.environ.get("CODEX_QUOTA_ICON", "󰚰")
OVERRIDE_FILE = Path(os.environ.get("CODEX_QUOTA_FILE", "~/.cache/codex/quota.json")).expanduser()
SESSIONS_DIR = Path(os.environ.get("CODEX_HOME", "~/.codex")).expanduser() / "sessions"
PI_SESSIONS_DIR = Path(os.environ.get("PI_CODING_AGENT_DIR", "~/.pi/agent")).expanduser() / "sessions"


def emit(text: str, css_class: str, tooltip: str) -> None:
    print(json.dumps({"text": text, "class": css_class, "tooltip": tooltip}))


def classify(percent: int) -> str:
    if percent >= CRIT_AT:
        return "critical"
    if percent >= WARN_AT:
        return "warning"
    return "normal"


def clamp_percent(value) -> int:
    try:
        return max(0, min(100, round(float(value))))
    except Exception:
        return 0


def progress_bar(percent: int, width: int = 10) -> str:
    filled = round((percent / 100) * width)
    return "█" * filled + "░" * (width - filled)


def reset_dt(ts):
    if not ts:
        return None
    try:
        return dt.datetime.fromtimestamp(ts).astimezone()
    except Exception:
        return None


def fmt_reset(ts):
    when = reset_dt(ts)
    if not when:
        return "unknown"
    return when.strftime("%Y-%m-%d %H:%M")


def fmt_reset_short(ts):
    when = reset_dt(ts)
    if not when:
        return "?"
    now = dt.datetime.now().astimezone()
    if when.date() == now.date():
        return when.strftime("%H:%M")
    return when.strftime("%m-%d %H:%M")


def fmt_reset_waybar(ts):
    when = reset_dt(ts)
    if not when:
        return "unknown"
    return when.strftime("%H:%M on %-d %b")


def fmt_days_left(ts):
    when = reset_dt(ts)
    if not when:
        return "?d"
    now = dt.datetime.now().astimezone()
    days = max(0, (when.date() - now.date()).days)
    return f"{days}d"


def is_expired(ts) -> bool:
    when = reset_dt(ts)
    return bool(when and when <= dt.datetime.now().astimezone())


def parse_iso_ts(value):
    if not value:
        return None
    try:
        if value.endswith("Z"):
            value = value[:-1] + "+00:00"
        return dt.datetime.fromisoformat(value).timestamp()
    except Exception:
        return None


def fmt_clock(ts):
    when = reset_dt(ts)
    if not when:
        return "?"
    return when.strftime("%H:%M") if when.date() == dt.datetime.now().astimezone().date() else when.strftime("%m-%d %H:%M")


def from_override_file(path: Path):
    if not path.is_file():
        return None

    data = json.loads(path.read_text())
    if all(key in data for key in ("text", "class")):
        return {
            "text": data["text"],
            "class": data["class"],
            "tooltip": data.get("tooltip", "Codex quota override"),
        }

    percent = data.get("used_percent")
    if percent is not None:
        percent = round(float(percent) * 100) if float(percent) <= 1 else round(float(percent))
        percent = clamp_percent(percent)
        remaining = 100 - percent
        reset_at = data.get("resets_at")
        tooltip = data.get("tooltip") or f"Codex usage: {percent}%\nCodex remaining: {remaining}%\nResets: {fmt_reset(reset_at)}"
        text = data.get("text", f"{ICON} [{progress_bar(remaining)}] {remaining}% ↺ {fmt_reset_short(reset_at)}")
        return {
            "text": text,
            "class": data.get("class", classify(percent)),
            "tooltip": tooltip,
        }

    status = data.get("status")
    if status:
        css_class = str(data.get("class", "normal"))
        return {
            "text": data.get("text", f"Codex: {status}"),
            "class": css_class,
            "tooltip": data.get("tooltip", "Codex quota override"),
        }

    return {
        "text": "Codex: OK",
        "class": "normal",
        "tooltip": f"Unsupported override schema in {path}",
    }


def latest_rate_limits():
    pattern = str(SESSIONS_DIR / "**" / "*.jsonl")
    files = sorted(glob.glob(pattern, recursive=True), key=os.path.getmtime, reverse=True)
    for session_file in files:
        try:
            with open(session_file, "r", encoding="utf-8") as fh:
                last = None
                last_ts = None
                for line in fh:
                    try:
                        event = json.loads(line)
                    except json.JSONDecodeError:
                        continue
                    payload = event.get("payload", {})
                    if payload.get("type") == "token_count" and payload.get("rate_limits"):
                        last = payload["rate_limits"]
                        last_ts = parse_iso_ts(event.get("timestamp")) or os.path.getmtime(session_file)
                if last:
                    return last, session_file, last_ts
        except OSError:
            continue
    return None, None, None


def latest_pi_usage():
    pattern = str(PI_SESSIONS_DIR / "**" / "*.jsonl")
    files = sorted(glob.glob(pattern, recursive=True), key=os.path.getmtime, reverse=True)
    for session_file in files:
        try:
            with open(session_file, "r", encoding="utf-8") as fh:
                last = None
                for line in fh:
                    try:
                        event = json.loads(line)
                    except json.JSONDecodeError:
                        continue
                    if event.get("type") != "message":
                        continue
                    usage = event.get("usage") or {}
                    if not usage:
                        continue
                    last = {
                        "usage": usage,
                        "provider": event.get("provider"),
                        "api": event.get("api"),
                        "model": event.get("model"),
                        "timestamp": event.get("timestamp"),
                    }
                if last:
                    return last, session_file
        except OSError:
            continue
    return None, None


def emit_pi_activity(data, source_file):
    usage = data.get("usage") or {}
    total = usage.get("totalTokens") or 0
    input_tokens = usage.get("input") or 0
    output_tokens = usage.get("output") or 0
    cache_read = usage.get("cacheRead") or 0
    ts = data.get("timestamp")
    tooltip_lines = [
        "Pi session activity detected (no exact quota/rate-limit data exposed here).",
        f"Total tokens: {total}",
        f"Input: {input_tokens} · Output: {output_tokens} · Cache read: {cache_read}",
        f"Provider: {data.get('provider') or 'unknown'} · Model: {data.get('model') or 'unknown'}",
        f"Last Pi activity: {fmt_reset(ts / 1000) if ts else 'unknown'}",
        f"Source: {source_file}",
    ]
    emit(f"{ICON} PI ↺ {fmt_clock(ts / 1000) if ts else '?'}", "normal", "\n".join(tooltip_lines))


try:
    override = from_override_file(OVERRIDE_FILE)
    if override:
        emit(override["text"], override["class"], override["tooltip"])
        raise SystemExit

    rate_limits, source_file, rate_limits_ts = latest_rate_limits()
    pi_usage, pi_source_file = latest_pi_usage()
    pi_ts = (pi_usage or {}).get("timestamp")
    pi_ts = (pi_ts / 1000) if pi_ts else None

    if rate_limits and (not pi_ts or not rate_limits_ts or rate_limits_ts >= pi_ts):
        primary = rate_limits.get("primary") or {}
        secondary = rate_limits.get("secondary") or {}
        credits = rate_limits.get("credits") or {}
        weekly = secondary or primary
        reset_at = weekly.get("resets_at")
        if is_expired(reset_at):
            tooltip_lines = [
                f"Last weekly quota data expired at {fmt_reset(reset_at)}.",
                "Open Codex once to refresh current weekly rate-limit data.",
                f"Source: {source_file}",
            ]
            emit(f"{ICON} Codex: stale", "warning", "\n".join(tooltip_lines))
            raise SystemExit

        percent = clamp_percent(float(weekly.get("used_percent", 0)))
        remaining = 100 - percent
        css_class = classify(percent)

        next_reset = fmt_reset_waybar(reset_at)
        days_left = fmt_days_left(reset_at)
        if credits.get("unlimited"):
            text = f"{ICON} Codex: [{progress_bar(100)}] 100% | 󰔟 {days_left}"
        else:
            text = f"{ICON} Codex: [{progress_bar(remaining)}] {remaining}% | 󰔟 {days_left}"

        tooltip_lines = [
            f"Weekly: {percent}% used · {remaining}% remaining · resets {fmt_reset(weekly.get('resets_at'))}",
        ]
        if primary and primary is not weekly:
            primary_percent = clamp_percent(float(primary.get("used_percent", 0)))
            tooltip_lines.append(
                f"Short window: {primary_percent}% used · {100 - primary_percent}% remaining · resets {fmt_reset(primary.get('resets_at'))}"
            )
        if credits.get("has_credits"):
            tooltip_lines.append(f"Credits balance: {credits.get('balance', 'unknown')}")
        tooltip_lines.append(f"Source: {source_file}")

        emit(text, css_class, "\n".join(tooltip_lines))
        raise SystemExit

    if pi_usage:
        emit_pi_activity(pi_usage, pi_source_file)
        raise SystemExit

    emit(
        f"{ICON} PI",
        "normal",
        f"No official Codex quota command found. Add {OVERRIDE_FILE}, use Codex CLI sessions, or rely on Pi activity fallback.",
    )
except Exception as exc:
    emit("Codex: Limited", "critical", f"Codex quota script error: {exc}")
PY
