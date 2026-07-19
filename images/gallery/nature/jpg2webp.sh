#!/usr/bin/env bash

set -euo pipefail

# ==============================================
# JPG/JPEG to WebP Converter
# ----------------------------------------------
# - Converts JPG/JPEG recursively
# - Preserves folder structure
# - Skips existing WebP files
# - Optional resize
# - Keeps original JPGs
# ==============================================

# -------- SETTINGS --------

SOURCE_DIR="${1:-.}"          # Defaults to current directory
QUALITY=85                    # WebP quality (0-100)

# Resize options
RESIZE=true                  # true or false
MAX_WIDTH=1920                # Only used if RESIZE=true

# --------------------------

if ! command -v cwebp >/dev/null; then
    echo "Error: cwebp not found."
    echo "Install it with:"
    echo "sudo pacman -S libwebp && sudo pacman -S libwebp-utils"
    exit 1
fi

if $RESIZE && ! command -v magick >/dev/null; then
    echo "Error: ImageMagick is required for resizing."
    echo "sudo pacman -S imagemagick"
    exit 1
fi

echo
echo "Source: $SOURCE_DIR"
echo "Quality: $QUALITY"

if $RESIZE; then
    echo "Resize: Enabled (${MAX_WIDTH}px max width)"
else
    echo "Resize: Disabled"
fi

echo

find "$SOURCE_DIR" \
    -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" \) \
    -print0 |

while IFS= read -r -d '' file; do

    output="${file%.*}.webp"

    # Skip if already converted
    if [[ -f "$output" ]]; then
        echo "Skipping: $output"
        continue
    fi

    echo "Converting: $file"

    if $RESIZE; then

        tmp=$(mktemp --suffix=.jpg)

        magick "$file" \
            -resize "${MAX_WIDTH}x>" \
            "$tmp"

        cwebp \
            -quiet \
            -mt \
            -metadata none \
            -q "$QUALITY" \
            "$file" \
            -o "$output"
        rm "$tmp"

    else

        cwebp \
            -quiet \
            -q "$QUALITY" \
            "$file" \
            -o "$output"

    fi

done

echo
echo "Finished!"
