# Writing docs pages

Every promoted skill has a human-facing **docs page** at `docs/<bucket>/<skill-name>.md`. The docs tree mirrors the promoted buckets under `skills/`: `loop/` and `reference/`. The page is not the skill and not a copy of `SKILL.md`. Skills in `in-progress/` and `deprecated/` get no page.

Most of these skills are user-invoked. The agent will never fire them for you, so you have to remember they exist and when to reach for them. A docs page relieves that load: it orients one reader around one skill so they know when to reach for it and where it sits in the flow.

Act whenever a promoted skill is added, renamed, or changes behaviour: create or re-sync its page. A rename moves the file too.

**Every link is absolute.** A link to another skill points at `https://euxlab.com/system/skills/<name>`. A link into the repo points at `https://github.com/roxanneallard/euxlab-skills/blob/main/<path>`. The page then reads the same on GitHub and on the site.

There is no H1. The page takes its title from the file name.

**A page carries no install commands.** Install wording lives in [the install block](./install-block.md), and a second copy drifts.

## Page structure

Keep this order. The fixed frame (`What it does`, `When to reach for it`, `Where it fits`) appears on every page. The rest appears only when the skill needs it.

<page-template>

## What it does

One or two plain paragraphs. Lead with the skill's one-sentence job, then state the **defining constraint**: the single fact that makes this skill behave differently from the obvious default. Write it as a plain sentence, never a labelled aside like "The key thing:".

## When to reach for it

- **Invocation mode.** User-invoked: "You invoke this by typing `/<name>`. The agent won't reach for it on its own." Add that in the Claude desktop and web apps you name the skill in plain words instead. Model-invoked: "Type `/<name>`, or the agent reaches for it on its own when a task fits", and name the loop skills that load it.
- **Trigger boundary.** "Reach for this when ...". Where a sibling is confusable, add "For <X> instead, use [<sibling>](https://euxlab.com/system/skills/<sibling>)."

## Prerequisites

Only when the skill needs something in place: the engagement folder from `/setup-euxlab-skills`, and the files it reads. Say what it writes and where. Reference skills are stateless and drop this section.

## <free-form middle>

One to three short sections in the skill's own vocabulary: the loop it runs, the artifact it produces, the anti-pattern it kills. Surface the skill's leading word (_frontier_, _grade_, _chain of custody_, _smell_, _solution-free_).

## Common questions

Real questions only, each in bold with the answer beneath. The count stays honest to the evidence: a skill nobody has asked about gets none, and the heading goes. Look in this repo's issues and in `CHANGELOG.md` before writing any.

## It's working if

A few bullets the reader can check in their own work without opening `SKILL.md`.

## Where it fits

The role (a run-once setup, a chain step, or a reference primitive), the one or two neighbours that matter with a because-clause each, and a link to [the flow](https://euxlab.com/system) for the full map.

</page-template>

## Conventions

- Explain the **why**, not the process. Never reproduce `SKILL.md` steps or templates.
- Never name the author. State the substance as a plain claim about the skill.
- House voice: short sentences, active voice, "you" for the reader, no em dashes, no hype words.
- Branches go in a table or a list, never in a paragraph.

## Done when

- The page exists at `docs/<bucket>/<name>.md`, and no stale page survives a rename.
- It carries no install command and no link to its own `SKILL.md`.
- `What it does` states the defining constraint as plain prose.
- `When to reach for it` states invocation mode and the trigger boundary.
- `Where it fits` names the role and links to the flow.
- Every link is absolute and resolves.
