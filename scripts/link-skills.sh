#!/usr/bin/env bash
set -euo pipefail

# Maintainer script for testing local edits. Not an installer: users install
# with the Claude Code plugin or skills.sh (see README.md).
#
# Links every skill in this repo into the local skill directories each agent
# harness reads:
#   ~/.claude/skills  Claude Code
#   ~/.agents/skills  Codex and other Agent Skills harnesses
# Each entry is a symlink into this repo, so edits show up in the next session.
# An existing real directory with the same name is left alone and reported.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")

while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  for dest in "${DESTS[@]}"; do
    mkdir -p "$dest"
    target="$dest/$name"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
      echo "skipped $name: $target is a real directory, remove it to link" >&2
      continue
    fi
    ln -sfn "$src" "$target"
    echo "linked $name -> $target"
  done
done < <(find "$REPO/skills" -name SKILL.md -not -path '*/deprecated/*' -print0)
