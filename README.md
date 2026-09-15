# EUXLab Skills

Agent skills for enterprise UX research and design. A loop with shared state, not a folder of prompts.

**Every output is the next input.** Every skill reads a file, does one thing, and writes the next file. That file is the contract with the next step. The skills work in Claude Code, Codex, and any agent that reads the Agent Skills format.

**Status: v0.3.0, phase 1 of 5.** Ten skills. The loop runs from a vague stakeholder request to a reviewed design without dropping into freeform chat. Every skill is self-contained: no private dependency, nothing to install but this repo.

The landing page lives at [euxlab.com/system](https://euxlab.com/system).

## Installation (30-second setup)

Two ways in. **The [Claude Code plugin](https://code.claude.com/docs/en/plugins)** installs the whole set as a managed, read-only bundle that updates when a new version ships. **[skills.sh](https://skills.sh)** copies editable skill files into your project, so you can adapt them. Pick one. Installing both leaves you with every skill twice.

### 1. Get the skills

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugins marketplace add roxanneallard/euxlab-skills
claude plugins install euxlab-skills@euxlab
```

Or, from inside a session:

```
/plugin marketplace add roxanneallard/euxlab-skills
/plugin install euxlab-skills@euxlab
```

The first command adds this repo as a marketplace. The second installs the plugin from it. Pull a new version with `/plugin marketplace update euxlab`.

</details>

<details>
<summary><strong>Codex, and other agents</strong></summary>

```bash
npx skills@latest add roxanneallard/euxlab-skills
```

Pick the skills you want, and which coding agents to install them on. **Make sure `euxlab-setup` is one of them.** The loop skills load the four reference skills, so take those too.

</details>

<details>
<summary><strong>For tinkerers</strong></summary>

Use the same installer, on any agent, including Claude Code:

```bash
npx skills@latest add roxanneallard/euxlab-skills
```

It writes the skills into your project as ordinary files you own and edit. Nothing updates behind your back. Pull the latest changes when you want them with `npx skills update`.

</details>

<details>
<summary><strong>Claude desktop and web</strong></summary>

Those apps take uploaded zips. Download them from the [latest release](https://github.com/roxanneallard/euxlab-skills/releases/latest), or build them with `scripts/package-skills.sh`. Upload each one under **Settings > Capabilities > Skills > Upload skill**.

Upload the reference skills first, because the loop skills load them: `euxlab-grilling`, `euxlab-evidence-standards`, `euxlab-enterprise-ux-stance`, `euxlab-outcome-vocabulary`. Then `euxlab-setup` and the five loop skills.

Those apps have no slash commands, so the zips drop `disable-model-invocation`. Invoke a skill by naming it instead: "grill this ask", "synthesize these transcripts", "run a design review on this". Six of the ten skills read and write files, so give Claude file access (a Filesystem MCP server or a project) or they leave no state on disk.

</details>

### 2. Step zero: run `/euxlab-setup`

Run it once per engagement, inside the engagement folder. It will:

- Ask for the client, the product, and the domain
- Ask which design system every artifact has to obey
- Ask for the consent and retention posture for research recordings
- Ask who asks for the work, who signs off, and who is measured on the outcome
- Write the folder scaffold every other skill reads

In Claude Code, plugin skills carry the plugin prefix, so this shows up as `/euxlab-skills:euxlab-setup`.

### 3. Start the loop

When a stakeholder request arrives, run `/euxlab-grill-the-ask`.

## The loop

```
step zero, once per engagement
/euxlab-setup ───────────────────► docs/agents/engagement.md and the folder scaffold

request                           "We need a new dashboard."
   │
   ▼  /euxlab-grill-the-ask       critical questions about requirements, scope, users
docs/interview-guide.md           the request, sharpened, plus the questions for the interviews
   │
   ▼  interviewing                handwork: you talk to stakeholders and users
research/raw/                     transcripts
   │
   ▼  /euxlab-create-personas-and-job-stories    per transcript
research/personas/                role, workflows, job stories, pain points, needs
   │
   ▼  /euxlab-synthesize
research/insights/                insights I01, I02 with evidence from the transcripts,
   │                              contradictions as C01
   ▼  /euxlab-design-brief
docs/design-brief.md              the design assignment: scope, requirements, and the
   │                              insights the design has to serve
   ▼  designing                   handwork: you design in Figma
design                            screens and a prototype, each screen naming the insight it serves
   │
   ▼  /euxlab-design-review
two reports                       Standards: heuristics, WCAG, design system.
                                  Evidence: which insight each screen serves, and where that is written
```

Three kinds of step. A **skill** (`/name`) does the work. A **file** is what the skill writes, and what the next step reads. **Handwork** is what you do yourself: interviewing is a human talking to a human, and designing is the part you are good at. The skills carry the state between them.

## What you need

A folder you can write to, and a coding agent that can read and write files in it. That is the whole list.

Everything this suite shares between steps is plain markdown in an ordinary directory:

```
engagement/
├── docs/            engagement.md, interview-guide.md, design-brief.md
├── GLOSSARY.md
└── research/        raw/, personas/, insights/
```

Any editor opens those files. `grep` searches them. `git` versions them. Every path inside them is relative and every cross-reference is an ordinary markdown link, so the folder survives being opened in a different editor, zipped and mailed, or committed to a repo.

`/euxlab-setup` creates the folder and you start there.

## The state contract

Every step reads and writes the same folders. This is what makes it a loop rather than a set of prompts.

| Path | Written by | Read by | Rule |
|---|---|---|---|
| `docs/agents/engagement.md` | `/euxlab-setup` | all | client, design system, consent posture, stakeholders |
| `GLOSSARY.md` | `/euxlab-grill-the-ask`, persona skill | all | a term earns an entry when it is fuzzy, contested, or overloaded |
| `docs/interview-guide.md` | `/euxlab-grill-the-ask` | persona skill, `/euxlab-synthesize` | the sharpened request, the graded assumption register, the questions |
| `research/raw/` | interviewing | persona skill, `/euxlab-synthesize` | **immutable**, consent-checked, may contain PII |
| `research/personas/` | persona skill | `/euxlab-synthesize`, `/euxlab-design-brief` | role, workflows, job stories, pain points, needs. No insights. Provisional until synthesis reconciles |
| `research/insights/` | `/euxlab-synthesize` | `/euxlab-design-brief`, `/euxlab-design-review` | one file per insight, ID'd, graded, cited to raw |
| `docs/design-brief.md` | `/euxlab-design-brief` | designing, `/euxlab-design-review` | requirements, each serving named insight IDs |
| the design | designing | `/euxlab-design-review` | every screen names the insight ID it serves |

## Two rules that hold across the suite

**Every claim carries a pointer.** Participant ID plus a line range, back to raw. A claim with no pointer does not ship. This is what makes a contradiction detectable six weeks later, and what lets `/euxlab-design-review` walk from any screen back to the quote behind it.

**Raw research is people.** Participants are identified by ID everywhere outside `research/raw/`. Redaction happens on the way out of every skill, not as a final cleanup pass. The consent posture in `docs/agents/engagement.md` decides what may leave the engagement folder at all.

## Reference

These split on one axis: who can invoke them. **User-invoked** skills run only when you type them (for example `/euxlab-grill-the-ask`). They write state, so you decide when a step runs. **Model-invoked** skills run when you type them _or_ when the agent reaches for them because the task fits. They hold the shared rubrics. A user-invoked skill may load model-invoked skills, but never another user-invoked one.

### Loop

Step zero, then the loop in order.

**User-invoked**

- **[euxlab-setup](./skills/loop/euxlab-setup/SKILL.md)**: Step zero. Configure one engagement and write the folder scaffold. Run this first.
- **[euxlab-grill-the-ask](./skills/loop/euxlab-grill-the-ask/SKILL.md)**: Critical questions about a stakeholder request, every claim graded, and the questions the interviews have to answer.
- **[euxlab-create-personas-and-job-stories](./skills/loop/euxlab-create-personas-and-job-stories/SKILL.md)**: One transcript into a persona: role, workflows, job stories, pain points, and needs, every trait cited.
- **[euxlab-synthesize](./skills/loop/euxlab-synthesize/SKILL.md)**: The cross-transcript pass. The only skill that writes insights: one file each, cited and graded, contradictions kept.
- **[euxlab-design-brief](./skills/loop/euxlab-design-brief/SKILL.md)**: Insights into the design assignment. Scope, requirements, and the insights each one serves, agreed before design.
- **[euxlab-design-review](./skills/loop/euxlab-design-review/SKILL.md)**: Two parallel reviews, Standards and Evidence, side by side. Evidence walks every screen to its insight and its source.

### Reference

The vocabulary layer the loop skills load instead of restating.

**Model-invoked**

- **[euxlab-grilling](./skills/reference/euxlab-grilling/SKILL.md)**: The interview primitive. Rounds, the frontier, pressure. Mechanics from Matt Pocock's skills, rewritten in the house voice.
- **[euxlab-evidence-standards](./skills/reference/euxlab-evidence-standards/SKILL.md)**: The four-grade strength scale, downgrade triggers, and the research anti-patterns.
- **[euxlab-enterprise-ux-stance](./skills/reference/euxlab-enterprise-ux-stance/SKILL.md)**: Ten enterprise design smells and their fixes.
- **[euxlab-outcome-vocabulary](./skills/reference/euxlab-outcome-vocabulary/SKILL.md)**: Job story format, ODI outcome format, job map, opportunity algorithm.

## Roadmap

Five phases, 28 skills. The design rationale for the whole suite is in [.agents/concept.md](./.agents/concept.md).

| Phase | Theme | Ships | Total |
|---|---|---|---|
| **Phase 1** | MVP: the loop that compounds | 10 | 10 |
| Phase 2 | The loop closes | 6 | 16 |
| Phase 3 | The engagement sustains itself | 6 | 22 |
| Phase 4 | Fog and audience | 4 | 26 |
| Phase 5 | The library, hardened | 2 + evals | 28 |

**Phase 1 exit criterion:** one real engagement runs request → interview guide → transcripts → personas → insights → design brief → reviewed design without improvisation at any step, and every screen traces to a cited insight. Until that has happened once, the phase is written, not done.

## Credits

The system shape, the grilling primitive, the completion-criterion discipline, and the repo structure come from [Matt Pocock's skills](https://github.com/mattpocock/skills) (MIT). The UX content comes from fifteen years of enterprise engagements.
