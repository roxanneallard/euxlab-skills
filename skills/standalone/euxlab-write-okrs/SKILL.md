---
name: euxlab-write-okrs
description: Turn the engagement folder into two or three outcome OKRs. Extract what the project knows, grill the gaps, write docs/okrs.md with a baseline, target, and source for every key result.
disable-model-invocation: true
---

# Write OKRs

A team has to set OKRs for a period. The first draft is almost always a task list with numbers on it. Your job is to turn it into **outcomes**: a change in what people do, what they get, or what the business earns, each one scoreable by someone who was not in the room.

**Outcome** is the word this skill thinks with. An output is what the team ships. An outcome is what changes because it shipped. Every objective names an outcome, every key result measures one, and every output that comes up lands in the initiatives list.

**Input:** `docs/agents/engagement.md`, plus whatever exists of `docs/interview-guide.md`, `research/insights/`, `research/personas/`, `docs/design-brief.md`, `GLOSSARY.md`, and any draft OKRs the user pastes.
**Output:** `docs/okrs.md`.

Read `docs/agents/engagement.md` first. If it does not exist, run `/euxlab-setup`.

Load `/euxlab-grilling` for the interview, `/euxlab-evidence-standards` for grading baselines, and `/euxlab-outcome-vocabulary` for outcome grammar.

## 1. Extract the context map

Read every input file that exists and fill the **context map**. Each entry carries a pointer to the file and section it came from.

| Field | Look first in |
|---|---|
| Team | `engagement.md`, stakeholder map |
| Period | the user, or a date in the design brief |
| Goals to ladder up to | `engagement.md` notes, interview guide "Success as an observable" |
| The main problem or bet | interview guide "The ask, restated", the highest-graded insights |
| Who is measured on the outcome | `engagement.md`, stakeholder map |
| Baselines | design brief observables, insight evidence |
| Constraints and run work | interview guide "Immovable constraints", design brief constraints |
| Draft OKRs | pasted by the user |

Grade every baseline on the `/euxlab-evidence-standards` scale and keep the grade beside the number. A figure quoted in a kickoff stays D until someone names where it lives.

Mark every empty field `gap`. Show the user the map before the first round: it tells the team what they know and what they are guessing.

**Done when** every field holds a value with a pointer or reads `gap`, and every baseline carries a grade.

## 2. Grill the gaps

Run `/euxlab-grilling` against the gaps. One change to its rules: cap each round at **five questions**, the five whose answers unblock the most of the map. OKR sessions run with busy stakeholders, and a long round stalls.

Work these into the frontier where a gap calls for them:

1. **What outcome has to change, for whom?**
2. **How would you know?** Name the instrument and where the number lives.
3. **Whose number is it?** If nobody on this team moves it, find the leading indicator they do move.
4. **Which goal does it serve?** A company or department goal, or the main problem.
5. **What has to keep running?** The run work that eats capacity and never shows up in an OKR.
6. **What gets cut?** Name what the team will not pursue this period.
7. **How would someone game it?** The answer is the counter-metric.

**Done when** every `gap` in the map is filled or carries the user's explicit decision to proceed without it.

## 3. Draft

Write **two or three objectives**, each with **two to four key results**.

An **objective** names an outcome in words a stranger could repeat from memory, and links to a goal or the main problem in the map.

- "Redesign the case screen" is an output. "Handlers resolve disputes on the first call" is an outcome.

A **key result** measures that outcome in this form:

> Increase [metric] from [baseline] to [target] by [date]. Source: [instrument].

- "Launch the unified timeline" is an initiative.
- "Increase first-call dispute resolution from 41% to 60% by 31 March. Source: CRM close codes." is a key result.

Set each target so hitting 70% of it feels like a real win. Keep each key result inside the team's influence. Pair every key result that a trap below could game with a **counter-metric**: speed with quality, volume with error rate.

Where a baseline is missing, write `baseline unknown`, state how the team will measure it, and put that measurement in the initiatives with a date in the first weeks. Where a design brief exists, build key results from its observables and cite the R number and insight IDs.

Every output raised along the way goes into initiatives, two to four per objective.

**Done when** each objective has an owner from the stakeholder map, and each key result has a metric, a baseline or a measurement plan, a target, a date, and a source.

## 4. Hunt the traps

Check every key result and every objective against every trap in the list below. Record each hit and its fix for the self-critique. Then read the set as a whole:

- Could a stranger state each objective after ten seconds?
- Would hitting every key result mean the objective is achieved?
- Does the set make a priority call, or list everything the team does?

Tell the user plainly where their goals were vague, too many, or unmeasurable, and give the better version.

**Done when** every key result has been checked against every trap, each hit is fixed, and the self-critique lists what changed between draft and final.

### Traps

- **Task list with numbers.** "Ship 3 features", "Run 12 interviews". Fix: ask what changes for users once the work exists, and measure that.
- **Invented baseline.** A plausible number with no source, a D dressed as an A. Fix: `baseline unknown` and a measurement plan.
- **Vanity metric.** Page views, sign-ups, logins. Fix: measure what the person does next.
- **Adoption theater.** Enterprise users did not choose the software, so adoption measures the mandate. Fix: measure the task. It is also a smell in `/euxlab-enterprise-ux-stance`.
- **Everything set.** Four or more objectives, or a key result per workstream. Fix: cut to the outcomes that matter most this period and move the rest to the cut list.
- **Out-of-reach key result.** Revenue for a design team of five. Fix: the leading indicator the team moves.
- **Lone speed metric.** Time to resolve with no reopen rate beside it rewards closing cases badly. Fix: add the counter-metric.
- **Easy-to-count metric.** Chosen because the dashboard already shows it. Fix: ask whether it moves when the outcome moves.

## 5. Agree it

Present the set, the cut list, and the self-critique. Record who confirmed it, and the date.

**Done when** the status line names a confirmer and a date.

## Output

Write `docs/okrs.md`:

<okrs-template>

```markdown
# OKRs: <team>, <period>

**Status:** agreed | proposed
**Confirmed by:** <name>, <YYYY-MM-DD>

## Context map
One line per field, each with its pointer. Gaps the team chose to proceed
without are listed as gaps.

## O1: <objective>
**Owner:** <name>
**Why it matters:** one or two sentences linking it to the goal or problem.
**Serves:** company goal, design brief R numbers, insight IDs, where they exist.

**Key results**
1. Increase <metric> from <baseline> to <target> by <date>.
   Source: <instrument>. Baseline grade: <A-D>.
2. ...

**Counter-metric:** <what stops KR1 being gamed>, where a trap applies.

**Initiatives (not key results)**
- Two to four bets or projects that might move the key results.
- Each baseline measurement task, with a date.

**Risks and assumptions**
- What has to be true for this to work, graded.

## O2: ...

## Cut
What the team considered and left out this period, with the reason.

## Self-critique
Each trap found in the draft, where, and the fix.

## Scoring guidance
For each key result, what 0.3, 0.7, and 1.0 look like in its own numbers.
```

</okrs-template>

## Completion criterion

`docs/okrs.md` exists. The context map has no silent gaps. Two or three objectives, each naming an outcome and an owner. Two to four key results each, every one with a metric, a graded baseline or a measurement plan, a target, a date, and a source. Every trap checked against every key result, with each hit fixed and recorded. The cut list holds at least one item. Someone who was not in the room could score every key result at the end of the period from this file alone.
