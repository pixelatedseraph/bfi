#!/bin/sh
set -e

REPO="https://raw.githubusercontent.com/pixelatedseraph/bfi/main"

echo "Downloading bfi..."

TMP=$(mktemp)

curl -fsSL "$REPO/bfi" -o "$TMP"
chmod +x "$TMP"

echo "Installing to /usr/local/bin (sudo required)..."

sudo install -m 755 "$TMP" /usr/local/bin/bfi

rm "$TMP"

echo
echo
echo "Done"