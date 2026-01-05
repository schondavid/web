#!/bin/bash
# A simple script to compile a Typst file to HTML using Typst CLI

# Exit if no argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <file.typ>"
  exit 1
fi

# Input file (first argument)
INPUT_FILE="$1"

# Run Typst compile command
typst compile --features html --format html --root . "$INPUT_FILE"

