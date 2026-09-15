## What it does

`/euxlab-design-brief` turns your cited insights into the design assignment. It writes `docs/design-brief.md`: the scope, five to nine requirements, and the insight IDs each requirement serves.

The brief gets agreed with a named stakeholder before the first frame exists. Everything earlier in the loop produces understanding. This step produces a contract, with a confirmer, a date, and a list of what got cut. A designer who joins on Monday opens this one file and starts. They never need the transcripts, the personas, the insight files, or you.

## When to reach for it

You invoke this by typing `/euxlab-design-brief`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize) has finished and before anyone opens Figma.

For sharpening a raw stakeholder ask before any research instead, use [/euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask).

## Prerequisites

- The engagement folder scaffolded by [/euxlab-setup](https://euxlab.com/system/skills/euxlab-setup).
- `research/insights/index.md` and the insight files it points to.
- The reconciled personas in `research/personas/`.
- `docs/interview-guide.md`, for constraints and the assumption register.

It writes `docs/design-brief.md`.

## Requirements two designs could both satisfy

A requirement names what the design has to make possible, never how. The test: two competing designs could both satisfy it. If only one could, you have written a spec.

"A unified timeline widget on the case screen" fails. The solution is already chosen. "A handler can see every prior contact about a disputed invoice without leaving the case screen" passes.

The skill clusters insights by the job being blocked, not by the screen involved. Screens are the current solution, and clustering by them rebuilds it. Every requirement carries the insight IDs under it, and each ID resolves to a file in `research/insights/`. A requirement with no insight ID is an assumption, and it goes back to the register.

## The observable and its baseline

Every requirement states how anyone would know it worked, and what the number is today. "Inside one 15-minute settlement window. Today: 40 minutes median."

When you have no baseline, the brief says `baseline unknown` and how you would measure it. That line often becomes a cheap measurement task. Adoption never counts as an observable. It measures the mandate, not the task.

## The cut list

Out of scope is the half that makes the brief real. It lists what the evidence did not ask for, what a stakeholder wanted that no insight supports, and what got cut for this round, each with a reason. When you present the brief, the cut list is the part the stakeholder has to agree to. A brief with nothing cut decided nothing.

## Tracing the design

The brief closes with a tracing section. It tells you to give every screen and prototype frame a screen label: the insight ID it serves, in the frame name or an annotation. For example, "Case overview (I02)". The IDs come from the requirements above.

A screen that serves no listed insight is out of scope until the brief changes. Every output is the next input. The labelled design is what [/euxlab-design-review](https://euxlab.com/system/skills/euxlab-design-review) reads, and each screen label starts its trace chain.

## Common questions

**What if a stakeholder insists on a requirement no insight supports?**
It goes into out of scope with the name of who asked, and into the assumption register as something to test. It does not enter the requirements.

## It's working if

- Every requirement has an R number, at least one insight ID that resolves to a file in `research/insights/`, and an observable with a baseline or a way to get one.
- No requirement names a widget, screen layout, or component.
- The out of scope section is not empty and says who asked for each item.
- The tracing section tells the designer to label every screen with the insight ID it serves.
- The status line names who confirmed the brief and when.

## Where it fits

This is the fourth skill step in the loop, and the last one before you design by hand in Figma.

- [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize) comes before, because the brief works from its insight index and cites its IDs.
- [/euxlab-design-review](https://euxlab.com/system/skills/euxlab-design-review) comes after the design, because it walks from each screen label to the insight and back to the requirement in this file. A requirement missing here cannot be checked later.

See the full map at [euxlab.com/system](https://euxlab.com/system).
