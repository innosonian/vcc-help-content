#!/bin/sh

# hooks 폴더가 없으면 생성
if [ ! -d ".git/hooks" ]; then
  mkdir -p .git/hooks
  echo "📁 Created .git/hooks directory."
fi

cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
echo "✅ Git hook installed successfully."