## What it does

`/euxlab-write-okrs` turns what your engagement folder already knows into OKRs for one period. It writes `docs/okrs.md`: two or three objectives, each with two to four key results, initiatives, risks, a cut list, and scoring guidance.

It reads before it asks. The skill fills a context map from the files in the folder, grades every baseline it finds, and shows you the gaps. Only then does it interview you, and only about those gaps. Every key result measures an outcome, a change in what people do or get, and carries a baseline, a target, a date, and the source of the number.

## When to reach for it

You invoke this by typing `/euxlab-write-okrs`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when a team has to set OKRs for a quarter or a half, and the engagement folder holds some context: the stakeholder map, an interview guide, insights, or a design brief. It works with any subset of those files. The more the folder holds, the shorter the interview.

For the design assignment itself instead, use [/euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief).

## Prerequisites

- The engagement folder scaffolded by [/euxlab-setup](https://euxlab.com/system/skills/euxlab-setup). The stakeholder map in `docs/agents/engagement.md` supplies the owners.
- Any of `docs/interview-guide.md`, `research/insights/`, `research/personas/`, and `docs/design-brief.md`. None is required.
- Draft OKRs, if the team has them. Paste them in.

It writes `docs/okrs.md`.

## Outcomes, not outputs

An output is what the team ships. An outcome is what changes because it shipped. "Redesign the case screen" is an output. "Handlers resolve disputes on the first call" is an outcome.

Every output that comes up in the session lands in the initiatives list, where it belongs. The key results stay in one form: increase a metric from a baseline to a target by a date, with a named source.

## The context map and the honest baseline

Before the first question, the skill shows you a map of what the folder already says: team, period, goals, the main problem, who is measured on the outcome, baselines, and constraints. Each line points to the file it came from, and each empty line reads `gap`.

Every baseline carries a grade from [/euxlab-evidence-standards](https://euxlab.com/system/skills/euxlab-evidence-standards). A number read off a dashboard is strong. A number quoted in a kickoff is weak until someone names where it lives. When nobody has the number, the key result says `baseline unknown`, and measuring it becomes a dated initiative in the first weeks.

## The traps

The skill checks every key result against a fixed list of traps and records each hit in a self-critique. The traps include the task list with numbers, the invented baseline, the vanity metric, adoption theater, the everything set, the out-of-reach key result, the lone speed metric, and the easy-to-count metric. A speed metric always gets a counter-metric beside it, so nobody wins by closing cases badly.

## It's working if

- `docs/okrs.md` holds two or three objectives, each with a named owner.
- Every key result has a metric, a baseline or `baseline unknown` with a plan, a target, a date, and a source.
- No key result reads as a task you could tick off.
- The cut list names at least one thing the team chose not to pursue.
- Someone outside the team could score every key result at the end of the period from the file alone.

## Where it fits

This is a standalone skill: it sits outside the loop, and no loop step reads `docs/okrs.md` back. Run it whenever a team sets OKRs, at any point in the engagement.

- [/euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) is the best input, because its observables already carry today's number and the insight IDs behind them.
- [/euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) is the fallback input early in an engagement, because its interview guide states what success would look like.

See the full map at [euxlab.com/system](https://euxlab.com/system).
