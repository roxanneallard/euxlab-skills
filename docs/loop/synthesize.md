## What it does

`/synthesize` reads all the sessions of a research round together. It is the only skill in the loop that writes insights. Each insight gets an ID, a grade, and its own file, with a chain of custody back to the raw transcripts. The skill also settles every provisional persona.

An insight inherits the weakest grade among its evidence, not the strongest. Three B-grade quotes make a B insight, never an A. Disagreement between sources gets the same honesty. The skill records it as a contradiction and never picks a winner for you.

## When to reach for it

You invoke this by typing `/synthesize`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when every transcript in a research round has been through the persona skill.

For reading one new transcript instead, use [/create-personas-and-job-stories](https://euxlab.com/system/skills/create-personas-and-job-stories).

## Prerequisites

- The engagement folder scaffolded by [/setup-euxlab-skills](https://euxlab.com/system/skills/setup-euxlab-skills).
- The persona documents for this round in `research/personas/`.
- The transcripts in `research/raw/`.
- `docs/interview-guide.md`, for the assumption register.

It writes one file per insight, such as `research/insights/I01-<slug>.md`, plus `research/insights/index.md`. The index lists every insight with its ID, grade, file, and one-line claim, and every contradiction with its ID and status. The skill also updates the status of each persona and the grades in the interview guide's register.

## From pain point to insight

Every output is the next input. The skill starts from the persona files. Their pain points, workflows, and job stories are the candidate patterns.

It works claim by claim across all transcripts, not transcript by transcript. For each candidate, it goes back to `research/raw/` and collects the evidence from every session, including the sessions that contradict it. A pain point from one persona file stays a candidate until the skill has checked it against every other session.

Each insight file states what is true, the verbatim evidence with citations, the workaround observed, the implication, and the opportunity.

## The chain of custody

Raw data stays immutable. Once raw is editable, no downstream claim can be checked.

Every insight gets an ID, I01, I02, and cites its evidence as a participant ID and line range, such as `P02 L88-95`. "Several participants mentioned" is not a citation. One file per insight gives every insight one address a screen label can point at.

You walk down from any screen in the design to the insight ID it names, to the insight file, to the quote in raw. You walk up from any quote to every insight it supports. If one quote carries four insights, those four are one insight. [/design-review](https://euxlab.com/system/skills/design-review) walks this trace chain for every screen, so a broken link here becomes a finding there.

## Contradictions are findings

When two sources disagree, the skill writes a callout with its own ID, C01, C02, naming both sides. It does not resolve it by siding with the more articulate participant. In enterprise work, a contradiction often means two teams have drifted from one policy. That drift is the design problem.

## No persona stays provisional

Every persona leaves this step in one of three states, each with a written reason.

| State | Means |
|---|---|
| Promoted | Another session corroborates it. The provisional label goes, and the file lists the insight IDs it is evidence for. |
| Merged | Two personas turn out to be one role with matching decision authority. Both citation sets stay. |
| Retired | Nothing else supports it. The file stays, marked as an edge case, with what would promote it. |

A retired persona is kept on purpose. An edge case in enterprise is often a whole team you did not sample.

## Common questions

**Three people agreed in one workshop. Is that three sources?**
No. That is one data point. Counting it three times is consensus laundering.

**What happens to an insight with only one source?**
It stays, marked `n=1, provisional`. The skill does not drop it and does not dress it up as a pattern.

## It's working if

- Every insight lives in its own file named by its ID, with a grade and citations from at least two participants, or the `n=1, provisional` label.
- `research/insights/index.md` lists every insight with its file, and every contradiction.
- Every contradiction has a C number and stays open until evidence settles it.
- No persona in `research/personas/` is still marked provisional.
- Each tested assumption in the register shows a new grade and the insight ID that moved it.
- Claims name their sample. "Handlers on the claims team", not "handlers", when every quote comes from one team.

## Where it fits

This is the third skill step in the loop, between the per-transcript read and the design brief.

- [/create-personas-and-job-stories](https://euxlab.com/system/skills/create-personas-and-job-stories) comes before, because its pain points, workflows, and job stories are the candidates synthesis starts from.
- [/design-brief](https://euxlab.com/system/skills/design-brief) comes after, because it works from `research/insights/index.md` and every requirement cites these insight IDs.

See the full map at [euxlab.com/system](https://euxlab.com/system).
