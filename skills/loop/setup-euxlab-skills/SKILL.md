---
name: setup-euxlab-skills
description: Configure one engagement so the other EUXLab skills know how it works - client, domain, design system, consent posture, stakeholder map, and the folder scaffold. Run once at the start of an engagement, before any other skill in the suite.
disable-model-invocation: true
---

# Setup EUXLab skills

Scaffold the per-engagement state that every other skill in the suite reads and writes. Nothing else in the suite works without this: the skills are a flow with shared state, and this writes the state.

This is a prompt-driven skill, not a script. Explore, present what you found, confirm with the user, then write.

## What this needs

A folder you can write to, and an agent that can read and write files in it. That is the whole list. The state this suite shares is plain markdown files in an ordinary directory. Any editor opens them, `grep` searches them, and git versions them.

One consequence worth stating when you write the scaffold: every path in these files is relative to the engagement folder, and every cross-reference is an ordinary markdown link. Nothing uses a tool-specific link format, so the folder survives being opened in a different editor, zipped and mailed, or committed to a repo.

## Process

### 1. Explore

Read what is already there. Do not assume an empty directory.

- `docs/agents/engagement.md` - has this skill run before?
- `GLOSSARY.md`, `CLAUDE.md`, `AGENTS.md`, `README.md` at the root
- `research/`, `docs/drr/`, `.scratch/` - which parts of the scaffold exist
- Any existing transcripts, notes, or decks lying loose in the directory, which tell you the engagement is already underway
- Whether a design system is detectable from any code or design files present

An empty directory is a normal starting point, not a problem to solve. Do not ask the user to go and build a knowledge base first.

### 2. Present findings and ask

Summarize what exists and what is missing. Then take the sections in order, one section, one answer, then the next. Lead each section with the recommended answer so the user can accept it in a word. Skip any section that exploration already settled.

**Section A - Client and domain.**
Client name, product or system name, the domain in one line, and the engagement's short slug (used in filenames). Propose the slug from the directory name.

**Section B - Design system.**
The hard constraint every artifact obeys. Offer:
- **A named design system** (NL Design System, a client system, a vendor system). Record the name, the version, and where its component list lives.
- **None yet**, which becomes an explicit risk rather than a blank.

Per Constraint-Led Innovation in `/enterprise-ux-stance`, this is the shape of the problem, not an obstacle. Record it as binding.

**Section C - Consent and retention posture.**
The one place this suite is stricter than its engineering parent, because the raw material is people. Ask:
- Is there a signed consent form or a DPA covering research recordings? Where does it live?
- Retention period for raw transcripts and recordings.
- Participant identification scheme (default: `P01`, `P02`, ... assigned in order of session).
- Anything the client forbids leaving their environment (some clients forbid cloud transcription entirely; this decides whether transcripts may be uploaded at all).

Default posture if the user does not know: participants are identified by ID everywhere outside `research/raw/`, raw data never leaves the engagement folder, and nothing is uploaded to a third-party service until the user confirms the DPA covers it.

**Section D - Stakeholder map.**
Who asks for the work, who signs off, and who is measured on the outcome. Names and roles. Three or four lines is enough; this exists so `/grill-the-ask` knows whose assumptions it is grading and `/design-brief` knows whose name goes on the confirmation.

**Section E - Archive target.**
Where this engagement goes at close. Default to `none`, meaning it stays where it is, because a folder of markdown needs nowhere else to be. Offer a path or a shared drive. This is the only thing that leaves the engagement folder, so the consent posture in section C governs it.

**Section F - Signal tracker.** Only ask if `/triage-signals` is installed (v0.3). Otherwise skip silently.

### 3. Confirm

Show a draft of `docs/agents/engagement.md` and the folder tree before writing. Let the user edit.

### 4. Write

Create the scaffold:

```
<engagement>/
├── docs/
│   ├── agents/engagement.md   # everything from sections A-F
│   ├── interview-guide.md     # /grill-the-ask writes this
│   ├── design-brief.md        # /design-brief writes this
│   └── drr/                   # Design Rationale Records (v0.2 fills this)
├── GLOSSARY.md                # /grill-the-ask and the persona skill feed this
├── research/
│   ├── raw/                   # immutable, consent-checked; assets included
│   ├── personas/              # professional personas + job stories, per transcript
│   └── insights/              # cited, ID'd synthesis output
└── .scratch/                  # working files, never a source of truth
```

Create `docs/` and the three `research/` leaves. Do not create empty
`interview-guide.md` or `design-brief.md` files: the skill that writes one is
also what proves the step ran.

Seed `docs/agents/engagement.md` from [engagement-template.md](./engagement-template.md) and `GLOSSARY.md` from [glossary-template.md](./glossary-template.md).

Add a `## Agent skills` block to `CLAUDE.md` if one exists, or `AGENTS.md` if that is the one present. If neither exists, ask which to create rather than picking:

```markdown
## Agent skills

This engagement is configured for the EUXLab skills suite.
Engagement config: `docs/agents/engagement.md`. Glossary: `GLOSSARY.md`.
Raw research in `research/raw/` is immutable and may contain PII; participants
are identified by ID everywhere else.
```

Write `research/raw/README.md` containing the immutability and consent rules verbatim, because that folder is the one an outsider is most likely to mishandle.

### 5. Done

Tell the user setup is complete and name the entry points: `/grill-the-ask` when a stakeholder ask has arrived, `/create-personas-and-job-stories` when a transcript has landed in `research/raw/`. If they ask what to open these files in: anything. They are markdown on their own disk. Mention that `docs/agents/engagement.md` is editable directly and that re-running this skill is only for switching clients or starting over.

## Completion criterion

`docs/agents/engagement.md` exists with every section filled or explicitly marked `not yet known`, the folder scaffold matches the tree above, and the consent posture names a retention period and an identification scheme. A blank field is allowed; a missing section is not.
