#!/usr/bin/env bash
# Download a full public YouTube video at the highest available quality.
# Preserve the original video and audio codecs (remux; NO re-encoding).
#
# Quick start (Kubuntu/Ubuntu):
#   sudo apt install ffmpeg pipx
#   pipx install "yt-dlp[default]"
#   pipx ensurepath
#
# YouTube also requires a JavaScript runtime:
#   Deno >= 2.3 (recommended): https://docs.deno.com/runtime/getting_started/installation/
#   or Node.js >= 22: https://nodejs.org/
#
# If yt-dlp was already installed without optional dependencies, run:
#   pipx runpip yt-dlp install -U "yt-dlp[default]"
#
# Usage:
#   bash download_youtube_video.sh 'https://www.youtube.com/watch?v=VIDEO_ID' [OUTPUT_DIRECTORY]
#
# IMPORTANT: Always put URLs with '&' in quotes so Bash does not background the process.
# The &t=938s parameter changes the YouTube playback start; it does NOT trim a download.
#
# Login-only content (when authorized):
#   YTDLP_COOKIES_BROWSER=firefox bash download_youtube_video.sh 'URL'
#
# If you see an EJS error, first check Deno/Node and the yt-dlp[default] extras.

set -Eeuo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: bash $0 'YOUTUBE_URL' [OUTPUT_DIRECTORY]" >&2
  exit 2
fi

url="$1"
output_dir="${2:-./youtube_videos}"

if command -v yt-dlp >/dev/null 2>&1; then
  ytdlp="$(command -v yt-dlp)"
elif [[ -x "$HOME/.local/bin/yt-dlp" ]]; then
  ytdlp="$HOME/.local/bin/yt-dlp"
else
  echo "ERROR: yt-dlp not found. Install: pipx install 'yt-dlp[default]'" >&2
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ERROR: FFmpeg missing. Run: sudo apt install ffmpeg" >&2
  exit 1
fi

js_args=()
js_ready=false
if command -v deno >/dev/null 2>&1; then
  deno_version="$(deno --version | head -n 1 | awk '{print $2}')"
  deno_major="${deno_version%%.*}"
  deno_minor="${deno_version#*.}"
  deno_minor="${deno_minor%%.*}"
  if [[ "${deno_major:-0}" =~ ^[0-9]+$ && "${deno_minor:-0}" =~ ^[0-9]+$ ]] && \
     (( deno_major > 2 || (deno_major == 2 && deno_minor >= 3) )); then
    js_ready=true
    echo "JavaScript runtime: Deno $deno_version"
  else
    echo "WARNING: Deno $deno_version is too old (requires >=2.3)." >&2
  fi
fi

if [[ "$js_ready" != true ]] && command -v node >/dev/null 2>&1; then
  node_version="$(node --version)"
  node_major="${node_version#v}"
  node_major="${node_major%%.*}"
  if [[ "$node_major" =~ ^[0-9]+$ ]] && (( node_major >= 22 )); then
    js_args+=(--js-runtimes node)
    js_ready=true
    echo "JavaScript runtime: Node $node_version"
  else
    echo "WARNING: Node $node_version is too old (requires >=22)." >&2
  fi
fi

if [[ "$js_ready" != true ]]; then
  echo "WARNING: No supported JavaScript runtime found." >&2
  echo "Install Deno >=2.3, or Node.js >=22, then retry." >&2
  echo "Deno instructions: https://docs.deno.com/runtime/getting_started/installation/" >&2
fi

mkdir -p "$output_dir"

args=(
  --no-playlist
  --format 'bestvideo+bestaudio/best'
  --merge-output-format mkv
  --continue
  --retries 10
  --fragment-retries 10
  --extractor-retries 3
  --write-info-json
  --output "$output_dir/%(title).180B [%(id)s].%(ext)s"
  --print 'after_move:filepath'
  "${js_args[@]}"
)

if [[ -n "${YTDLP_COOKIES_BROWSER:-}" ]]; then
  args+=(--cookies-from-browser "$YTDLP_COOKIES_BROWSER")
fi

"$ytdlp" "${args[@]}" "$url"
echo 'Done. Full video was downloaded and separate audio/video streams were remuxed without re-encoding.'
