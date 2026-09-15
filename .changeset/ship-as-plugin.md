---
'euxlab-skills': patch
---

Ship the library as its own repo, installable in one step.

- Claude Code: add this repo as a marketplace and install the `euxlab-skills` plugin (`/plugin marketplace add roxanneallard/euxlab-skills`, then `/plugin install euxlab-skills@euxlab`).
- Codex and other agents: `npx skills@latest add roxanneallard/euxlab-skills`.
- Every skill gains `agents/openai.yaml` for the Codex skill picker, and every promoted skill gains a docs page under `docs/`.
- The Claude desktop and web zips ship as release downloads, built by `scripts/package-skills.sh`.
