---
name: design-brief
description: Turn cited insights into the design assignment - scope, requirements, and the specific insights each requirement serves - agreed with the stakeholder before any design exists. Run after /synthesize, before any design work.
disable-model-invocation: true
---

# Design brief

The red test of the loop. Everything before this produces understanding; this produces the assignment, and the assignment is agreed **before** the first frame exists.

**Input:** `research/insights/index.md` and the insights it points to, plus `research/personas/` and `docs/interview-guide.md`.
**Output:** `docs/design-brief.md`.

Load `/outcome-vocabulary` for the outcome grammar and `/evidence-standards` for grading. No interview at the drafting stage; this is synthesis. The interview happens at step 5, with the stakeholder.

## What this file is for

Someone opens `docs/design-brief.md` and starts designing. They should not need the transcripts, the personas, the insight files, or you. Everything a design decision depends on is either in this file or linked from it by ID.

It is also the thing `/design-review` reviews against. The design that comes back names, on every screen, the insight it serves. The review walks from that label to the insight, to its source, and back to the requirement in this file. A requirement that is not in here cannot be checked later, and a screen whose insight sits under no requirement is scope creep by definition.

## Process

### 1. Cluster insights into requirements

Group by the job being blocked, not by the screen involved. Screens are the current solution and clustering by them reproduces it.

Each cluster becomes one requirement. Five to nine requirements for an engagement. A requirement list that covers everything is a backlog with better typography, and pruning it is the job, per requirements by union in `/enterprise-ux-stance`.

### 2. Write each requirement so it can be checked

A requirement names what the design has to make possible, never how. The test: could two competing designs both satisfy it? If only one could, you have written a spec.

- Bad: "A unified timeline widget on the case screen."
- Bad: "The export should be easier."
- Good: "A handler can see every prior contact about a disputed invoice without leaving the case screen."
- Good: "A grid operator can act on an imbalance inside one 15-minute settlement window."

Each requirement carries the insight IDs it comes from. A requirement with no insight ID under it is an assumption wearing a requirement's clothes, and it belongs in the register, not here.

### 3. Attach the observable

Every requirement says how anyone would know it worked, and what the number is today.

- Bad: "significantly faster"
- Bad: "with high confidence"
- Good: "inside one 15-minute settlement window. Today: 40 minutes median (I04, P03 L112-140)"
- Good: "without opening a second system. Today: 3 systems per case, observed in 4 of 5 sessions (I02)"

A baseline you do not have is written as `baseline unknown` with the way you would measure it. That is honest and it usually generates a cheap measurement task.

Where the engagement is metric-driven, add two or three desired outcome statements in strict Ulwick format from `/outcome-vocabulary`.

### 4. Name the scope, both halves

In scope is the easy half. Out of scope is the half that makes the brief real: what the evidence did not ask for, what a stakeholder wanted that no insight supports, and what got cut for this round. Each with a reason.

### 5. Agree it with the stakeholder

A design brief is a contract, and an unsigned contract is a wish. Present the requirements, the evidence under each, and the things you **cut**, with the reason. The cut list is the part that makes the agreement real.

Record the confirmation, with the date and who confirmed. A brief without a named confirmer is not agreed.

## Output

Write `docs/design-brief.md`:

```markdown
# Design brief: <engagement>

**Status:** agreed | proposed
**Confirmed by:** <name>, <YYYY-MM-DD>

## The assignment
One paragraph. What is being designed, for whom, and what has to be different
afterwards. Written so a designer who joins on Monday can start.

## Who this is for
Each persona in five lines: role, expertise band, session shape, decision
authority, consequence of error. Enough that a designer never opens the
persona file.

## Requirements

### R1: <what the design has to make possible>
**Serves:** I02, I04, I09
**Observable:** what would be measured, with what, and the number today.
**Desired outcomes:** two or three strict DOS, where the engagement is metric-driven.
**Evidence:** the one-line claim of each insight, with its grade, plus the two
or three verbatim quotes that carry the most weight.

### R2: ...

## Constraints
Design system, regulation, platform, and anything immovable from the
interview guide. These are binding, not preferences.

## Out of scope
What the evidence did not ask for, what got cut, and who asked for each thing
that is not here. With reasons.

## Open contradictions
Any C-numbered contradiction from `research/insights/` that is still open and
touches a requirement. Design around it or resolve it, but do not pretend it
is settled.

## Tracing the design
Every screen and prototype frame names the insight ID it serves, in the frame
name or an annotation: "Case overview (I02)". Use IDs from the requirements
above. A screen that serves no listed insight is out of scope until the brief
changes. /design-review reads these labels.

## Open questions
With owners and dates.
```

## Anti-patterns

- **The solution requirement.** "A handler can use the unified timeline to..." The solution is already chosen; the requirement is decoration.
- **The unmeasurable observable.** "with ease", "intuitively", "seamlessly". Send it back.
- **The requirement with no evidence.** Every requirement traces to cited insights. A requirement that exists because a stakeholder wants it is an assumption, and it belongs in the register.
- **The everything requirement.** If it covers three jobs, it is three requirements or it is a roadmap.
- **Adoption as the observable.** "80% of users adopt it" measures the mandate. Measure the task.
- **The brief with no cut list.** If nothing was cut, nothing was decided.

## Completion criterion

Every requirement is solution-free, carries at least one insight ID that resolves to a file in `research/insights/`, and states an observable with a baseline or a stated way to get one. Every persona named in a requirement exists in `research/personas/`. The out-of-scope section is not empty. The tracing section tells the designer to label every screen with its insight ID. The stakeholder has confirmed the brief with a name and a date. A requirement whose observable cannot be checked is sent back, not carried forward.
