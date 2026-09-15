Skills are organized into bucket folders under `skills/`, grouped by when you reach for them:

- `loop/`: the loop, step zero (setup) then request to reviewed design, every output the next input
- `reference/`: vocabulary and rubrics the loop skills load instead of restating
- `in-progress/`: beta, public on purpose, feedback wanted, not shipped in the plugin
- `deprecated/`: no longer used

The loop is the product. Every skill in `loop/` names the file it reads and the file it writes, and the two handwork steps (interviewing, designing) sit between them. The loop order in `README.md`, `skills/loop/README.md`, and the site must match.

Every skill in `loop/` or `reference/` (the **promoted** buckets) must have a reference in the top-level `README.md` and an entry in `.claude-plugin/plugin.json`'s `skills` array (the Claude Code plugin ships exactly the promoted set). Skills in `in-progress/` and `deprecated/` must not appear in either.

Install commands are copied verbatim from [.agents/install-block.md](./.agents/install-block.md). `.claude-plugin/marketplace.json` makes the repo its own single-plugin marketplace. Run `claude plugin validate . --strict` after touching either manifest. Why a Claude plugin plus skills.sh lives in [.agents/adr/0001-ship-as-a-claude-code-plugin.md](./.agents/adr/0001-ship-as-a-claude-code-plugin.md).

Each skill entry in the top-level `README.md` must link the skill name to its `SKILL.md`.

Each bucket folder has a `README.md` that lists every skill in the bucket with a one-line description, with the skill name linked to its `SKILL.md`. The promoted buckets' `README.md`s and the top-level `README.md` group entries into **User-invoked** and **Model-invoked**. Non-promoted bucket `README.md`s use a flat list.

Promoted skills also have a human-facing docs page at `docs/<bucket>/<skill-name>.md`. When you add, rename, or change the behaviour of a promoted skill, create or re-sync its docs page following [.agents/writing-docs.md](./.agents/writing-docs.md).

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`, reachable only by the human) or model-invoked (model- or user-reachable). See [.agents/invocation.md](./.agents/invocation.md).

Every skill is self-contained. No skill reads a personal vault, a private skill, or any file outside the engagement folder. See [.agents/adr/0002-self-contained-skills-no-vault.md](./.agents/adr/0002-self-contained-skills-no-vault.md).

The state contract table in `README.md` is the contract between skills. A change to a path a skill reads or writes updates that table in the same change.

Every file in this repo uses the house voice: short sentences, active voice, no em dashes.

Add a changeset (`npx changeset`) with every user-visible change. `npm run version` bumps `package.json` and syncs `.claude-plugin/plugin.json`, because Claude Code uses the plugin `version` to decide when installed users see an update. After a release, run `scripts/package-skills.sh` and attach `dist/claude-desktop/*.zip` to the GitHub release for Claude desktop and web users.

To (re)link every skill into the local harness skill directories (`~/.claude/skills`, `~/.agents/skills`) for testing, run `scripts/link-skills.sh`. Each entry is a symlink into this repo, so edits show up in the next session.

The design rationale for the whole suite, including the planned 28 skills, is [.agents/concept.md](./.agents/concept.md).
