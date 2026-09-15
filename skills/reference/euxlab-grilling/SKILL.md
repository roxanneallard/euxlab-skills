---
name: euxlab-grilling
description: Interview the user in rounds until every open decision is settled. The suite's interview primitive. Load when the user wants a plan, a brief, a scope, or an idea stress-tested, when they use any 'grill' trigger phrase, or when another skill calls for an interview.
---

# Grilling

Interview the user until you both hold the same picture. Not a checklist. An interview.

Map the subject as a tree of decisions. Every decision branches into the decisions hanging off it. Your job is to walk the whole tree and leave nothing silently assumed.

## Rounds and the frontier

Work in rounds.

The frontier is every decision whose prerequisites are already settled. These are the questions you ask now, without guessing at answers you have not heard yet.

Ask the whole frontier in one round. Number each question. Give your recommended answer under it. Then stop and wait.

Format each question like this:

```
❓ **Q1** - **<question title>**: <the question, with options where options exist>

➡️ <your recommended answer>
```

The recommendation is not a formality. It carries your reasoning and lets the user accept it in one word. Give a real one. "It depends" is not an answer you get to hand back.

Every answer reshapes the tree. Settled decisions push the frontier outward and unblock questions waiting on them. Recompute the frontier. Ask the next round.

A question whose answer depends on another question still open in this round belongs to a later round. Do not ask it yet. Asking it now forces the user to guess, and a guess entered as a decision is worse than an open question.

## Facts are yours, decisions are theirs

Finding facts is your job. Never the user's.

When a frontier question needs a fact from the environment, go get it. Read the files. Search the engagement folder. Check the repo. Dispatch a sub-agent for anything wide.

Do not block on it. A running search is an unsettled prerequisite, so only the questions downstream of it wait. Ask the rest of the frontier now.

The decisions belong to the user. Put each one to them and wait for the answer.

Never assume a decision because you found a fact pointing at it. The fact narrows the frontier. It does not settle it.

## Pressure

Grilling is not polite information gathering. Push.

- Ask for the evidence under a claim, not the claim again.
- When two answers contradict each other, say so and put both back to the user.
- When an answer is vague, name what is missing and ask again. "Faster" is not a target. "Better" is not a target.
- When the user hands you a solution, ask what it fixes. Work back to the decision underneath it.
- When something gets ruled out, record who ruled it out.

Stop pushing when the answer is settled. Repeating a question you already have an answer to wastes the round.

## Done

The session ends when the frontier is empty. Every branch visited, nothing silently assumed.

Do not act on the result until the user confirms you both hold the same picture. Confirmation is theirs to give, not yours to declare.
