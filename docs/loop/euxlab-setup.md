## What it does

Setup is step zero. It configures one engagement and writes the folder every other skill reads and writes. The suite is one loop with shared state, and every output is the next input. This skill writes the state the loop starts from.

Setup is an interview, not a script. It reads what already sits in the folder, asks one section at a time with a recommended answer you accept in a word, and writes nothing until you approve the draft.

## When to reach for it

You invoke this by typing `/euxlab-setup`. The agent won't reach for it on its own. In the Claude desktop and web apps, which have no slash commands, you name it in plain words instead, for example "set up EUXLab skills for this engagement".

Reach for this once, at the start of an engagement, before any other skill.

| Your situation | What to do |
|---|---|
| New engagement, empty folder | Run it. An empty folder is a normal start. |
| Engagement underway, transcripts already in the folder | Run it. It skips sections the files already settle. |
| One detail changed | Edit `docs/agents/engagement.md` directly. |
| Switching clients or starting over | Run it again. |

For sharpening a stakeholder ask instead, use [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask).

## Prerequisites

You need a folder you can write to and an agent that reads and writes files in it. Setup writes this into that folder:

- `docs/agents/engagement.md`: client and domain, design system, consent and retention posture, stakeholder map, and archive target.
- `GLOSSARY.md`, seeded without terms.
- `research/raw/`, `research/personas/` and `research/insights/`, with a README in `research/raw/` stating the immutability and consent rules.
- `docs/drr/` and `.scratch/` for later phases and working files.
- An `## Agent skills` block in `CLAUDE.md` or `AGENTS.md`. If neither exists, setup asks which to create.

Setup does not create `docs/interview-guide.md` or `docs/design-brief.md`. The skill that writes each one is also the proof that its step ran.

## The consent posture

Raw research is people, so the suite is strictest here. Setup asks where your consent form or DPA lives, how long you keep raw transcripts, how participants get identified, and what the client forbids leaving their environment. Some clients forbid cloud transcription, and this answer decides whether transcripts get uploaded at all.

If you don't know yet, setup records a safe default. Participants carry IDs such as `P01` outside `research/raw/`, raw data stays in the folder, and nothing goes to a third-party service until you confirm the DPA covers it. Every later skill redacts against this posture.

## The design system is binding

Setup records your design system, its version, and where its component list lives. No system yet becomes an explicit risk, not a blank. Per [euxlab-enterprise-ux-stance](https://euxlab.com/system/skills/euxlab-enterprise-ux-stance), the system is the shape of the problem, and [euxlab-design-review](https://euxlab.com/system/skills/euxlab-design-review) checks every screen against it.

## It's working if

- `docs/agents/engagement.md` exists and every section is filled or marked `not yet known`. A blank field is fine. A missing section is not.
- The consent posture names a retention period and an identification scheme.
- `research/raw/` holds a README with the immutability and consent rules.
- No empty interview guide or design brief sits in `docs/`.
- Your `CLAUDE.md` or `AGENTS.md` points at the engagement config and the glossary.

## Where it fits

Setup is step zero, run once per engagement, before the loop starts.

- [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) comes next when a stakeholder ask arrives, because it reads the stakeholder map to know whose assumptions it grades.
- [euxlab-create-personas-and-job-stories](https://euxlab.com/system/skills/euxlab-create-personas-and-job-stories) is the other entry point when a transcript has already landed, because it reads the consent posture and ID scheme before it touches raw data.

See the full map at [euxlab.com/system](https://euxlab.com/system).
