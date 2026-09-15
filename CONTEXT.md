# EUXLab Skills

A collection of agent skills for enterprise UX research and design. The skills form a flow with shared state: each one reads a file in the engagement folder, does one thing, and writes the next file. `/euxlab-setup` writes the per-engagement configuration every other skill reads.

## Language

**Engagement**:
One client project, from the first stakeholder ask to the reviewed artifact. Every skill runs inside exactly one engagement.
_Avoid_: project (too generic), workspace

**Engagement folder**:
The ordinary directory that holds an engagement's state: `docs/`, `GLOSSARY.md`, `research/`. Plain markdown, relative paths, no tool-specific links.
_Avoid_: vault, wiki, repo (when meaning the folder, not a git repo)

**Engagement config**:
`docs/agents/engagement.md`. Client, design system, consent posture, stakeholder map. Written by `/euxlab-setup`, read by every skill.

**Stakeholder ask**:
The request as it arrived: "we need a new dashboard". The input to `/euxlab-grill-the-ask`.
_Avoid_: brief (collides with **Design brief**)

**Interview guide**:
`docs/interview-guide.md`. The ask sharpened, the **Assumption register**, and the interview questions. Written by `/euxlab-grill-the-ask`.

**Assumption register**:
The table of every claim made about the ask, each with a **Grade** and the question that tests it. Lives in the **Interview guide**. `/euxlab-synthesize` updates the grades.

**Grade**:
One of four evidence strengths from `/euxlab-evidence-standards`: A observed, B reported, C inferred, D asserted. A and B are strong. C and D are weak, which means untested, not wrong.

**Raw research**:
Everything in `research/raw/`. Transcripts, recordings, notes. Immutable, consent-checked, and the only place a participant's real name may appear.

**Participant ID**:
`P01`, `P02`, assigned in session order. How a person is named everywhere outside **Raw research**.

**Citation**:
A **Participant ID** plus a line range (`P03 L112-140`) pointing back into **Raw research**. A claim without one does not ship.
_Avoid_: source, reference (both too vague to check)

**Persona**:
A role under constraint, built from one transcript by `/euxlab-create-personas-and-job-stories`. Provisional (`n=1, provisional`) until `/euxlab-synthesize` promotes, merges, or retires it.
_Avoid_: user profile, archetype

**Job story**:
"When [situation], I want to [motivation], so I can [outcome]." Solution-free. Format owned by `/euxlab-outcome-vocabulary`.
_Avoid_: user story

**Insight**:
A falsifiable, cited, graded claim about reality, with an ID (`I01`). Written by `/euxlab-synthesize` into `research/insights/`.
_Avoid_: finding (when meaning an insight), learning

**Contradiction**:
Two first-hand sources that disagree, written as a callout with an ID (`C01`) and never silently resolved.

**Requirement**:
What the design has to make possible, never how, with the **Insight** IDs it serves and an **Observable**. Numbered `R1`, `R2` in the **Design brief**.
_Avoid_: feature, user story

**Observable**:
How anyone would know a **Requirement** worked, with today's number or `baseline unknown` and how to measure it.

**Design brief**:
`docs/design-brief.md`. The design assignment: requirements, constraints, and the out-of-scope list, confirmed by a named stakeholder with a date. Written by `/euxlab-design-brief`.
_Avoid_: brief on its own, Hill (retired in 0.1.2)

**Axis**:
One of the two reviews `/euxlab-design-review` runs: Standards or Evidence. Reported side by side and never merged.

**Smell**:
One of the ten enterprise design smells in `/euxlab-enterprise-ux-stance`. Reported as a labeled judgment call, never a rule violation.

**Frontier**:
The set of open decisions whose prerequisites are settled. `/euxlab-grilling` asks the whole frontier in one round.

**Loop**:
The sequence the suite runs: request, `/euxlab-grill-the-ask`, interviewing, `/euxlab-create-personas-and-job-stories`, `/euxlab-synthesize`, `/euxlab-design-brief`, designing, `/euxlab-design-review`. Every output is the next input. `/euxlab-setup` is step zero and runs once, before the first loop.
_Avoid_: pipeline, spine, main flow

**Handwork**:
A loop step that is deliberately not a skill: interviewing stakeholders and users, and designing in Figma. The skills carry the state between them.

**Screen label**:
The insight ID a screen names in its frame name or an annotation ("Case overview (I02)"). The first link `/euxlab-design-review` checks in the chain screen, insight, source, requirement.

## Relationships

- An **Engagement** has one **Engagement folder** and one **Engagement config**
- A **Stakeholder ask** produces one **Interview guide**, which holds one **Assumption register**
- One transcript in **Raw research** produces one **Persona**
- An **Insight** cites two or more **Participant IDs**, or is marked `n=1, provisional`
- A **Requirement** serves one or more **Insights**
- A **Design brief** holds the **Requirements** that `/euxlab-design-review` checks by number

## Flagged ambiguities

- "brief" meant both the incoming request and the design assignment. Resolved: the incoming request is the **Stakeholder ask**, the assignment is the **Design brief**.
- "Hill" (Who/What/Wow) was the checkable bar before 0.1.2. Resolved: replaced by the **Requirement** with its **Observable**, inside the **Design brief**.
- "vault" is not a domain term. The suite needs an **Engagement folder**, nothing more.
