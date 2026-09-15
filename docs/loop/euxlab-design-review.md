## What it does

`/euxlab-design-review` reviews a design artifact on two axes, Standards and Evidence, and reports them side by side.

The two axes are never merged. Two separate sub-agents run in parallel, each given only its own axis, because a reviewer who knows both sets of criteria blends them. You get no combined score, no merged top five, and no single winner. A combined score hides which axis failed.

## When to reach for it

You invoke this by typing `/euxlab-design-review`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when an artifact is about to go to a stakeholder. The artifact can be a Figma link, exported frames, screenshots, a prototype URL, or a built page.

- No design brief yet: the skill stops. Run [/euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) first.
- A screen names no insight ID: that becomes the first finding. It is scope creep or an insight nobody wrote down.

For writing the requirements a design gets checked against instead, use [/euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief).

## Prerequisites

- The engagement folder scaffolded by [/euxlab-setup](https://euxlab.com/system/skills/euxlab-setup). The skill reads the design system and any documented standards from `docs/agents/engagement.md`. Your documented standards override its baseline.
- `docs/design-brief.md`, agreed.
- `research/insights/`, one file per insight, from [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize).
- A design where every screen carries a screen label, the insight ID it serves, as the brief's tracing section asks.
- `GLOSSARY.md`, to check the screens use the domain's real words.

It delivers two reports, one per axis, one after the other.

## Two axes, never merged

| Axis | The question | What it checks |
|---|---|---|
| Standards | Does this follow the rules? | Design system conformance, WCAG 2.1 AA with contrast ratios as numbers, heuristics, and the ten enterprise smells from [/euxlab-enterprise-ux-stance](https://euxlab.com/system/skills/euxlab-enterprise-ux-stance) |
| Evidence | Which insight does this screen serve, and where is that written? | The trace chain per screen, the observable, scope creep inside a screen, decisions contradicting a cited insight, open contradictions, missing states, persona fit |

Each report opens with a one-line summary and the worst issue within that axis. If you ask which to fix first, the answer comes in prose: a blocker on either axis blocks.

## The trace chain

The Evidence axis walks four links for every screen, in order. It stops at the first broken link and reports it.

1. The label. The screen names an insight ID. No ID is a finding.
2. The insight. The ID resolves to a file in `research/insights/`, and the screen does what that insight's claim and opportunity point at.
3. The source. The insight cites raw evidence as `P<nn> L<start>-<end>`, and the report gives its grade. A C or D grade, or an `n=1, provisional` label, carries its weakness into the screen.
4. The requirement. The insight sits under an R number in `docs/design-brief.md`, quoted verbatim. An insight no requirement lists is scope creep.

The Evidence report adds a trace table with one row per screen: screen, insight ID, insight file, source citation, and requirement. A broken link shows as the first empty cell.

## Opinions get cut

Every Standards finding names the rule, the ratio, or the smell it breaks. Every Evidence finding names the insight ID, its file, and the requirement by its R number. A finding with none of that behind it is an opinion, and it gets cut before the report ships. That is why the skill refuses to run without a brief. Reviewing against nothing produces opinions.

## The miss that looks finished

The most expensive Evidence finding is a screen that serves the right insight and still misses the requirement's observable. The screen looks done, so nobody checks. The Evidence axis walks the artifact against the number in the brief.

Missing states get the same scrutiny. In enterprise tools the empty state is often the common state, and max-data is always the real one. A table designed at 8 rows that ships at 4,000 is a finding.

## It's working if

- You get two separate reports, each with its own summary and worst issue, and nothing ranks both axes into one list or score.
- The Evidence report has a trace table row for every screen.
- Every Evidence finding names the insight ID, its file, and the requirement by R number, quoted word for word.
- Every contrast finding states the measured ratio.
- Screens without a screen label, and fields or controls no insight or requirement asked for, are named as findings.

## Where it fits

This is the final skill step in the loop. It runs after you design in Figma.

- [/euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) matters most, because the trace chain ends at its requirements and every observable check uses its numbers.
- [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize) matters because each screen label resolves to one of its insight files, and the Evidence axis cites its insight and contradiction IDs.

See the full map at [euxlab.com/system](https://euxlab.com/system).
