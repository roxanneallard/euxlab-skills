# Model-invoked vs user-invoked

Every `SKILL.md` in this repo is a skill. The one axis that splits them is **invocation**, meaning who can reach it:

- **User-invoked.** Reachable **only by the human typing its name**. Set `disable-model-invocation: true` in the frontmatter (Claude Code) and `policy.allow_implicit_invocation: false` in `agents/openai.yaml` (Codex). Every skill in `loop/` is user-invoked, because each one writes state and the human decides when a step runs.
- **Model-invoked.** Reachable by **model or user**. Omit `disable-model-invocation` and the `policy` block. The `description` keeps rich trigger phrasing ("Load when ...") so auto-invocation fires. Every skill in `reference/` is model-invoked, because the loop skills load them by name.

Every skill also carries an `agents/openai.yaml` beside its `SKILL.md`. It holds Codex UI metadata (`interface.display_name` and `interface.short_description`) and, for user-invoked skills, the `policy` block that pairs with `disable-model-invocation`. Keep the two in sync: a skill is user-invoked in both harnesses or in neither.

The Claude desktop and web apps have no slash commands, so `scripts/package-skills.sh` strips `disable-model-invocation` from the zips it builds. The repo copy keeps the flag.

## Dependencies between them

Dependencies are written as `/skill`-style prose ("Load `/euxlab-evidence-standards` for grading"), never as `../other-skill/FILE.md` links. Shared material lives inside the skill that owns it. A user-invoked skill may load model-invoked skills, but never another user-invoked one.
