---
name: euxlab-create-personas-and-job-stories
description: Read one research transcript into a professional enterprise persona - role, workflows, pain points, needs, and solution-free job stories, every trait cited. Run per transcript, before /euxlab-synthesize, whenever an interview or contextual inquiry recording has been transcribed.
disable-model-invocation: true
---

# Create personas and job stories

The first pass over fieldwork. One transcript in, one persona document out.

**Input:** a transcript in `research/raw/`, plus `docs/agents/engagement.md` and `docs/interview-guide.md`.
**Output:** one document in `research/personas/<role-slug>.md`.

This runs before `/euxlab-synthesize` on purpose. This is the per-transcript read; `/euxlab-synthesize` is the cross-transcript read. This skill describes one person's work. It does not write insights: an insight is a claim about a pattern, and one transcript cannot show a pattern. Everything written here is provisional until synthesis reconciles it against the other sessions.

## Before you start

1. Read `docs/agents/engagement.md`, specifically the consent posture and the participant ID scheme.
2. Read `docs/interview-guide.md` so you know which assumptions this session was meant to test.
3. Read the transcript in full before writing a single line. Do not summarize as you go; you will anchor on the first ten minutes if you do.
4. Load `/euxlab-outcome-vocabulary` for the job story and outcome grammar, and `/euxlab-evidence-standards` for grading.

## Professional personas, not consumer personas

No age. No stock photo. No hobbies. No "Sarah loves yoga". An enterprise persona is a role under constraint, and only the fields that change a design decision belong in it.

Ten fields. Each one is a design lever; if you cannot name the decision a field would change, you have written biography.

1. **Role and mandate.** What they are accountable for, and to whom. The job actually being done, not the title on the org chart.
2. **Expertise band.** Novice, competent, or expert, with tenure in the *domain* separated from tenure in the *tool*. Someone with 20 domain years and 3 tool months is a different design problem from the reverse. Drives density and shortcut decisions.
3. **Session shape.** Volume per day, time per task, interruption profile, and whether the work is one long sitting or forty fragments. A design for forty fragments is a different design.
4. **Tool stack, shadow IT included.** Every system named in the transcript, plus the spreadsheets, the notebooks, the WhatsApp group, the second monitor with the legacy terminal. Read as requirements, never as a compliance failure.
5. **Decision authority.** What they do alone, what needs a second signature, what they escalate, and how long each takes. Half of enterprise friction lives here and almost none of it is in the UI.
6. **Consequence of error.** What breaks, who finds out, how fast it is reversible. Sets the confirmation, undo, and audit posture.
7. **Incentives.** What they are measured on, which is often not what the system optimizes for. When those two diverge, that gap explains most of the workarounds.
8. **Handoffs.** Who feeds them work, who they feed, named as roles, with the artifact that crosses the boundary.
9. **Immovable constraints.** Regulation, contract, works council, legacy behavior. Things no design gets to change.
10. **Vocabulary.** The words this role uses for the domain. Push them to `GLOSSARY.md`, and flag any word doing more than one job.

## The document format

One document per interviewee, two numbered sections, in this order. This format is the contract with `/euxlab-synthesize`; do not reorder it and do not drop a section.

### Frontmatter and byline

```yaml
---
type: persona
name: <Role-based persona name (Team)>
participant: P<nn>
sources: [research/raw/<transcript-file>]
status: n=1, provisional
synthesized: YYYY-MM-DD
---
```

Title: `# <Persona name>: Persona and Jobs To Be Done`

The persona name is role-based, never the person's name. "Complaints Specialist (Service Excellence)", not "Nilima".

`sources` is a relative path into `research/raw/`, not a tool-specific link. It resolves in any editor.

### 1. Persona

- **Chips:** three or four short backtick-wrapped facts that make this role distinct (`20 years in the domain` · `Cross-tool investigator`)
- **Stands out:** three or four bullets on what makes this session's perspective different from the others
- **Job title / Department / Systems used:** scannable facts, one line each
- **Context:** one paragraph of narrative background
- **Goals:** what they are trying to achieve in the work itself, never features
- **Key workflows:** the concrete sequences they actually perform, step by step
- **Pain points:** each grounded in the transcript, phrased as the structural problem rather than the complaint, with the workaround observed (or "None observed") and its citation
- **Representative quote:** one verbatim quote, original language, blockquoted
- **What they need:** three to five bold-led needs, one line each. "**One investigation surface:** see all dispute evidence without switching tools."

Cover the ten fields above inside these headings. A field the transcript never touched is written as `not covered`.

### 2. Jobs To Be Done

Open with `**Core functional job:** <one sentence>`.

Then four to six jobs:

```markdown
### Job N: <verb-first job name>
- **Job story:** When <situation>, I want to <motivation>, so I can <outcome>.
- **Struggle moment:** the quote the story came from, with P<nn> L<start>-<end>
- **Desired outcomes:** two statements in strict Ulwick format from `/euxlab-outcome-vocabulary`
- **Needs statement:** A <role> needs a way to <capability> so that they can <outcome>.
```

Jobs are solution-agnostic. Desired outcomes are measurable directions, not features.

## Citation discipline

Every field carries `P<nn> L<start>-<end>` pointing into the transcript. Every quote is verbatim and stays in its original language; a Dutch quote stays Dutch.

- An uncited field is **deleted**, not guessed.
- A field the transcript never touched is written as `not covered`. That is not a failure. It is the input that sharpens the next round of questions.
- A trait carried over from a previous engagement is a fabrication. Cite this transcript or leave it out.

## Job stories

Strict format from `/euxlab-outcome-vocabulary`: *When [situation], I want to [motivation], so I can [outcome].*

Situation first, because in enterprise the trigger carries the constraint. Each story cites the moment of struggle it came from, never a stated preference. Four to six stories per persona; if you have twelve, you have written the feature list.

## Anti-patterns this skill refuses

- **One persona per job title.** Two titles doing the same job are one persona. One title doing two jobs is two.
- **Two roles merged because they share a screen.** If decision authority differs, they are different personas no matter how similar the workflow looks.
- **The composite average.** A persona built from "what most people said" describes nobody. Build from this transcript; let `/euxlab-synthesize` merge.
- **A story whose expected outcome is a feature.** "So I can use the new dashboard" is not an outcome.
- **An insight written here.** A pattern you notice in one transcript goes in as a cited pain point. `/euxlab-synthesize` decides whether it is a pattern, and only `/euxlab-synthesize` writes insights.

## Redaction, on the way out

Per the consent guardrail in `docs/agents/engagement.md`:

- Participant ID only in the body. The real name appears once, in the byline, and only if the consent posture allows it in this repo.
- Employer, team, and customer names generalized.
- Quotes scrubbed of identifying detail: a named colleague, a case number, a customer, an unusual role that identifies the person by itself.
- The transcript stays in `research/raw/` and stays immutable. You read it; you never edit it.

## Completion criterion

- Every persona field carries a participant ID plus a line range, or the literal `not covered`.
- Both numbered sections are present, in order, with the field names above.
- Every pain point names the structural problem, the workaround observed, and its citation.
- Every job story is in strict format, names no solution in the motivation, and cites the struggle moment it came from.
- The document contains no insights and no insight IDs.
- No persona merges participants with different decision authority.
- The document is labeled `n=1, provisional` in its frontmatter until `/euxlab-synthesize` reconciles it.
- Zero uncited traits. One uncited trait and the file does not ship.
