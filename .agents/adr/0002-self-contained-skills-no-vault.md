# Every skill is self-contained; no vault dependency

The first drafts of this suite pointed reference skills at a personal knowledge base: `/evidence-standards` and `/enterprise-ux-stance` disclosed wiki pages instead of carrying their own content, and one skill told the agent to "search the vault". That made the library unusable for anyone without the same vault, and it taught new users they had to build one first.

## Decision

Every skill carries everything it needs. A reference skill is the source, not a pointer at one. The only state the suite reads or writes is plain markdown inside the engagement folder, and every path in it is relative.

## Consequences

- The library installs and runs from this repo alone. Nothing to install but the skills.
- Anyone who keeps a vault puts the engagement folder inside it and every skill behaves the same.
- Content that used to live in the vault now lives in the reference skills, so updating a rule means editing one `SKILL.md`.
- Requests to read from a specific note-taking tool are out of scope. See [.out-of-scope/vault-integration.md](../../.out-of-scope/vault-integration.md).
