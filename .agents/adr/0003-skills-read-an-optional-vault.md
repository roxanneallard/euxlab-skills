---
status: accepted
supersedes: 0002
date: 2026-11-10
---

# Skills read an optional vault

ADR 0002 kept every skill blind to a vault so the library ran for anyone. That cut {the system} in two: {the brain} held the memory and no skill could use it. Skills now read a vault when one exists. Every skill still runs the same without one.

## Decision

- **Optional.** No skill requires a vault. Without one, a skill behaves as it did under 0002.
- **Path in the engagement config.** `/euxlab-setup` searches upward from the engagement folder for a `.obsidian/` folder, proposes the match, and writes the confirmed path to `docs/agents/engagement.md`. Skills read that path and never search on their own.
- **Read only.** Skills never write to the vault. The vault keeps its own schema and owner rules.
- **Context, never evidence.** A skill cites a vault page by path (`vault: wiki/concepts/shadow-it.md`). An insight still needs a citation into this engagement's `research/raw/`. A past finding from the vault enters the engagement as an assumption graded C or D.

## Considered options

- Vault required, with {the brain} as the install step. Rejected: it breaks the "a folder and an agent" promise for people who skip {the brain}.
- Skills search for a vault at runtime. Rejected: guessing picks the wrong vault when vaults are nested, and the user never sees the choice.
- Skills also write insights back to the vault. Rejected: two writers with different rules corrupt the vault.

## Consequences

- Reference skills stay self-contained. The vault adds context and never replaces a skill's own content.
- `.out-of-scope/vault-integration.md`, `CONTEXT.md` ("vault" is not a domain term), `CLAUDE.md`, `AGENTS.md`, the engagement config template and the README state contract need updating to match.
