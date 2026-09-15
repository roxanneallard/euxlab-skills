## What it does

`/grill-the-ask` turns a vague stakeholder ask into a plan for research. It interviews you about the ask until the question frontier is empty. Then it writes `docs/interview-guide.md`: the ask restated so a stranger could act on it, a graded assumption register, and the questions your fieldwork has to answer.

It grades every claim in the round where someone makes it, not at the end. "Users find the export confusing" enters the register as a D, asserted, until someone names who watched it happen. The weak grades become your interview questions. So the output does not pretend the research already happened. It tells you what the research has to find out.

## When to reach for it

You invoke this by typing `/grill-the-ask`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when a stakeholder ask has landed and before you plan any research. "We need a new dashboard." "Make the portal easier." "Users are complaining about the export."

For turning finished research into the design assignment instead, use [/design-brief](https://euxlab.com/system/skills/design-brief).

## Prerequisites

- The engagement folder scaffolded by [/setup-euxlab-skills](https://euxlab.com/system/skills/setup-euxlab-skills). The skill reads `docs/agents/engagement.md` first and sends you to setup if the file is missing.
- The ask, in whatever form it arrived.

It writes `docs/interview-guide.md` and appends terms to `GLOSSARY.md` during the session.

## The frontier and the register

The interview runs in rounds against a frontier: the open questions the ask still raises. Facts are the agent's job. Decisions stay yours. The rounds stop when the frontier is empty.

Two things happen in every round. Each claim gets a grade on the four-grade scale from [/evidence-standards](https://euxlab.com/system/skills/evidence-standards): A observed, B reported, C inferred, D asserted. Each C and D gets the cheapest test that would move it to A or B. And each fuzzy or overloaded word goes to `GLOSSARY.md` while a human is still in the room to settle it. An "account" doing three jobs breaks a tax portal as surely as a codebase.

## Questions that test something

Every C and D assumption becomes an interview question, and every question names the assumption ID it tests. A question with no ID under it gets cut.

The questions ask for the last time, not the usual time. They ask about behaviour, never preference. They ask the participant to show you. The result reads like an interview of about twelve questions, grouped by the situation a participant recalls. Forty questions is a survey.

## Common questions

**Why grade during the interview instead of after?**
Grades assigned from memory drift to B. The grade is also often the most useful thing you hand back in the room, while the stakeholder is there to hear it.

**What if I cannot test an assumption?**
You write down a decision to accept the risk untested. The assumption stays in the register, weak and visible.

## It's working if

- Every row in the register has a grade and a source.
- Every C and D row points at a question number or carries a written decision to leave it untested.
- Every question names the assumption it tests.
- The success section names a task outcome you could measure, not adoption.
- A colleague who missed the session could run the interviews from the guide alone.

## Where it fits

This is the first skill step in the loop, right after step zero, the one-time [/setup-euxlab-skills](https://euxlab.com/system/skills/setup-euxlab-skills). Interviewing follows, by hand. Every output is the next input, and the guide is the input for every interview.

- [/create-personas-and-job-stories](https://euxlab.com/system/skills/create-personas-and-job-stories) comes after the interviews, because it reads the guide to know which assumptions each session was meant to test.
- [/synthesize](https://euxlab.com/system/skills/synthesize) matters because it walks your register and updates each grade with the insight that moved it.

See the full map at [euxlab.com/system](https://euxlab.com/system).
