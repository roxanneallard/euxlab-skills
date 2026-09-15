# Attribution

This skill is a derivative work. It rewrites Matt Pocock's `grilling` skill
(`skills/productivity/grilling/SKILL.md`, v1.2.3, MIT licensed) in the house
voice of this suite.

Copyright (c) 2026 Matt Pocock. See the repo LICENSE for the full MIT text.

Source: https://github.com/mattpocock/skills

## What was kept

The mechanics, unchanged in substance:

- The subject mapped as a tree of decisions
- Rounds, and the frontier as the set of decisions whose prerequisites are settled
- The whole frontier asked in one round, numbered, each with a recommended answer
- The `❓ / ➡️` question format
- A question depending on another open question deferred to a later round
- Facts are the agent's job, decisions are the user's
- Fact-finding never blocks the rest of the round
- Done when the frontier is empty, and no action before the user confirms

## What changed

- Rewritten in the suite's voice: short sentences, active voice, no em dashes
- A `Pressure` section added, covering evidence behind claims, contradictions put
  back to the user, vague targets named, solutions worked back to the decision
  underneath, and recording who ruled something out
- Framing widened past the codebase, because the subject here is usually a
  stakeholder ask
