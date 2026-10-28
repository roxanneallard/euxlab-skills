# Standalone

Skills that sit outside the loop. Each one reads whatever the engagement folder holds and writes its own file, but no loop step reads that file back. Run one whenever the engagement needs it, at any point.

## User-invoked

Reachable only when you type them (Claude Code: `disable-model-invocation: true`. Codex: `policy.allow_implicit_invocation: false` in `agents/openai.yaml`).

- **[euxlab-write-okrs](./euxlab-write-okrs/SKILL.md)**: Whatever the engagement folder holds in, `docs/okrs.md` out. Two or three objectives with outcome key results, each with a graded baseline, a target, and a source. Run when a team sets OKRs for a period.
