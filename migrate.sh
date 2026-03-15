#!/bin/bash
# Migrates ai/ posts to Chirpy structure:
#   ai/*.md          -> _posts/ai/YYYY-MM-DD-filename.md
#   ai/images/*      -> assets/img/posts/ai/*
# Image refs in posts are updated from ./images/name.png -> name.png
# (img_path in _config.yml defaults handles the full path)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Creating directories..."
mkdir -p _posts/ai
mkdir -p assets/img/posts/ai

echo "Moving images..."
if [ -d "ai/images" ]; then
  cp -r ai/images/* assets/img/posts/ai/
  echo "  Copied ai/images/* -> assets/img/posts/ai/"
fi

echo "Migrating posts..."
for src in ai/*.md; do
  filename=$(basename "$src")

  # Skip the index page we created
  [ "$filename" = "index.md" ] && continue

  # Extract date from front matter (handles quoted and unquoted)
  date=$(grep -m1 '^date:' "$src" | sed 's/date: *//;s/"//g;s/ .*//')

  if [ -z "$date" ]; then
    echo "  WARNING: No date found in $filename, skipping"
    continue
  fi

  dest="_posts/ai/${date}-${filename}"

  # Copy file and fix image references: ./images/foo.png -> foo.png
  sed 's|\./images/||g' "$src" > "$dest"

  echo "  $src -> $dest"
done

echo ""
echo "Done. Next steps:"
echo "  1. Review _posts/ai/ to confirm files look correct"
echo "  2. Delete the old ai/*.md posts (keep ai/ folder if you want, or remove it)"
echo "     rm ai/part*.md ai/agentic-ai-complete-guide.md ai/index.md"
echo "  3. Optionally remove ai/images/ (already copied to assets/img/posts/ai/)"
echo "     rm -rf ai/images"
echo "  4. Delete root index.md (Chirpy generates its own home page)"
echo "     rm index.md"
