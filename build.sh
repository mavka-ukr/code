#!/bin/bash
set -e

VERSION="$1"

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

EXTRACT_DIR="$(mktemp -d)"
OUTPUT_DIR="./мавка-$VERSION"
ARCHIVE_NAME="мавка-$VERSION.tar.xz"

DOWNLOAD_URL="https://github.com/mavka-ukr/files/raw/main/%D0%B2%D0%B8%D0%BF%D1%83%D1%81%D0%BA%D0%B8-%D0%BC%D0%B0%D0%B2%D0%BA%D0%B8/$VERSION/%D0%BC%D0%B0%D0%B2%D0%BA%D0%B0-$VERSION.tar.xz"

wget -O "$ARCHIVE_NAME" "$DOWNLOAD_URL"

mkdir -p "$OUTPUT_DIR"

tar -xf "$ARCHIVE_NAME" -C "$EXTRACT_DIR"

докс код --вхід="$EXTRACT_DIR/мавка-$VERSION" --вихід="$OUTPUT_DIR" --назва="мавка-$VERSION" --завантажити="https://github.com/mavka-ukr/files/raw/main/%D0%B2%D0%B8%D0%BF%D1%83%D1%81%D0%BA%D0%B8-%D0%BC%D0%B0%D0%B2%D0%BA%D0%B8/$VERSION/%D0%BC%D0%B0%D0%B2%D0%BA%D0%B0-$VERSION.tar.xz" --гітхаб="https://github.com/mavka-ukr/mavka"

cp "favicon.png" "$OUTPUT_DIR/__докс_код_favicon.png"
cp "favicon.svg" "$OUTPUT_DIR/__докс_код_favicon.svg"