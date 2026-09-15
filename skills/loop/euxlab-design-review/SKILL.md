---
name: euxlab-design-review
description: Review design artifacts on two axes in parallel - Standards (heuristics, WCAG 2.1 AA, design system, enterprise smells) and Evidence (which insight does each screen serve, and where is that written) - reported side by side, never merged. Run on any artifact before it goes to a stakeholder.
disable-model-invocation: true
---

# Design review

Two reviews, two sub-agents, run in parallel, reported side by side. Never merged, never reranked into one list, never given a single winner. They answer different questions and a combined score hides which one failed.

**Input:** the artifact (a Figma link, exported frames, screenshots, a prototype URL, or a built page), plus `docs/design-brief.md` and `research/insights/`.
**Output:** two reports, one per axis.

## Before you start

1. Read `docs/agents/engagement.md` for the design system and any documented standards. **Documented engagement standards override the baseline.** Say so in the report when they do, rather than arguing the general case.
2. Read `docs/design-brief.md` in full. If there is no design brief, stop and run `/euxlab-design-brief` first. Reviewing against nothing produces opinions, and opinions are what this skill exists to avoid.
3. List every screen with the insight ID it names, from the frame name or an annotation, as the brief's tracing section asks. A screen that names no insight is the first finding: it is either scope creep or an insight nobody wrote down, and both matter.
4. If the artifact is a set of images or a link, capture what you need first so both agents review the same material.

## Run both axes in parallel

Dispatch two sub-agents in one message. Give each only its own axis; a reviewer who knows both criteria blends them.

### Axis 1: Standards

Load `/euxlab-enterprise-ux-stance`. Check, in order:

1. **Design system conformance.** Component by component against the engagement's system. A custom component where a system component exists is a finding, with the component it should have been.
2. **WCAG 2.1 AA.** Contrast ratios with numbers, focus order, keyboard reachability, target size, text alternatives, and error identification. Enterprise adds one that consumer work skips: this is someone's eight-hour workday, so check sustained-use legibility and whether every action has a keyboard path.
3. **Heuristics.** Visibility of system status, match to the domain's real vocabulary (check `GLOSSARY.md`), user control and undo, consistency, error prevention, recognition over recall, shortcuts for experts, minimalist density, error recovery, help in context.
4. **The ten enterprise smells** from `/euxlab-enterprise-ux-stance`, each as a labeled judgment call: `Smell: <name>`, the evidence, the fix.

Report format per finding: **Severity** (blocker / major / minor), **Where** (screen and element), **What**, **Why it fails** (the specific rule, ratio, or smell), **Fix**.

### Axis 2: Evidence

Load `/euxlab-evidence-standards`. One question, asked of every screen: **which insight does this screen serve, and where is that written?**

Walk the chain for every screen, in this order. Stop at the first broken link and report it.

1. **The label.** The screen names an insight ID. No ID is a finding.
2. **The insight.** The ID resolves to a file in `research/insights/`, and the screen does what that insight's claim and opportunity point at. An ID that resolves to nothing, or to an insight about something else, is a finding.
3. **The source.** The insight cites raw evidence, `P<nn> L<start>-<end>` in `research/raw/`. Report its grade. An insight marked `n=1, provisional`, or graded C or D, carries that weakness into the screen, and the report says so.
4. **The requirement.** The insight sits under a requirement in `docs/design-brief.md`. Quote that requirement verbatim, with its R number. An insight no requirement lists is scope creep: "no requirement in `docs/design-brief.md` serves I07".

Then, across the whole artifact:

5. **Observable check.** Take each requirement's observable and walk the artifact against it. A design can serve the right insight and still miss the observable; that is the most common and most expensive miss, because it looks finished.
6. **Scope creep inside a screen.** Any field, control, or state that neither the screen's insight nor its requirement asked for. This is where requirements by union shows up as pixels.
7. **Evidence inversion.** A design decision that contradicts a cited insight. Quote both, by ID.
8. **Open contradictions.** Any C-numbered contradiction the brief left open that this design has quietly resolved in one direction. Designing past a contradiction is a decision, and it needs to be a visible one.
9. **Missing states.** Empty, loading, error, permission-denied, and max-data. In enterprise the empty state is often the common state and max-data is always the real one. A table designed at 8 rows that ships at 4,000 is a finding.
10. **Persona fit.** Density, shortcuts, and confirmation posture against the persona's expertise band, session shape, and consequence of error, from the brief.

Report format per finding: **Severity**, **Where** (screen and element), **The insight** (ID, one-line claim, file), **The source** (citation and grade), **The requirement** (R number, verbatim), **What is missing or unsupported**.

## Reporting

Present both reports one after the other, each with:

- A one-line summary of the axis
- The worst issue **within that axis**
- The full finding list, ordered by severity

Also give the Evidence report a trace table, one row per screen: screen, insight ID, insight file, source citation, requirement. A broken link shows as the first empty cell.

Then stop. Do not produce a combined verdict, a merged top-five, or a score. If the user asks which to fix first, answer in prose, and say plainly that a blocker on either axis blocks.

## Completion criterion

Both reports delivered, one-line summary per axis, worst issue named within each axis, and no single winner across axes. The Evidence report has a trace row for every screen, and every Evidence finding names the insight ID, its file, and the requirement by its R number. Every Standards finding names the specific rule, ratio, or smell it violates. A finding with no rule and no insight behind it is an opinion and gets cut before the report ships.
