#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MEMORY_DIR="$REPO_DIR/memory"

if [[ ! -d "$MEMORY_DIR" ]]; then
  echo "Memory-Ordner nicht gefunden: $MEMORY_DIR" >&2
  exit 1
fi

echo "== project-profile.json =="
cat "$MEMORY_DIR/project-profile.json"
echo

echo "== preferences.json =="
cat "$MEMORY_DIR/preferences.json"
echo

echo "== todo.json =="
cat "$MEMORY_DIR/todo.json"
echo
