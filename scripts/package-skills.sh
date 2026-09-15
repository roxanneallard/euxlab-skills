#!/usr/bin/env bash
# Package every promoted skill as an upload-ready zip for the Claude desktop
# and web apps. Output lands in dist/claude-desktop/, which git ignores.
# Attach the zips to the GitHub release so people can download them.
#
# Every skill in this library is self-contained. There is no external
# dependency to package alongside them.
set -euo pipefail
cd "$(dirname "$0")/.."

OUT="dist/claude-desktop"
mkdir -p "$OUT"
find "$OUT" -name '*.zip' -delete

STAGE=$(mktemp -d)
trap 'rm -rf "$STAGE"' EXIT

for dir in skills/loop/*/ skills/reference/*/; do
  name=$(basename "${dir%/}")
  mkdir -p "$STAGE/$name"
  cp -R "${dir}." "$STAGE/$name/"
  # Codex picker metadata means nothing to the Claude apps.
  rm -rf "$STAGE/$name/agents"
  # The Claude apps have no slash commands, so a skill the model may not invoke
  # can never run there. The repo copy keeps the flag for Claude Code.
  grep -v '^disable-model-invocation: true$' "$STAGE/$name/SKILL.md" > "$STAGE/$name/SKILL.tmp"
  mv "$STAGE/$name/SKILL.tmp" "$STAGE/$name/SKILL.md"
  (cd "$STAGE" && zip -q -r -X "$OLDPWD/$OUT/$name.zip" "$name" -x '*.DS_Store')
  echo "packaged $name"
done
