# Ship as a Claude Code plugin and through skills.sh

Until 0.1.2 the only install was `cp -R skills/*/* ~/.claude/skills/` from a local copy. That works for one machine and fails everyone else: no updates, no way to install from a URL, and nothing for Codex users.

We ship two routes, the same two the `mattpocock/skills` repo uses:

- **Claude Code plugin.** `.claude-plugin/plugin.json` lists every promoted skill by path in its `skills` array. `.claude-plugin/marketplace.json` makes this repo its own single-plugin marketplace, named `euxlab`. A user adds the marketplace, then installs `euxlab-skills@euxlab`. The plugin is a read-only bundle that updates when `version` in `plugin.json` moves.
- **skills.sh.** `npx skills@latest add roxanneallard/euxlab-skills` discovers every `SKILL.md` under `skills/` and copies the chosen ones into the user's agent. It serves Codex and every other harness that reads the Agent Skills format.

The Claude desktop and web apps get uploaded zips, built by `scripts/package-skills.sh` and attached to each release.

## Why an explicit skills array

Skills live in bucket folders. `loop/` and `reference/` are promoted. `in-progress/` and `deprecated/` are not. An explicit array ships exactly the promoted set with no ambiguity, and a beta skill in `in-progress/` never reaches plugin users by accident.

## Deferred

- **A native Codex plugin.** Its manifest takes `skills` as a single path, which cannot name three bucket folders. skills.sh already covers Codex.
- **Claude Code's official marketplace.** Submitting the plugin there would shorten the install to `claude plugins install euxlab-skills`. Worth doing once the repo is public and the v0.1 exit criterion has been met on a real engagement.

## Invariants this creates

- Every promoted skill has an entry in `.claude-plugin/plugin.json`'s `skills` array, and nothing else does.
- `plugin.json`'s `version` tracks `package.json`'s. `npm run version` syncs them, and `npm run check-plugin-version` fails when they drift.
- `claude plugin validate . --strict` passes after any change to either manifest.
