set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$REPO_ROOT/out/docs/technical_docs/architecture"
STATIC_DIR="$REPO_ROOT/static/img"

mkdir -p "$STATIC_DIR"

find "$OUT_DIR" -type f \( -iname '*.svg' -o -iname '*.png' \) | while read -r svg; do
  relpath="${svg#$OUT_DIR/}"
  target_dir="$STATIC_DIR/$(dirname "$relpath")"
  mkdir -p "$target_dir"
  cp -v "$svg" "$target_dir/"
done

echo "Copied SVGs to $STATIC_DIR"
