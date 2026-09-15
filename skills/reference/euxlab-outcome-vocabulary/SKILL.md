---
name: euxlab-outcome-vocabulary
description: JTBD and ODI language - job story format, desired outcome statement format, the job map, and the opportunity algorithm. Load when writing job stories, writing outcome statements, stating what a design requirement has to make observable, or checking whether a statement is solution-free.
---

# Outcome vocabulary

The shared JTBD/ODI grammar. `/euxlab-create-personas-and-job-stories` and `/euxlab-design-brief` both consume it, which is why it lives here rather than inside either one.

## The three statement types, and when each is used

| Type | Format | Used by | Answers |
|---|---|---|---|
| **Job story** | When *[situation]*, I want to *[motivation]*, so I can *[outcome]* | `/euxlab-create-personas-and-job-stories` | What is the person trying to get done, in context |
| **Desired outcome statement** | *[Direction]* the *[metric]* it takes to *[verb]* *[object]* *[clarifier]* | `/euxlab-design-brief` | How would we know it got better |
| **Needs statement** | A *[role]* needs a way to *[capability]* so that they can *[outcome]* | Both, as the bridge | What capability the job implies |

## Job stories

**When** *[situation]*, **I want to** *[motivation]*, **so I can** *[outcome]*.

Situation first, always. In enterprise the trigger carries the constraint: the deadline, the interruption, the second signature, the customer on the line. A story that opens with the motivation has thrown away the part that shapes the design.

Rules:
- No persona name in the story. The situation identifies who it applies to.
- No solution noun in the motivation. "I want to click export" is a design decision wearing a story's clothes. The test: could two competing designs both satisfy this? If only one could, it is a spec.
- Anchored to a struggle moment in the transcript, never to a stated preference.
- One job story, one situation. "When I am reviewing or approving or escalating" is three stories.

Good: *When a customer disputes an invoice while I am on the call, I want to see every prior contact about that invoice, so I can answer without calling them back.*

Bad: *When a customer disputes an invoice, I want a unified timeline widget, so I can be more efficient.* (Solution in the motivation, unmeasurable outcome.)

## Desired outcome statements (Ulwick, strict)

**[Direction] the [metric] it takes to [verb] [object] [contextual clarifier].**

Direction is one of: **Minimize the time**, **Minimize the likelihood**, **Increase the likelihood**.

- *Minimize the time it takes to locate every prior contact about a disputed invoice.*
- *Minimize the likelihood of closing a dispute with an unread customer message on file.*
- *Increase the likelihood of resolving a dispute during the first call.*

Rules:
- Solution-free. Naming any screen, control, or system voids it.
- Measurable as written. If you cannot describe the instrument, rewrite it.
- Stable across solutions. A good outcome statement survives the product being rebuilt.

## The opportunity algorithm

**Opportunity = Importance + max(Importance - Satisfaction, 0)**

Score importance and satisfaction on a 1-10 scale, per outcome, with the population you actually sampled. Scores above roughly 15 are underserved and worth designing for. Scores below roughly 10 are overserved and worth removing effort from, which in enterprise is where most of the win is.

Use it to rank, not to decide. It is an argument, not an oracle, and it inherits the grade of the evidence underneath it (`/euxlab-evidence-standards`).

## The job map

Eight universal stages of any job. Use it to find where the work actually breaks, rather than designing the stage that happens to have a screen.

**Define → Locate → Prepare → Confirm → Execute → Monitor → Modify → Conclude**

Two things it reliably surfaces in enterprise:
- Friction clusters in Locate and Confirm, while the tooling is built for Execute.
- Modify and Conclude have no UI at all, which is where the coping spreadsheet comes from.

## Where this comes from

Ulwick for outcome-driven innovation and the opportunity algorithm, Klement for
the job story and the switch interview. This file is the working grammar, and it
is complete enough to write and check a statement without opening anything else.
