## What it does

Grilling interviews you in rounds until you and the agent hold the same picture of a plan, a brief, or a scope. It is the suite's interview primitive. The agent maps your subject as a tree of decisions and walks every branch, so nothing stays silently assumed.

Each round asks the whole frontier at once, and every question arrives with the agent's recommended answer. The agent never asks a question whose answer depends on another question still open.

## When to reach for it

Type `/euxlab-grilling`, or the agent reaches for it on its own when a task fits. [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) loads it for its interview, so inside the loop you rarely type it yourself.

Reach for this when you want a plan, a decision, or an idea stress-tested, or when you use a phrase like "grill me".

For a stakeholder ask that needs graded assumptions and an interview guide instead, use [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask).

## The frontier

The frontier is every decision whose prerequisites are already settled. Those are the questions worth asking now. The agent numbers them, puts its recommendation under each, and waits.

The recommendation carries the agent's reasoning and lets you answer in one word. "It depends" is not an answer the agent gets to hand back. A question that waits on another open question moves to a later round, because a guess entered as a decision is worse than an open question.

Every answer you give pushes the frontier outward and unblocks the next set. The session ends when the frontier is empty.

## Facts are the agent's, decisions are yours

The agent finds facts itself, in your files and the engagement folder, and never asks you for something it could look up. A search in progress holds back only the questions downstream of it.

Decisions stay with you. A fact pointing at an answer narrows the frontier. It never settles the decision on your behalf.

## Pressure

Grilling pushes. The agent asks for the evidence under a claim, puts contradicting answers back to you, and names what a vague answer lacks, because "faster" is not a target. Hand it a solution and it works back to the decision underneath. It records who ruled each option out, and it stops once an answer is settled.

## Common questions

**Where does this come from?**
It adapts [Matt Pocock's grilling skill](https://github.com/mattpocock/skills) (MIT). The mechanics stay: the decision tree, rounds, the frontier, recommended answers, and the split between facts and decisions. This version is rewritten in the suite's voice, adds the Pressure rules, and widens the framing from a codebase to a stakeholder ask.

**When does the agent act on the result?**
Only after you confirm you both hold the same picture. Confirmation is yours to give, and the agent does not declare it.

## It's working if

- Each round arrives as a numbered set of questions, each with a real recommendation.
- You never get asked for a fact sitting in your own files.
- No question forces you to guess at the answer to another open question.
- A vague answer comes back to you with the missing part named.
- Nothing happens with the result until you say you agree.

## Where it fits

Grilling is a reference primitive other skills load.

- [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) runs grilling against a stakeholder ask, because the ask needs the same rounds plus a graded register and interview questions.
- [euxlab-evidence-standards](https://euxlab.com/system/skills/euxlab-evidence-standards) sits beside it, because the evidence grilling presses for gets graded on that scale.

See the full map at [euxlab.com/system](https://euxlab.com/system).
