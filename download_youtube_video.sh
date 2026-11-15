#!/usr/bin/env bash
# Download a complete public YouTube video at the best available quality.
# Video and audio are remuxed without re-encoding; no MP3 conversion.
#
# Usage:
#   bash download_youtube_video.sh 'https://www.youtube.com/watch?v=VIDEO_ID' [output-directory]
# Example:
#   bash download_youtube_video.sh 'https://youtu.be/VIDEO_ID' "$HOME/Videos/Avicii"
#
# Dependencies (Kubuntu/Ubuntu):
#   sudo apt install ffmpeg pipx
#   pipx install yt-dlp
#   pipx ensurepath
#   # Open a new shell after ensurepath, or use ~/.local/bin/yt-dlp.
#
# Optional for videos that require your browser's logged-in session:
#   YTDLP_COOKIES_BROWSER=firefox bash download_youtube_video.sh URL
# Only use this for content you are authorized to access.

set -Eeuo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: bash $0 YOUTUBE_URL [OUTPUT_DIRECTORY]" >&2
  exit 2
fi

url="$1"
output_dir="${2:-./youtube_videos}"

if ! command -v yt-dlp >/dev/null 2>&1; then
  if [[ -x "$HOME/.local/bin/yt-dlp" ]]; then
    ytdlp="$HOME/.local/bin/yt-dlp"
  else
    echo "Missing yt-dlp. Install: sudo apt install ffmpeg pipx; pipx install yt-dlp" >&2
    exit 1
  fi
else
  ytdlp="$(command -v yt-dlp)"
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Missing ffmpeg. Install: sudo apt install ffmpeg" >&2
  exit 1
fi

mkdir -p "$output_dir"

args=(
  --no-playlist
  --format "bestvideo+bestaudio/best"
  --merge-output-format mkv
  --continue
  --retries 10
  --fragment-retries 10
  --extractor-retries 3
  --write-info-json
  --output "$output_dir/%(title).180B [%(id)s].%(ext)s"
  --print "after_move:filepath"
)

if [[ -n "${YTDLP_COOKIES_BROWSER:-}" ]]; then
  args+=(--cookies-from-browser "$YTDLP_COOKIES_BROWSER")
fi

"$ytdlp" "${args[@]}" "$url"

echo "Done. When separate DASH streams are provided, FFmpeg muxes them without re-encoding."
echo "The .info.json file preserves publicly available video metadata for later research."
