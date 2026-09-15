---
name: grill-the-ask
description: Interview the user about a stakeholder ask until the question frontier is empty, then write the sharpened ask, a graded assumption register, and the questions the fieldwork has to answer. Run when a stakeholder ask has arrived and before any research is planned.
disable-model-invocation: true
---

# Grill the ask

A stakeholder ask has arrived. "We need a new dashboard." "Make the portal easier." "Users are complaining about the export."

Your job is to interview the user until the ask is sharp enough to research, and to leave behind one file the next step can act on without you.

**Input:** the ask, in whatever form it arrived, plus `docs/agents/engagement.md`.
**Output:** `docs/interview-guide.md`.

Read `docs/agents/engagement.md` first. If it does not exist, run `/setup-euxlab-skills`.

Load `/grilling` for the interview method and `/evidence-standards` for the grading scale.

## Process

Run `/grilling` against the ask. Same rounds, same frontier, same format, same rule that facts are your job and decisions are the user's.

Two things run **every round**, not at the end.

### Every round: grade the claims

Every claim made in the room, by the stakeholder or by the user, lands in the register with a grade: **A observed**, **B reported**, **C inferred**, **D asserted**.

Grade honestly and grade in the round it was made. "Users find the export confusing" is a D until someone names who watched it happen. Say the grade out loud when you record it, because the grade is often the most useful thing you give back in the room.

Every C and D gets a proposed test written next to it: the cheapest method that would move it to A or B. That column becomes the interview questions in section 8.

### Every round: catch the overloaded words

Every fuzzy, contested, or overloaded term goes to `GLOSSARY.md` in the format that file defines. An "account" doing three jobs is as fatal in a tax portal as in a codebase, and the moment to catch it is while a human is in the room to arbitrate.

When you hit an overloaded term, that becomes a frontier question of its own: which job does this word do in this ask?

## Grilling questions specific to an enterprise ask

Work these into the frontier where they apply. They are the ones that most often collapse an ask.

1. **Who is measured on this?** Not who asked. Whose number moves if it works.
2. **What does the person do today instead?** There is always a workaround. Usually a spreadsheet.
3. **Is this a request or a symptom?** "Add a filter" is often "I cannot find the record".
4. **Who cannot leave?** Enterprise users did not choose the software. Which population is stuck with the result.
5. **What breaks if we do nothing?** If the answer is nothing, the ask is a preference.
6. **What is immovable?** Regulation, contract, works council, a system nobody will touch.
7. **Which of these is scope creep from another stakeholder?** Requirements by union has usually already happened by the time the ask reaches you.
8. **How would we know it worked?** If the answer is "adoption", press for a task outcome. See adoption theater in `/enterprise-ux-stance`.

## Turning weak assumptions into interview questions

This is the half of the skill that produces the guide rather than the brief.

Every C and D assumption is a question the fieldwork has to answer. Convert each one, and drop the rest: a question that tests nothing is a question that fills time.

Rules for the questions you write:

- **Ask for the last time, not the usual time.** "Walk me through the last export you ran" beats "how do you usually export". Memory of a specific event is evidence; a generalization is a summary the participant made for you.
- **Ask about behavior, never about preference.** "What would you like to see?" produces a feature list and moves nothing off D. See the anti-patterns in `/evidence-standards`.
- **Ask what happens when it goes wrong.** The recovery path is where enterprise friction lives and it is never in the demo.
- **Ask to be shown.** A contextual question ("can you open it and show me") produces A-grade evidence. A verbal one produces B at best.
- **Name the assumption each question tests.** A question with no assumption ID under it is curiosity, and curiosity is what makes sessions run 90 minutes.

Group the questions by the situation they belong to, not by topic. The situation is what the participant can actually recall.

## Output

Write `docs/interview-guide.md`, one file, in this order:

1. **The ask, restated** in one paragraph, in the user's words, sharp enough that a stranger could act on it
2. **What is actually being asked for**, when it differs from the ask, with the round that surfaced it
3. **Population** who is affected, how many, and whether they chose to be there
4. **Success as an observable** what would have to be true, measurably, for this to have worked
5. **Immovable constraints** the ones that shape the solution space
6. **Out of scope** what was explicitly ruled out in the room, with who ruled it out
7. **The assumption register**, full table, graded:

| ID | Assumption | Grade | Source | Tested by |
|---|---|---|---|---|
| A01 | Handlers abandon the export halfway | D | PO, kickoff 2026-08-14 | Q3 |

8. **The interview questions**, grouped by situation, each naming the assumption it tests:

```markdown
### Situation: running an export under time pressure

**Q3.** Walk me through the last export you ran. Where did you start?
_Tests A01. Follow up: what did you do with the file afterwards._

**Q4.** Show me what happens when it fails halfway.
_Tests A01, A07. Ask to be shown, not told._
```

9. **Who to talk to** the roles, how many sessions each, and what only that role can answer
10. **Open questions with owners** anything the room could not settle, each with a name

Append new glossary entries to `GLOSSARY.md` as you go, not at the end.

## Anti-patterns

- **The register written at the end.** Grades assigned from memory are all B. Grade in the round.
- **The question that tests nothing.** If no assumption ID sits under it, cut it.
- **The preference question.** "What would your ideal screen look like?" produces a wish list and grades D forever.
- **The guide that is a survey.** Forty questions is a form. Twelve is an interview.

## Completion criterion

The question frontier is empty, every assumption in the register carries a grade, and every C and D assumption is either covered by a numbered question in section 8 or carries an explicit written decision to accept the risk untested. `docs/interview-guide.md` exists and a colleague who was not in the room could run the sessions from it.
