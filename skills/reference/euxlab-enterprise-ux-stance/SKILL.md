---
name: euxlab-enterprise-ux-stance
description: The Enterprise UX positions baseline - ten design smells and their fixes, applied as labeled judgment calls. Load when reviewing any enterprise design artifact, arguing a design decision, or checking whether a recommendation fits an enterprise context rather than a consumer one.
---

# The Enterprise UX stance

A fixed set of smells that applies even when an engagement documents no standards of its own. Distilled from fifteen years of enterprise engagements.

**How to apply.** Each smell is a labeled judgment call, never a rule violation. Report it as `Smell: <name>` with the evidence that triggered it and the fix. Documented engagement standards override this baseline; say so when they do rather than arguing.

**The frame these all share:** an enterprise user did not choose this software, cannot leave it, uses it all day, and is measured on output that the software mediates. Every smell below is what happens when consumer instincts meet that frame.

## The ten smells

**1. Delight over throughput.** Consumer-grade polish added where an expert needed density and speed. Generous whitespace, one task per screen, an onboarding tour for someone on their four-thousandth session.
→ Optimize for the hundredth use, not the first. Density, keyboard paths, and defaults beat charm.

**2. Muscle-memory break.** A better layout that destroys veteran habits with no migration path.
→ Preserve the motor pattern or stage the change. Cite the Office Ribbon precedent for how a large break gets done without revolt: overlap the old and new, teach in place, never flip overnight.

**3. Adoption theater.** Success claimed from presence metrics. The 94%-login fallacy: mandatory software has 100% adoption and can still be unusable.
→ Measure task outcomes, error rates, and time on task. Logins measure the mandate, not the design.

**4. Shadow-IT blindness.** A design that ignores the coping spreadsheet, or a rollout plan that tries to ban it.
→ Read the spreadsheet as a requirements document written by the user. Absorb the job it does before retiring it. It is design feedback, never a compliance failure.

**5. Silo-busting hero move.** A flow that only works if the org restructures first.
→ Navigate the walls. Design for the org that exists, and name the org change as a separate, priced recommendation if it is genuinely required.

**6. Legacy contempt.** Treating the 20-year-old system and the people who mastered it as the obstacle.
→ Design with them. They hold the domain model, and the old system encodes two decades of edge cases nobody wrote down.

**7. Unpriced friction.** A recommendation with no time, money, or risk translation attached.
→ Attach a number. Spreadsheet thinkers fund numbers, not adjectives. (`/roi-case`, planned for phase 3, does this properly; until then, do the arithmetic inline.)

**8. Requirements by union.** A scope that is the unweighted sum of every stakeholder's wish list.
→ Return to the design brief. A chief designer prunes; a committee accumulates.

**9. Solution-shaped research.** Evidence gathered to confirm a design already chosen.
→ Send it to `/euxlab-evidence-standards` and grade it tainted.

**10. Chartjunk dashboard.** Decoration, low data density, no at-a-glance answer.
→ Data-ink ratio up. Bullet graphs and sparklines over gauges and donuts. One screen, one glance, one question answered.

## Two positions that are not smells

They are constraints to design inside, and both come up constantly.

**Constraint-led innovation.** A mandated design system, a locked platform, an immovable regulation. These are not obstacles to route around; they are the shape of the problem. A solution that requires the constraint to lift is not a solution.

**The prototype paradox.** An AI-built prototype makes the requirements more critical, not less. Cheap execution raises the cost of aiming at the wrong thing, because now you get the wrong thing faster and it looks finished.

## Using this file

This file is the source, not a pointer at one. Each smell is complete enough to
report: the name, what triggers it, and the fix. Where an engagement documents
its own standard, that standard wins and the report says so.
