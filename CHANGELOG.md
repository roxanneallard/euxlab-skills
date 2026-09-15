# euxlab-skills

## 0.3.1

### Patch Changes

- [`6fcefa9`](https://github.com/roxanneallard/euxlab-skills/commit/6fcefa909debfaee5ea47891b1dd54450659ddf1) Thanks [@roxanneallard](https://github.com/roxanneallard)! - The roadmap names its stages Phase 1 to 5 instead of version numbers, so a release number no longer reads as a promise of new skills. `/euxlab-setup` and `/euxlab-enterprise-ux-stance` refer to planned skills by phase.

## 0.3.0

### Minor Changes

- [`8b4bd06`](https://github.com/roxanneallard/euxlab-skills/commit/8b4bd06f068c03c88225fed005001d1ce5a242ee) Thanks [@roxanneallard](https://github.com/roxanneallard)! - Every skill name now starts with `euxlab-`, so the skills stay distinct from other skill libraries you install.

  - `/setup-euxlab-skills` is now `/euxlab-setup`.
  - `/grill-the-ask`, `/create-personas-and-job-stories`, `/synthesize`, `/design-brief`, and `/design-review` are now `/euxlab-grill-the-ask`, `/euxlab-create-personas-and-job-stories`, `/euxlab-synthesize`, `/euxlab-design-brief`, and `/euxlab-design-review`.
  - `/grilling`, `/evidence-standards`, `/enterprise-ux-stance`, and `/outcome-vocabulary` are now `/euxlab-grilling`, `/euxlab-evidence-standards`, `/euxlab-enterprise-ux-stance`, and `/euxlab-outcome-vocabulary`.
  - The files the loop reads and writes keep their paths. If you installed with skills.sh, remove the old skill folders after you update.

## 0.2.0

### Minor Changes

- [`0915028`](https://github.com/roxanneallard/euxlab-skills/commit/0915028e1e93812e6f35daa4fdcfc81b567130e9) Thanks [@roxanneallard](https://github.com/roxanneallard)! - Rename the project from euxpro to euxlab. The plugin is now `euxlab-skills`, the marketplace is `euxlab`, and the setup skill is `setup-euxlab-skills`.

### Patch Changes

- [`0915028`](https://github.com/roxanneallard/euxlab-skills/commit/0915028e1e93812e6f35daa4fdcfc81b567130e9) Thanks [@roxanneallard](https://github.com/roxanneallard)! - Restructure the library around the loop. Every output is the next input.

  - `skills/getting-started/` and `skills/main-flow/` merge into `skills/loop/`. `/setup-euxlab-skills` is step zero. The five loop skills follow in order.
  - `/create-personas-and-job-stories` no longer writes insights. A persona file holds role, workflows, pain points, needs, and job stories. A pattern you notice in one transcript goes in as a cited pain point.
  - `/synthesize` is the only skill that writes insights, one file per insight (`research/insights/I01-<slug>.md`), so every insight has one address.
  - `/design-brief` adds a tracing section: every screen names the insight ID it serves.
  - `/grill-the-brief` is now `/grill-the-ask`.
  - `/setup-euxlab-skills` creates all three `research/` leaves: `raw/`, `personas/`, and `insights/`.
  - `/design-review` walks each screen from its label to the insight, to its source in raw, to the requirement in the brief, and reports a trace table.

- [`0915028`](https://github.com/roxanneallard/euxlab-skills/commit/0915028e1e93812e6f35daa4fdcfc81b567130e9) Thanks [@roxanneallard](https://github.com/roxanneallard)! - Ship the library as its own repo, installable in one step.

  - Claude Code: add this repo as a marketplace and install the `euxlab-skills` plugin (`/plugin marketplace add roxanneallard/euxlab-skills`, then `/plugin install euxlab-skills@euxlab`).
  - Codex and other agents: `npx skills@latest add roxanneallard/euxlab-skills`.
  - Every skill gains `agents/openai.yaml` for the Codex skill picker, and every promoted skill gains a docs page under `docs/`.
  - The Claude desktop and web zips ship as release downloads, built by `scripts/package-skills.sh`.

## 0.1.2

### Patch Changes

- One file in, one file out. Every skill now reads a file, does one thing, and writes the next file. That file is the contract with the next step.
- `/grill-the-brief` writes `docs/interview-guide.md`: the ask sharpened, the graded assumption register, and the questions the fieldwork has to answer. Every weak assumption becomes a numbered question or an explicit decision to accept the risk untested.
- `/design-brief` replaces `/to-hills`. The assignment is scope, requirements, and the insight IDs each requirement serves, with an observable and today's number. `hills/` is gone from the scaffold.
- `/design-review` reviews against the design brief by requirement number instead of against a Hill.
- The two handwork steps are named in the flow. Interviewing and designing are not skills, and pretending otherwise hid where the state comes from.
- Every skill is self-contained. The last dependency on a private vault is gone, so the library installs and runs from this repo alone.
- `/setup-rox-skills` is now `/setup-euxlab-skills`, and the library is EUXLab Skills. If you installed the old command, delete it. The name is the only thing that changed.
- No vault required, and the library says so. `/setup-euxlab-skills` states what the suite needs (a writable folder and an agent) and what it does not (Obsidian, a note app, a wiki, anything built before today).

## 0.1.1

### Patch Changes

- `/grilling`, `/evidence-standards`, `/enterprise-ux-stance`, and `/outcome-vocabulary` moved into their own reference group, so the flow skills cite them instead of restating them.
- Every completion criterion rewritten to be checkable. "Understanding reached" is gone from the library.
- Redaction moved from a final cleanup pass to a step inside each skill.

## 0.1.0

### Minor Changes

- Ten skills shipped: one setup skill, five main-flow skills, four reference skills.
- The state contract is fixed. Seven paths, each with a writer, a reader, and a rule.
- `/design-review` reports two axes side by side and refuses to merge them.
