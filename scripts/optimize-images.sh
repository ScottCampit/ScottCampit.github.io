#!/usr/bin/env bash
# One-off: build web-sized images from full-resolution originals.
#   SRC  full-res originals (kept outside the repo; defaults to ../site-drafts next to the repo)
#   DEST images/ in this repo
# Gallery images -> WebP, fit within 1600x1600.
# Card/og thumbnails -> JPG, 800px wide (JPG so link-preview fetchers can read them).
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${1:-$REPO/../site-drafts/images-original}"
DEST="$REPO/images"

THUMBS=(
  real-estate-data-science/dashboard_combined.png
  custom-llms/llm-2.png
  warehouse-computer-vision/frame_000001.jpg
  sports-multi-modal/IMG_2415.jpg
  multi-modal-bioinformatics/sankey.png
  logistics/freight_analytics_dashboard.png
)

# Not referenced by any page.
SKIP='(000030\.png|Screenshot .*\.png)$'

cd "$SRC"
find . -type f \( -name '*.png' -o -name '*.jpg' \) ! -name '._*' ! -name 'profile.png' | sed 's|^\./||' |
while IFS= read -r f; do
  [[ "$f" =~ $SKIP ]] && continue
  out="$DEST/${f%.*}.webp"
  mkdir -p "$(dirname "$out")"
  magick "$f" -resize '1600x1600>' -strip png:- | cwebp -quiet -q 80 -o "$out" -- -
  echo "$(magick identify -format '%wx%h' "$out") ${out#$DEST/}"
done

for f in "${THUMBS[@]}"; do
  out="$DEST/${f%.*}-thumb.jpg"
  magick "$f" -resize '800x420^' -gravity center -extent 800x420 -strip -quality 80 -interlace Plane "$out"
  echo "$(magick identify -format '%wx%h' "$out") ${out#$DEST/}"
done

# Voicebots only has an SVG; og:image needs a raster.
magick -density 200 voicebots/voicebot-thumbnail.svg -resize '800x420^' -gravity center -extent 800x420 -background white -flatten -quality 85 "$DEST/voicebots/voicebot-thumb.jpg"

# Profile: WebP for the page, JPG for og:image.
magick profile.png -strip png:- | cwebp -quiet -q 85 -o "$DEST/profile.webp" -- -
magick profile.png -strip -quality 85 "$DEST/profile.jpg"
