## What it does

Enterprise UX stance holds a fixed baseline of ten enterprise design smells, each with its fix. The shared frame: an enterprise user did not choose this software, cannot leave it, uses it all day, and gets measured on output the software mediates. Each smell is what happens when consumer instincts meet that frame.

A smell is a labeled judgment call, never a rule violation. The baseline applies even when an engagement documents no standards, and a documented engagement standard always wins over it.

## When to reach for it

Type `/euxlab-enterprise-ux-stance`, or the agent reaches for it on its own when a task fits. [euxlab-design-review](https://euxlab.com/system/skills/euxlab-design-review) loads it for the Standards review. [euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) and [euxlab-design-brief](https://euxlab.com/system/skills/euxlab-design-brief) cite single smells from it. Inside the loop you rarely type it yourself.

Reach for this when you review an enterprise design artifact, argue a design decision, or check whether a recommendation fits an enterprise context instead of a consumer one.

For grading the evidence behind a decision instead, use [euxlab-evidence-standards](https://euxlab.com/system/skills/euxlab-evidence-standards).

## The ten smells

| Smell | The fix, in short |
|---|---|
| Delight over throughput | Optimize for the hundredth use, not the first |
| Muscle-memory break | Preserve the motor pattern or stage the change |
| Adoption theater | Measure task outcomes, not logins |
| Shadow-IT blindness | Read the coping spreadsheet as a requirements document |
| Silo-busting hero move | Design for the org that exists |
| Legacy contempt | Design with the people who mastered the old system |
| Unpriced friction | Attach a time, money, or risk number |
| Requirements by union | Prune back to the design brief |
| Solution-shaped research | Grade it tainted |
| Chartjunk dashboard | One screen, one glance, one question answered |

## Why a smell, not a rule

A finding reads `Smell: <name>`, followed by the evidence that triggered it and the fix. Framing it as judgment keeps the conversation on the evidence and the fix. When your engagement documents its own standard, the report defers to it and says so instead of arguing the general case.

## Two constraints, not smells

Constraint-led innovation treats a mandated design system, a locked platform, or an immovable regulation as the shape of the problem. A solution that needs the constraint to lift is not a solution. This is why [euxlab-setup](https://euxlab.com/system/skills/euxlab-setup) records your design system as binding.

The prototype paradox says an AI-built prototype makes requirements more critical, not less. Cheap execution gets you the wrong thing faster, and it looks finished.

## Common questions

**What if my client has its own design standards?**
Their standards win. The report names the engagement standard and notes where it overrides the baseline.

## It's working if

- Review findings read `Smell: <name>`, each with the evidence and a fix.
- Where your engagement documents a standard, the report defers and says so.
- Recommendations carry a time, money, or risk number instead of adjectives.
- Success claims cite task outcomes and error rates, not login counts.
- A coping spreadsheet shows up as input to the design, not as something to ban.

## Where it fits

Enterprise UX stance is a reference primitive other skills load.

- [euxlab-design-review](https://euxlab.com/system/skills/euxlab-design-review) checks every screen against the ten smells, because the Standards review needs a baseline even when the engagement documents none.
- [euxlab-evidence-standards](https://euxlab.com/system/skills/euxlab-evidence-standards) takes over for solution-shaped research, because grading evidence is its job.

See the full map at [euxlab.com/system](https://euxlab.com/system).
