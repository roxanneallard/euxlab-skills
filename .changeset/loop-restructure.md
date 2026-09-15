---
'euxlab-skills': patch
---

Restructure the library around the loop. Every output is the next input.

- `skills/getting-started/` and `skills/main-flow/` merge into `skills/loop/`. `/setup-euxlab-skills` is step zero. The five loop skills follow in order.
- `/create-personas-and-job-stories` no longer writes insights. A persona file holds role, workflows, pain points, needs, and job stories. A pattern you notice in one transcript goes in as a cited pain point.
- `/synthesize` is the only skill that writes insights, one file per insight (`research/insights/I01-<slug>.md`), so every insight has one address.
- `/design-brief` adds a tracing section: every screen names the insight ID it serves.
- `/grill-the-brief` is now `/grill-the-ask`.
- `/setup-euxlab-skills` creates all three `research/` leaves: `raw/`, `personas/`, and `insights/`.
- `/design-review` walks each screen from its label to the insight, to its source in raw, to the requirement in the brief, and reports a trace table.
