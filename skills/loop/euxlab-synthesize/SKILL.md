---
name: euxlab-synthesize
description: The cross-transcript pass - turn the provisional personas and the raw research set into cited, ID'd insights with a chain of custody back to raw evidence, and reconcile every provisional persona. Run once all transcripts for a research round have been through /euxlab-create-personas-and-job-stories.
disable-model-invocation: true
---

# Synthesize

`/euxlab-create-personas-and-job-stories` read each session on its own. This reads them together, and it is the only skill that writes insights.

**Input:** everything in `research/personas/` for this round, plus `research/raw/` and `docs/interview-guide.md`.
**Output:** `research/insights/`, one file per insight plus an index, and every provisional persona resolved.

Load `/euxlab-evidence-standards` before you start.

## The chain of custody

Raw data in `research/raw/` is immutable, and that is not negotiable: the moment raw is editable, every downstream claim becomes unverifiable.

Every insight gets an ID (`I01`, `I02`, ...) and its own file. It cites the raw evidence it came from. The citation is `P<nn> L<start>-<end>`, never "several participants mentioned".

Trace direction matters. You must be able to walk **down** from any screen in the design to the insight it names, to the insight file, to the quote in raw. And **up** from any quote to every insight it supports. If a quote is doing work in four insights, that is a signal the insights are the same insight. `/euxlab-design-review` walks this chain for every screen, so a broken link here becomes a finding there.

## Process

### 1. Code across, not down

Start from the persona files: their pain points, workflows, and job stories are the candidate patterns. Work claim by claim across all transcripts, not transcript by transcript. For each candidate, go back to `research/raw/` and collect the evidence from every session that bears on it, including the sessions that contradict it. Reading in sequence produces one insight set per session, which is what the persona files already are.

### 2. Grade every insight

Per `/euxlab-evidence-standards`. The insight inherits the **weakest** grade among the evidence supporting it, not the strongest. Three B-grade quotes make a B insight, not an A.

### 3. Handle contradictions explicitly

Never silently overwrite. When two sources disagree, write a contradiction callout naming both, give it an ID (`C01`, `C02`, ...), and do not resolve it by picking the more articulate participant.

```
> **Contradiction (C01):** P02 L88-95 says approvals always route through the team
> lead. P05 L210-224 says they route directly when the amount is under 5k.
> Unresolved. Both are first-hand. Likely a policy difference between teams;
> needs one confirming observation before either becomes an insight.
```

A contradiction is a finding. In enterprise it usually means two teams have diverged from one policy, which is itself the design problem.

### 4. Reconcile every provisional persona

Every persona in `research/personas/` leaves this step in exactly one of three states, with a written reason:

- **Promoted.** Corroborated by at least one other session. Drop the `provisional` label, add the corroborating participant IDs, and list the insight IDs the persona is evidence for.
- **Merged.** Two provisional personas are the same role. Merge them, keep both citation sets, and state what made them the same. Decision authority must match, per the persona skill's rule.
- **Retired.** The role appeared once and nothing supports it as a pattern. Keep the file, mark it `n=1, retained as an edge case`, and say what would promote it. Do not delete it; an edge case in enterprise is often a whole team you did not sample.

None stay provisional past this step.

### 5. Close the loop on the assumption register

Walk the register in `docs/interview-guide.md`. Every assumption the sessions tested gets its grade updated and the insight ID that moved it. Assumptions that were never tested stay weak and stay visible; do not quietly drop them because the research went somewhere more interesting.

## Output

Write one file per insight, `research/insights/I01-<slug>.md`, so every insight has one address a screen label can point at:

```markdown
### I01: <one-sentence falsifiable claim as the heading>

**Grade:** B
**Sources:** P02 L88-95, P05 L210-224, P07 L44-51
**Contradicts:** C01

- **What is true:** the factual pattern, stated plainly
- **Evidence:** verbatim quotes, original language, each with its citation
- **Workaround observed:** what people do today to cope, or "None observed"
- **Implication:** why this matters and what it costs
- **Opportunity:** what could be done about it, phrased as "X could...", never as a spec
```

Write `research/insights/index.md` listing every insight with its ID, grade, file, and one-line claim, plus every contradiction with its ID and status. `/euxlab-design-brief` works from the index instead of reading everything.

## Anti-patterns

- **The insight that is a summary.** "Users want faster search" restates the transcript. An insight names a mechanism: what is true, why it is true here, and what it costs.
- **Consensus laundering.** Three people agreeing in one workshop is one data point.
- **The orphan insight.** No implication, no opportunity, no decision it could change. Cut it.
- **Sample creep.** An insight stated about "handlers" when every quote comes from one team. Name the sample in the claim.
- **The persona pain point copied as an insight.** A pain point from one persona file is a candidate. It becomes an insight only after you have checked it against every other session.

## Completion criterion

- Every insight has its own file named by its ID, and cites at least two evidence items from at least two participants, or is explicitly marked `n=1, provisional`.
- No insight exists without a citation trail back to raw.
- Every contradiction is written as a callout with an ID, none silently resolved.
- Every provisional persona is promoted, merged, or retired, each with a reason. None remain provisional.
- Every assumption in the interview guide's register that this round tested has an updated grade and the insight ID that moved it.
- `research/insights/index.md` lists every insight with its file, and every contradiction.
