#!/bin/zsh

set -euo pipefail

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CHROME_BIN="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
INPUT_HTML="$SCRIPT_DIR/cv.html"
OUTPUT_PDF="$SCRIPT_DIR/cv.pdf"

if [[ ! -x "$CHROME_BIN" ]]; then
	echo "Google Chrome was not found at: $CHROME_BIN" >&2
	exit 1
fi

if [[ ! -f "$INPUT_HTML" ]]; then
	echo "Input file not found: $INPUT_HTML" >&2
	exit 1
fi

"$CHROME_BIN" \
	--headless=new \
	--disable-gpu \
	--no-sandbox \
	--no-pdf-header-footer \
	--print-to-pdf="$OUTPUT_PDF" \
	"file://$INPUT_HTML"

echo "Generated: $OUTPUT_PDF"
