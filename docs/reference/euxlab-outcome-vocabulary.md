## What it does

Outcome vocabulary is the shared grammar for jobs to be done and outcome-driven innovation. It covers the job story, the desired outcome statement, the needs statement, the job map, and the opportunity algorithm.

Every statement written in this grammar is solution-free. The test: two competing designs could both satisfy the statement. If only one could, you wrote a spec.

## When to reach for it

Type `/euxlab-outcome-vocabulary`, or the agent reaches for it on its own when a task fits. [euxlab-create-personas-and-job-stories](https://euxlab.com/system/skills/euxlab-create-personas-and-job-stories) and [euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) both load it, so inside the loop you rarely type it yourself.

Reach for this when you write job stories or outcome statements, state what a design requirement has to make observable, or check whether a statement is solution-free.

| You need to say | Statement type |
|---|---|
| What the person tries to get done, in context | Job story |
| How you would know it got better | Desired outcome statement |
| What capability the job implies | Needs statement |

For grading the evidence under a statement instead, use [euxlab-evidence-standards](https://euxlab.com/system/skills/euxlab-evidence-standards).

## Solution-free

A statement that names a screen, control, or system makes a design decision before design starts. "I want to click export" is a spec wearing a story's clothes.

A job story opens with the situation, always. In enterprise the trigger carries the constraint: the deadline, the interruption, the second signature, the customer on the line. Drop the situation and you drop the part that shapes the design. One story covers one situation, and it rests on a struggle moment in a transcript, never a stated preference.

A good one reads: *When a customer disputes an invoice while I am on the call, I want to see every prior contact about that invoice, so I can answer without calling them back.*

## Outcomes you measure

A desired outcome statement starts with one of three directions: minimize the time, minimize the likelihood, or increase the likelihood. It stays measurable as written. If you cannot describe the instrument, rewrite the statement. A good one survives the product being rebuilt.

The opportunity algorithm ranks outcomes: importance plus the gap between importance and satisfaction. High scores point at underserved outcomes. Low scores point at overserved ones, and in enterprise, removing effort there is often the bigger win.

## The job map

Eight stages of any job: Define, Locate, Prepare, Confirm, Execute, Monitor, Modify, Conclude. Use it to find where the work breaks instead of designing the stage that happens to have a screen. In enterprise, friction clusters in Locate and Confirm while the tooling targets Execute. Modify and Conclude often have no UI at all, which is where the coping spreadsheet comes from.

## Common questions

**Does the opportunity score decide what gets built?**
No. It ranks outcomes and makes an argument. It inherits the grade of the evidence underneath it, so a score built on asserted claims carries the same weakness.

## It's working if

- Every job story opens with a situation.
- No story or outcome statement names a screen, control, or system.
- Two competing designs could satisfy each statement.
- Every outcome statement starts with one of the three directions, and you name the instrument that measures it.
- No job story bundles several situations with "or".

## Where it fits

Outcome vocabulary is a reference primitive other skills load.

- [euxlab-create-personas-and-job-stories](https://euxlab.com/system/skills/euxlab-create-personas-and-job-stories) writes job stories and desired outcomes per transcript, because it needs the strict grammar to keep them solution-free.
- [euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) uses outcome statements, because each requirement has to state what it makes observable before design starts.

See the full map at [euxlab.com/system](https://euxlab.com/system).
