## What it does

`/euxlab-create-personas-and-job-stories` reads one interview transcript and writes one persona document in two sections. The Persona section holds the role, key workflows, pain points, and what the person needs. The Jobs To Be Done section holds four to six solution-free job stories, each citing the struggle moment it came from.

The skill writes no insights. An insight is a claim about a pattern, and one transcript cannot show a pattern. Everything it writes is n=1, provisional. The skill builds only from this transcript and labels the result as provisional in its frontmatter. It never averages across sessions or carries a trait over from a past engagement. Merging, confirming, and every insight happen later, in [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize).

## When to reach for it

You invoke this by typing `/euxlab-create-personas-and-job-stories`. The agent won't reach for it on its own. In the Claude desktop and web apps you name the skill in plain words instead, since those apps have no slash commands.

Reach for this when an interview or contextual inquiry has been transcribed and the file sits in `research/raw/`. Run it once per transcript.

For patterns across all your transcripts instead, use [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize).

## Prerequisites

- The engagement folder scaffolded by [/euxlab-setup](https://euxlab.com/system/skills/euxlab-setup). The skill reads the consent posture and participant ID scheme from `docs/agents/engagement.md`.
- `docs/interview-guide.md` from [/euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask), so the skill knows which assumptions this session was meant to test.
- One transcript in `research/raw/`. The skill reads it and never edits it.

It writes `research/personas/<role-slug>.md` and adds the role's vocabulary to `GLOSSARY.md`.

## A role under constraint

An enterprise persona has no age, no stock photo, and no hobbies. It describes a role under constraint, and each field is a design lever. Expertise band separates years in the domain from months in the tool, because 20 domain years and 3 tool months is a different design problem from the reverse. Decision authority records what the person does alone and what needs a second signature. Shadow IT counts as a requirement, never as a compliance failure.

The test for any field: name the design decision it would change. If you cannot, you have written biography.

Roles split on the job, not the title. Two titles doing one job make one persona. Two people on the same screen with different decision authority make two.

## Pain points, not insights

Each pain point names the structural problem, not the complaint. It carries the workaround you observed, or "None observed", and its citation. When you notice a pattern in one transcript, it goes in as a cited pain point. Only [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize) decides whether it is a pattern.

Every output is the next input. Synthesis starts from these pain points, workflows, and job stories as its candidate patterns, then checks each one against every other session.

## Cited or deleted

Every field carries a pointer back to the transcript, a participant ID plus a line range such as `P04 L112-140`. Quotes stay verbatim and in their original language. A Dutch quote stays Dutch.

A field without a pointer gets deleted, not guessed. A field the session never touched reads `not covered`. That gap is useful. It sharpens the questions for the next round.

Redaction happens on the way out. The persona name is a role, such as "Complaints Specialist (Service Excellence)", never the person's name.

## Job stories without solutions

Each job story follows one grammar: When situation, I want to motivation, so I can outcome. Situation comes first because in enterprise work the trigger carries the constraint. Each story cites the moment of struggle it came from, not a stated wish. If you end up with twelve stories, you have written a feature list.

## It's working if

- Every persona field shows a participant ID and line range, or the words `not covered`.
- The persona name is a role, and the document holds no age, photo, or hobbies.
- Every pain point names the structural problem, the workaround observed, and its citation.
- No job story names a screen, feature, or product in its motivation or outcome.
- The document holds no insights and no insight IDs, and the frontmatter reads `n=1, provisional`.

## Where it fits

This is the second skill step in the loop. It runs after interviewing and before synthesis.

- [/euxlab-grill-the-ask](https://euxlab.com/system/skills/euxlab-grill-the-ask) comes before, because its interview guide says what each session was meant to test.
- [/euxlab-synthesize](https://euxlab.com/system/skills/euxlab-synthesize) comes after, because it reads this document format as its contract, turns its pain points into candidate insights, and promotes, merges, or retires each persona.

See the full map at [euxlab.com/system](https://euxlab.com/system).
