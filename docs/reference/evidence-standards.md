## What it does

Evidence standards is the shared rubric for what counts as evidence in UX research. Every claim, assumption, and insight in the suite carries exactly one of four grades, and every claim carries a pointer back to raw.

A weak grade means untested, not wrong. A weak claim earns research, never design.

## When to reach for it

Type `/evidence-standards`, or the agent reaches for it on its own when a task fits. [grill-the-ask](https://euxlab.com/system/skills/grill-the-ask), [create-personas-and-job-stories](https://euxlab.com/system/skills/create-personas-and-job-stories), [synthesize](https://euxlab.com/system/skills/synthesize), [design-brief](https://euxlab.com/system/skills/design-brief) and [design-review](https://euxlab.com/system/skills/design-review) all load it, so inside the loop you rarely type it yourself.

Reach for this when you grade an assumption, judge whether a claim holds, plan a research method, or check whether a design decision has evidence behind it.

For judging whether a design fits an enterprise context instead, use [enterprise-ux-stance](https://euxlab.com/system/skills/enterprise-ux-stance).

## The four grades

| Grade | Name | Means |
|---|---|---|
| A | Observed | Someone watched it happen, or an instrument recorded it |
| B | Reported | A user described their own behavior, in their own domain, unprompted |
| C | Inferred | Drawn from a different context, population, or task |
| D | Asserted | Someone believes it and nothing supports it yet |

A and B are strong. C and D are weak. Two rules give the scale its teeth. Behavior outranks attitude at the same grade, so "Would you use this?" produces a D dressed as a B. The grade travels with the claim, from assumption to insight to requirement. A requirement built on D-grade assumptions is a guess with a deadline.

## Downgrades and anti-patterns

A claim drops one grade, with a one-line reason, when the question was leading, the participant described someone else's work, the observation came from a demo environment, the source is stale in a domain that has since changed, or one participant got stated as a pattern.

The anti-patterns name the ways a study fools you. Tautological research has a quick test: name the participant behavior that would have changed your conclusion. If none exists, the study is decoration. Solution-shaped research, where the stimulus is a finished screen, gets graded tainted whatever it found. Consensus laundering counts three people agreeing in one workshop as one data point, not three.

## The citation rule

Every claim carries a participant ID plus a line range, timestamp, or file. A claim with no pointer does not ship. The pointer is what lets you spot a contradiction six weeks later.

## Common questions

**Is a D-grade claim wrong?**
No. It is untested. [grill-the-ask](https://euxlab.com/system/skills/grill-the-ask) turns every C and D into an interview question, or into a written decision to accept the risk untested.

**Why do three B-grade quotes make a B insight?**
An insight inherits the weakest grade among its evidence, not the strongest. More quotes of the same kind add confidence in the pattern, not a higher grade.

## It's working if

- Every claim in your artifacts carries one grade and a pointer to raw.
- Each downgrade comes with a one-line reason.
- Preference questions get flagged instead of counted as reported behavior.
- Group agreement from one session counts once.
- You trace any requirement in the design brief back to the grade of the evidence under it.

## Where it fits

Evidence standards is a reference primitive other skills load.

- [synthesize](https://euxlab.com/system/skills/synthesize) applies it to every insight, because the weakest-grade rule decides how strong each insight is.
- [design-review](https://euxlab.com/system/skills/design-review) uses it for the Evidence review, because that review asks of every screen which insight it serves and where that is written, then reports the grade at the source of each trace chain.

See the full map at [euxlab.com/system](https://euxlab.com/system).
