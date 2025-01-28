#!/usr/bin/env bash
#
# Usage:
#   ./read-src.sh "USER_REGEX"
#
# Description:
#  1) We have a built-in filter for:
#       - .php, .html, .css, .twig, .js, .scss, .vue
#       - composer.json, package.json, webpack.config.js
#  2) We also take a user-supplied regex as the argument.
#  3) We only include files that pass both filters.
#
# Output is appended to code.txt.

set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 \"USER_REGEX\""
  exit 1
fi

USER_REGEX="$1"
OUTPUT_FILE="bin/code.src.txt"

# Built-in filter regex:
# Matches files ending with .php, .html, .css, .twig, .js, .scss, .vue
# OR exactly composer.json, package.json, webpack.config.js
BUILTIN_FILTER='(\.(php|html|css|twig|js|scss|vue)$)|(^(composer\.json|package\.json|webpack\.config\.js)$)'

# Clear (or create) the output file.
> "$OUTPUT_FILE"

# 1) List all tracked files with `git ls-files`
# 2) Filter by built-in file types via grep -E "$BUILTIN_FILTER"
# 3) Then filter that result by the user regex
git ls-files \
  | grep -iE "$BUILTIN_FILTER" \
  | grep -iE "$USER_REGEX" \
  | while read -r FILE; do
      echo "Add file $FILE"
      echo "==== Begin { SHA 5 chat begin }" >> "$OUTPUT_FILE"
      echo "PATH FILE : $FILE"               >> "$OUTPUT_FILE"
      echo "______"                          >> "$OUTPUT_FILE"
      cat "$FILE"                           >> "$OUTPUT_FILE"
      echo "==== End { SHA 5 chat begin }"   >> "$OUTPUT_FILE"
      echo                                  >> "$OUTPUT_FILE"  # blank line
    done

echo "Done. Written to $OUTPUT_FILE"
