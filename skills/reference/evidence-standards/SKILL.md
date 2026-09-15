---
name: evidence-standards
description: What counts as good evidence in UX research, the four-grade strength scale, and the research anti-patterns. Load whenever grading an assumption, judging whether a claim is supported, planning a method, or reviewing whether a design decision has evidence behind it.
---

# Evidence standards

The shared rubric for the whole suite. Other skills cite this instead of restating it.

## The four-grade strength scale

Every claim, assumption, or insight carries exactly one grade.

| Grade | Name | What it means | Typical source |
|---|---|---|---|
| **A** | Observed | Someone watched the behavior happen, or an instrument recorded it | Contextual inquiry, session recording, log data, task observation |
| **B** | Reported | A user described their own behavior, in their own domain, unprompted | Interview, diary study, support ticket in the user's words |
| **C** | Inferred | Drawn from adjacent evidence about a different context, population, or task | Analogous study, competitor teardown, desk research, benchmark |
| **D** | Asserted | Someone believes it and nothing supports it yet | Stakeholder claim, roadmap rationale, "everybody knows" |

**A and B are strong. C and D are weak.** Weak grades are not wrong; they are untested.
A weak claim earns research, never design.

Two rules the scale exists to enforce:

- **Behavior outranks attitude at the same grade.** What someone did beats what someone would do. "Would you use this?" produces a D wearing a B's clothes.
- **The grade travels with the claim.** When a claim moves from a register to an insight to a design requirement, the grade moves with it. A requirement built on D-grade assumptions is a guess with a deadline.

## Downgrade triggers

Drop a claim one grade when any of these apply, and say why in one line:

- The question that produced it was leading (see Tautological research below)
- The participant was describing someone else's work, not their own
- The observation was in a demo or training environment rather than live work
- The source is more than 18 months old in a domain that has since changed system or regulation
- The sample is a single participant and the claim is stated as a pattern

## The research anti-patterns

Fixed set. They apply even when an engagement documents nothing.

**Tautological research (the leading question).** The method can only produce the answer you fed it. The tell: name the participant behavior that would have changed your conclusion. If no such behavior exists, the study is decoration.
→ Rewrite the question so both answers are survivable, or drop the study.

**Attitude-coupled evidence.** An opinion standing in for a behavior. "Would you use this?", "How important is X on a scale of 1 to 5?", "Do you find this confusing?"
→ Observe or instrument the behavior. Ask about the last time it happened, not about the future.

**Horizontal research.** All the studies first, then all the design. Findings go stale before they are used and nothing is learned from a design move.
→ Vertical slices: one hypothesis, one test, one design move, each responding to what the last cycle taught.

**Solution-shaped research.** Evidence gathered to confirm a design already chosen. Recognizable when the stimulus is a finished screen and the questions are about it rather than about the work.
→ Grade the result tainted regardless of what it found. Re-run against the job, not the artifact.

**Sample of convenience, reported as the population.** Five people from the team that asked for the feature.
→ Name the sample in the claim ("3 of 5 dispute handlers, all in Team Zuid") or do not generalize.

**Consensus laundering.** Three participants agreeing in the same workshop counted as three data points.
→ Group agreement is one data point. Independent observation is the multiplier.

## The citation rule

Every claim in every artifact carries a pointer back to raw evidence: participant ID plus a line range, timestamp, or file. A claim with no pointer does not ship. It is not a style preference; it is what makes contradiction detectable later.

## Where this comes from

Evidence-driven truth as a working practice, Sharon on matching a question to a
technique, Leavy on sampling vocabulary, Tullis and Albert on metric types. This
file is the working rubric, not a summary of the literature. It is complete
enough to grade a claim without opening anything else.
