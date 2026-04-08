#!/bin/sh
set -eu

REPO_ROOT="$(git rev-parse --show-toplevel)"
HOOKS_DIR="$REPO_ROOT/.githooks"
HOOK_FILE="$HOOKS_DIR/pre-commit"

if [ ! -f "$HOOK_FILE" ]; then
  echo "❌ Hook file not found: $HOOK_FILE"
  exit 1
fi

chmod +x "$HOOK_FILE" "$REPO_ROOT/scripts/pre-commit"
git config --local core.hooksPath "$HOOKS_DIR"

echo "✅ Git hook installed successfully."
echo "   core.hooksPath -> $HOOKS_DIR"
