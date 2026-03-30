#!/bin/bash
# build_tex.sh - Compile a LaTeX file cleanly into PDF

# Exit if any command fails
set -e

# Check if a filename was provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename.tex"
  exit 1
fi

TEXFILE="$1"

# Remove path from filename if any
BASENAME=$(basename "$TEXFILE" .tex)

# Create temporary build folder
BUILD_DIR=$(mktemp -d)

# Compile LaTeX to PDF in build folder
latexmk -pdf -interaction=nonstopmode -file-line-error -outdir="$BUILD_DIR" "$TEXFILE"

# Clean auxiliary files inside build folder
latexmk -c -outdir="$BUILD_DIR" "$TEXFILE"

# Move the PDF to current directory
mv "$BUILD_DIR/$BASENAME.pdf" .

# Remove temporary build folder
rm -rf "$BUILD_DIR"

echo "✅ PDF generated: $BASENAME.pdf"
