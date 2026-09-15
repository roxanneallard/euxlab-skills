# euxlab/skills: Enterprise UX Skills for Real Designers

**Concept document** · Roxanne Allard · August 2026
A skill suite and agentic loop for Enterprise UX work, modeled on the quality bar of Matt Pocock's `mattpocock/skills` and grounded in fifteen years of enterprise practice.

> **Status note.** This is the design document, written before v0.1 shipped. Some names changed on the way: `/to-hills` became `/design-brief`, Hills became requirements with an observable, and `/grill-the-ask` now writes an interview guide. The [README](../README.md) describes what is built.

---

## 1. What makes Matt's system work

Research across aihero.dev/skills, the `mattpocock/skills` repo (25 skills, MIT, v1.2), and his `/writing-for-agents` reference surfaced eight load-bearing ideas. Everything in this concept is a deliberate transfer of one of them.

1. **Grouped by when you reach for them, not by topic.** Six groups: Getting Started, The Main Flow, Shaping, Upkeep, Productivity, Reference. The taxonomy answers "what situation am I in?", never "what discipline is this?".
2. **A spine where each output is the next input.** The main flow (grill → spec → tickets → implement → review) is a compounding chain. Tuning one step improves the whole workflow. Skills that don't feed the spine are explicitly labeled on-ramps, detours, or standalone.
3. **One primitive, many wrappers.** `/grilling` (interview in rounds; the frontier of askable questions; facts are the agent's job, decisions are the human's) is a single source of truth. `/grill-me`, `/grill-with-docs`, `/triage`, and `/wayfinder` all run it internally rather than restating it.
4. **A reference vocabulary layer underneath.** `/codebase-design`, `/domain-modeling`, and `/tdd` are model-invoked references other skills cite. Vocabulary lives in exactly one place.
5. **Verification before construction.** TDD's red-before-green: write the checkable success condition first, at pre-agreed seams, one vertical slice at a time. His anti-pattern list (tautological tests, implementation-coupled tests, horizontal slicing) is what keeps agent output honest.
6. **Two-axis review, never merged.** `/code-review` runs Standards and Spec as parallel sub-agents and reports them side by side, because a change can pass one axis and fail the other. Standards always carry a fixed "smell baseline" (Fowler smells) applied as labeled judgment calls that documented repo standards can override.
7. **Explicit state and setup.** `/setup-matt-pocock-skills` writes per-repo config (issue tracker, triage label vocabulary, doc layout) that every other skill assumes. `CONTEXT.md` holds the glossary, ADRs hold decisions, the tracker holds work. Skills read state; they never carry it.
8. **Context hygiene as a first-class concern.** Keep the thinking phases in one unbroken window, start each build fresh from a self-contained ticket, and treat phase boundaries (continue / clear / handoff / subagent / compact) as a real decision. `/handoff` makes sessions portable and redacts secrets.

Underneath all of it sits his writing discipline: context pointers with sharp trigger wording, progressive disclosure, completion criteria that are checkable and demanding ("every modified model accounted for", not "understanding reached"), leading words that recruit pretrained concepts, positive phrasing over prohibition, and relentless pruning against sediment.

---

## 2. The translation

The suite is not "Matt's skills with UX words swapped in". It maps the *roles* his objects play onto the objects that play those roles in Enterprise UX practice.

| Role in the loop | Engineering (Matt) | Enterprise UX (euxlab/skills) |
|---|---|---|
| The workspace | Git repo | Engagement workspace (one per client project) |
| Raw material | Codebase | Immutable research raw data (notes, transcripts, recordings, shadow-IT sightings) |
| The failing test, written first | Red test at an agreed seam | Hill (Who/What/Wow) + Desired Outcome Statements, agreed before design starts |
| The seam | Public interface under test | Touchpoint / workflow step where the design change lands and gets validated |
| Implementation | Code | Design artifacts: maps, wireframes, prototypes |
| Green | Test passes | Sponsor users complete the job at the Wow bar (usability test, metric) |
| The refactor/review stage | `/code-review` (Standards + Spec) | `/design-review` (Standards + Evidence) |
| Smell baseline | Fowler's code smells | The Enterprise UX smell baseline, distilled from fifteen years of enterprise engagements (section 6) |
| Glossary | `CONTEXT.md` via `/domain-modeling` | `GLOSSARY.md` per engagement; enterprise domain language is half the job |
| ADRs | Architecture Decision Records | Design Rationale Records (DRRs), per Brooks: capture the whys while they're cheap |
| Issue tracker | GitHub issues + triage labels | Signal tracker: research repo entries + triage state machine |
| Tests you didn't write | Incoming bugs → `/triage` | Incoming signals (feedback, support tickets, shadow IT, stakeholder asks) → `/triage-signals` |
| Long-term memory | The repo itself | The reference skills, plus your own knowledge base if you keep one. Closed engagements file case studies back into it |
| The big-fog planner | `/wayfinder` decision map | `/discovery-map` for engagement-scale discovery |

Two things have no engineering analog and are deliberately added because they are what makes it *Enterprise* UX: the ROI translation (friction into time, money, and risk, for spreadsheet thinkers) and the consent guardrail (research raw data is PII; redaction is a rule, not a habit).

---

## 3. The suite at a glance

Repo shape mirrors Matt's exactly: one folder per skill, `SKILL.md` inside, MIT, installable with `npx skills add` or as a Claude plugin. User-invoked skills set `disable-model-invocation: true`; reference skills stay model-invoked so other skills can reach them.

**01 Getting Started**
| Skill | One line |
|---|---|
| `/setup-euxlab-skills` | Configure one engagement so the other skills know how it works. |
| `/ask-euxlab` | Router: which skill fits the situation you're in. |

**02 The Main Flow** (brief → validated handoff, in order)
| Skill | One line |
|---|---|
| `/grill-the-ask` | Get interviewed about a stakeholder ask; record assumptions and glossary terms as you go. |
| `/to-research-plan` | Turn graded assumptions into a plan: hypotheses, methods, sample, guides. |
| `/create-personas-and-job-stories` | Read one transcript into a professional persona and solution-free job stories, every trait cited. |
| `/synthesize` | Turn raw research data into cited, coded insights. |
| `/to-hills` | Turn insights into Hills and Desired Outcome Statements: the checkable bar, written before design. |
| `/brief-design-agent` | Turn one Hill into a self-contained brief a design agent can execute cold. |
| `/design-review` | Review artifacts against Standards and Evidence, in parallel, side by side. |
| `/playback` | Story-driven alignment: present, capture decisions as DRRs, close the loop. |

**03 Shaping** (explore an open question; the answer feeds the flow)
| Skill | One line |
|---|---|
| `/discovery-map` | Chart a huge, foggy engagement as a map of decision tickets, and settle them. |
| `/prototype` | Answer one design question with a throwaway: fake door, concierge, or vibe-coded build. |
| `/desk-research` | Get a cited answer, your own notes first, then primary web sources. |

**04 Upkeep** (keeps the engagement healthy; generates work for the flow)
| Skill | One line |
|---|---|
| `/triage-signals` | Move raw signals through a state machine into design-ready briefs. |
| `/insight-lint` | Health-check the research repo: stale insights, orphan personas, coverage gaps, contradictions. |
| `/workflow-audit` | Run the six-step workflow map to surface friction worth designing away. |
| `/roi-case` | Translate a chosen friction into time, money, and risk: the artifact that gets budget. |

**05 Productivity** (human-facing workflows)
| Skill | One line |
|---|---|
| `/stakeholder-questionnaire` | Turn open questions into a doc a stakeholder fills in (interviews you about the *send*). |
| `/handoff` | Compact the session into a portable doc for the next agent; participants redacted. |
| `/plain-english` | Re-pitch the last output without jargon, in the reader's register (both directions: business↔design). |
| `/post` | Draft public writing in one of the four registers, checked against your own published voice. |

**06 Reference** (the vocabulary layer other skills invoke or cite)
| Skill | One line |
|---|---|
| `/grilling` | The interview primitive: rounds, the frontier, facts vs decisions. Mechanics from Matt's, rewritten in the house voice. |
| `/evidence-standards` | What counts as good evidence; the research anti-patterns. |
| `/enterprise-ux-stance` | The positions baseline: the design smells and their fixes (section 6). |
| `/mapping-vocabulary` | Kalbach's alignment-diagram language: map types, touchpoints, front/back stage. |
| `/outcome-vocabulary` | JTBD/ODI language: job map, outcome statement format, opportunity algorithm. |
| `/metrics-vocabulary` | Tullis & Albert: performance, issue-based, self-reported metrics; SUS; severity grading. |
| `/design-rationale` | The DRR format and when a decision earns one. |

28 skills against Matt's 25 at v1.2. The three extra are the enterprise tax: the persona pass, the ROI translation, and the consent guardrail.

---

## 4. The main flow, in detail

Each skill below states its input, output, and completion criterion. Criteria follow Matt's rule: checkable and demanding, never "understanding reached".

### `/grill-the-ask`
A stakeholder ask has arrived ("we need a new dashboard", "make the portal easier"). Runs `/grilling` against it, plus two side effects per round: every fuzzy or overloaded term goes to `GLOSSARY.md` (an "account" doing three jobs is as fatal in a tax portal as in a codebase), and every claim the stakeholder makes lands in the **assumption register**, graded by evidence strength.
**Output:** sharpened brief + graded assumption register + updated glossary.
**Completion criterion:** the question frontier is empty and every assumption in the register carries a grade and a proposed test. Do not proceed to research on an ungraded register.

### `/to-research-plan`
No interview; pure synthesis of the grilled brief. Selects methods by matching each weak assumption to the question it really is, using Sharon's question→technique mapping (want it? → demand validation; can they use it? → usability test; what do they do? → observation over opinion) and Leavy's sampling vocabulary to size and justify the sample. Writes recruitment criteria, discussion guides, and the consent/GDPR posture from the engagement config.
**Completion criterion:** every weak-graded assumption maps to at least one method, and no method appears without an assumption it tests. Behavior methods outrank attitude methods wherever the assumption is about behavior.

### `/create-personas-and-job-stories`
The first pass over fieldwork, one transcript at a time. Input is an uploaded or recorded transcript in `research/raw/` plus the research plan that produced it. Output is one professional persona file and its job stories in `research/personas/`. This runs *before* `/synthesize` on purpose: this is the per-transcript read, `/synthesize` is the cross-transcript read, and personas written here are provisional until synthesis reconciles them.

**Professional personas, not consumer personas.** No age, no stock photo, no hobbies, no "Sarah loves yoga". An enterprise persona is a role under constraint, and the fields are the ones that change a design decision:

1. **Role and mandate.** What they are accountable for, and to whom. Not the job title on the org chart, the job actually being done.
2. **Expertise band.** Novice, competent, expert, and tenure in the domain versus tenure in the tool. Drives the density and shortcut decisions, per "optimize for the hundredth use".
3. **Session shape.** Volume per day, time per task, interruption profile, whether the work is one long sitting or 40 fragments. A design for 40 fragments is a different design.
4. **Tool stack, shadow IT included.** Every system named in the transcript, including the coping spreadsheet, read as requirements rather than as a compliance failure.
5. **Decision authority.** What they can do alone, what needs a second signature, what they escalate. Half of enterprise friction lives here.
6. **Consequence of error.** What breaks, who finds out, how fast it is reversible. Sets the confirmation and undo posture.
7. **Incentives.** What they are measured on, which is often not what the system optimizes for.
8. **Handoffs.** Who feeds them work and who they feed, named as roles, with the artifact that crosses the boundary.
9. **Immovable constraints.** Regulation, contract, works council, legacy system behavior. Things no design gets to change.
10. **Vocabulary.** The words this role uses for the domain, pushed to `GLOSSARY.md` and flagged when one word is doing three jobs.

Every field carries a citation: participant ID plus transcript line range. An uncited field is deleted, not guessed. Fields the transcript never touched are written as `not covered`, which is what makes the next research plan sharper.

**Job stories over user stories.** Strict format, per `/outcome-vocabulary`: *When [situation], I want to [motivation], so I can [expected outcome].* Situation first, because in enterprise the trigger carries the constraint. No persona name in the story, no solution noun in the motivation ("when I want to click export" is a design decision wearing a story's clothes), and each story anchored to a quoted moment of real struggle, not a stated preference. Job stories here are the qualitative layer; the strict Ulwick outcome statements come later in `/to-hills`.

Anti-patterns this skill refuses: one persona per job title, two roles merged because they share a screen, a trait carried over from a previous engagement, and any story whose expected outcome is a feature.

Redaction runs on the way out, per the consent guardrail: participant IDs only, employer and team names generalized, quotes scrubbed of identifying detail. The transcript stays in `research/raw/` and stays immutable.

**Completion criterion:** every persona field carries a participant ID and a line range or the literal `not covered`; every job story is in strict format, names no solution, and cites the struggle moment it came from; no persona merges participants with different decision authority; and a persona built from a single transcript is labeled `n=1, provisional` until `/synthesize` reconciles it. Zero uncited traits, or the file does not ship.

### `/synthesize`
The cross-transcript pass, running on the provisional personas and the raw set together. It adds an evidence chain of custody. Raw data in `research/raw/` is immutable (the immutability rule). Every insight gets an ID and cites the raw evidence it came from, the way a footnote cites its source. Contradictions are never silently overwritten. Flag each one with a contradiction callout naming both sources.
**Completion criterion:** every insight cites at least two evidence items from at least two participants, or is explicitly marked `n=1, provisional`. No insight without a citation trail back to raw. Every provisional persona is either promoted, merged with a reason, or retired here; none stay provisional past this point.

### `/to-hills`
The red test of the loop. Converts insights into Hills (Who / What / Wow) and, where the engagement is metric-driven, Desired Outcome Statements in Ulwick's strict solution-free format. These are agreed with the stakeholder *before* any design exists, exactly as seams are agreed before any test is written.
**Completion criterion:** every Hill's Wow is measurable (a number, a time, an observable behavior), every Hill traces to cited insights, and the stakeholder has confirmed the set. A Hill whose Wow can't be checked is sent back, not carried forward.

### `/brief-design-agent`
Takes one Hill and writes the brief that a design agent executes: Figma via MCP, a code-prototype agent (Cursor, v0, Lovable, Figma Make), or an image tool. One Hill per brief, vertical slice, never a batch. The design work itself happens in the agent; this skill's product is the instruction set and the bar it gets graded against. Consults `/mapping-vocabulary` when the artifact is a map, `/enterprise-ux-stance` always, and the engagement's design system config (NL Design System, a client system, or a vendor system) as a hard constraint, per the Constraint-Led Innovation position. When a question can't be settled on canvas, detour through `/prototype` bridged by `/handoff`, exactly like Matt's step-2 branch.

The brief is written for a model with no access to the engagement workspace, so it carries everything needed and nothing else:

1. **Job and Wow, verbatim from the Hill.** Who, what, and the measurable bar. The Wow is the acceptance test, restated at the top and at the bottom.
2. **Evidence, quoted not summarized.** Two or three insight quotes with IDs behind every screen decision, so the agent designs against behavior instead of taste.
3. **Content inventory before layout.** Real domain nouns from `GLOSSARY.md`, real value ranges, real edge cases: the 400-row table, the 60-character Dutch label, the empty state that is the *common* state in enterprise.
4. **Hard constraints as literals.** Design system component and token names, WCAG 2.1 AA, viewport, density target, platform. "Dense" fails the brief. "32px row height, 25 rows above the fold at 1440x900" passes.
5. **Out of scope, named.** The screens and features the evidence did not ask for, listed explicitly so the agent doesn't helpfully invent them. This is where Requirements by Union gets stopped before it reaches a canvas.
6. **Output contract.** Deliverable type (flow, single screen, component set), file and frame naming, states required per screen (empty, loading, error, permission-denied, max-data), tokens over hex values.
7. **Tool profile.** One section per target, because a Figma agent needs frames, auto-layout, and component instances, while a code agent needs routes, state, and data shape. Same Hill, same evidence, different execution surface.

Redaction runs on the way out, per the consent guardrail: participant IDs only, no names, no employer, no quote carrying identifying detail. A design agent is an external service.

**Completion criterion:** the brief passes the cold-read test. A fresh agent with no repo access produces an artifact gradeable against the Wow without asking a clarifying question. Every screen traces to a cited insight, every constraint is a literal, and the out-of-scope list is non-empty. What comes back goes straight to `/design-review`; a failure returns as a revised brief, never as chat.

### `/design-review`
Two parallel sub-agents, reported side by side, never merged or reranked:
- **Standards axis:** heuristics, WCAG 2.1 AA, the engagement's design system rules, plus the Enterprise UX smell baseline (section 6) as labeled judgment calls. Documented engagement standards override the baseline.
- **Evidence axis:** does each screen serve a Hill? Quote the Hill for every finding. Flag scope creep (design nobody's evidence asked for) and Hills that look served but where the artifact misses the Wow.

**Completion criterion:** both reports delivered, one-line summary per axis, worst issue *within* each axis. No single winner across axes.

### `/playback`
The alignment ritual and the loop's close. Builds the story-driven presentation, runs the session, and captures what was decided as DRRs, because per Brooks, design rationale evaporates within a week if nobody's job is to write it down. Decisions that change the Hills reopen `/to-hills`; decisions that green-light build produce the engineering handoff spec.
**Completion criterion:** every decision made in the room exists as a DRR with its why, and every open question left the room owned by a named person with a date.

**Context hygiene rule for the spine:** keep `/grill-the-ask` through `/to-hills` in one unbroken window, so the plan, the synthesis, and the Hills build on the same thinking. Each transcript gets its own window for `/create-personas-and-job-stories`, because a full transcript eats the context the spine needs, and the persona file is what carries forward. Each `/brief-design-agent` per Hill starts fresh; the Hill file is self-contained, so the previous session's context is disposable. `/playback` is a phase boundary: compact after it, never through it.

---

## 5. On-ramps and shaping

**`/triage-signals`** is the engagement's front door for work you didn't create. Category roles: `pain`, `request`, `insight`, `praise`. State roles: `needs-triage` → `needs-evidence` (the UX-specific state: a claim that must be validated before it earns design effort) → `ready-for-design` / `ready-for-human` / `wontfix`. A shadow-IT sighting (someone's coping spreadsheet) enters as `insight` and is treated per the enterprise stance: design feedback, never a compliance failure. Every triage note carries the AI-generated disclaimer, verbatim from Matt's rule.

**`/workflow-audit`** is the analog of `/improve-codebase-architecture`: run it in a spare moment, get a visual report of friction candidates ranked by the six-step workflow-mapping method, and picking one *generates an idea* that enters the main flow at `/grill-the-ask`, usually via `/roi-case` first, because in an enterprise nothing enters the roadmap without a number attached.

**`/discovery-map`** is `/wayfinder` with the destination types renamed: a scoped discovery brief, a validated problem statement, a go/no-go. Decision tickets, decisions not deliverables, refer by name, the map is an index not a store. When the fog clears it hands off to `/to-research-plan` or `/to-hills`; it never designs.

**`/prototype`** carries the Vibe Coding position as its core warning: an AI prototype makes the requirements *more* critical, not less. Throwaway is a constraint on how it's built, not a promise to destroy it; the prototype is kept as a primary source and pointed at from the Hill it answered. Demand-validation variants (Fake Door, Concierge) are branches within it, per Sharon.

**`/desk-research`** searches your own notes *first*, if you keep any, then goes to primary web sources, and leaves a cited markdown file. Findings worth keeping are offered back into your notes.

---

## 6. The Enterprise UX smell baseline

Matt's Standards axis always carries Fowler's smells, "a fixed set that applies even when a repo documents nothing". The equivalent here is a fixed set distilled from fifteen years of enterprise engagements. Each reads *what it is* → *the fix*, applied as a labeled judgment call, overridable by documented engagement standards:

- **Delight over throughput:** consumer-grade polish added where an expert user needed density and speed. → Optimize for the hundredth use, not the first.
- **Muscle-memory break:** a "better" layout that destroys veteran habits with no migration path. → Preserve the motor pattern or stage the change; cite the Office Ribbon precedent for how to do it without revolt.
- **Adoption theater:** success claimed from presence metrics (the 94%-login fallacy). → Measure task outcomes, not logins.
- **Shadow-IT blindness:** a design that ignores the coping spreadsheet, or a rollout plan that tries to ban it. → Read the spreadsheet as requirements; absorb its job before retiring it.
- **Silo-busting hero move:** a flow that requires an org restructure to work. → Navigate the walls; design for the org that exists.
- **Legacy contempt:** treating the 20-year-old system and its experts as the obstacle. → Design with them; they hold the domain model.
- **Unpriced friction:** a recommendation with no time/money/risk translation attached. → Run `/roi-case`; spreadsheet thinkers fund numbers.
- **Requirements by union:** a scope that is the unweighted sum of every stakeholder's wish list (Brooks's requirements bloat). → Return to the Hills; a chief designer prunes.
- **Solution-shaped research:** evidence gathered to confirm a design already chosen. → Send it to `/evidence-standards`; grade it tainted.
- **Chartjunk dashboard:** decoration, low data density, no at-a-glance answer (Few + Tufte). → Data-ink ratio up; bullet graphs and sparklines; one screen, one glance.

And in `/evidence-standards`, the research anti-patterns, mirroring the TDD ones:
- **Tautological research** (the leading question): the method can only produce the answer you fed it. The tell: no possible participant behavior would have changed the conclusion.
- **Attitude-coupled evidence:** an opinion standing in for a behavior ("would you use this?"). → Observe or instrument the behavior itself.
- **Horizontal research:** all the studies first, then all the design. → Vertical slices: one hypothesis, one test, one design move, each responding to what the last cycle taught.

---

## 7. State, setup, and the compounding loop

`/setup-euxlab-skills` runs once per engagement, in Matt's explore → present → confirm → write shape, and scaffolds:

```
<engagement>/
├── docs/agents/engagement.md   # client, domain, design system, tracker,
│                               # consent posture, stakeholder map, label overrides
├── GLOSSARY.md                 # the CONTEXT.md analog; /grill-the-ask feeds it
├── docs/drr/                   # Design Rationale Records
├── research/
│   ├── raw/                    # immutable, consent-checked; assets included
│   ├── personas/               # professional personas + job stories, per transcript
│   └── insights/               # cited, ID'd synthesis output
├── hills/                      # one file per Hill; self-contained for /brief-design-agent
├── briefs/                     # one design-agent brief per Hill; the handoff surface
└── .scratch/                   # local signal tracker, or config points at Jira/GitHub
```

The engagement workspace is the short-term memory. **A practitioner knowledge base, if you keep one, is the long-term memory**, and the two exchange in both directions:

- **Knowledge base → skills:** the first draft made every reference skill a thin pointer into a knowledge base. v0.1.2 reversed that: every reference skill now carries its own content, so the library runs for someone who keeps nothing. See `.agents/adr/0002-self-contained-skills-no-vault.md`.
- **Skills → knowledge base:** at engagement close, a small `/file-case-study` step (part of `/playback`'s final branch) writes the case study to the archive target named in the engagement config. Every engagement makes the archive denser, and a denser archive raises the floor of the next engagement. That is the compounding Matt gets from tuned skills, plus a layer he doesn't have: a knowledge base that grows underneath the skill set.

**The consent guardrail**, stated once and inherited everywhere: raw research data may contain PII; participants are identified by ID in everything that leaves `research/raw/`; `/handoff` and `/file-case-study` redact by rule; the engagement config records the retention policy. This is the one place where the suite is stricter than its engineering parent, because the raw material here is people.

---

## 8. What already exists, and the phased build

Roughly half the suite has a seed in skills and templates built on earlier engagements. The concept's real contribution is not new content; it is turning a pile of standalone skills into a **flow with shared state**, which is exactly what separates Matt's system from a folder of prompts.

### The phased build

Five releases, each one usable on a real engagement the day it ships. The ordering rule is dependency, not ambition: nothing ships before the state it reads exists, and a reference skill gets extracted on its **second** consumer, never its first.

| Phase | Theme | Ships | Total |
|---|---|---|---|
| **v0.1** | MVP: the loop that compounds | 10 | 10 |
| **v0.2** | The loop closes | 6 | 16 |
| **v0.3** | The engagement sustains itself | 6 | 22 |
| **v0.4** | Fog and audience | 4 | 26 |
| **v1.0** | The library, hardened | 2 + evals | 28 |

---

#### v0.1 · MVP: the loop that compounds (10 skills)

**Ships:** `/setup-euxlab-skills`, `/grilling` (mechanics from Matt's, rewritten in the house voice), `/grill-the-ask`, `/create-personas-and-job-stories`, `/synthesize`, `/to-hills`, `/design-review`, `/evidence-standards`, `/enterprise-ux-stance`, `/outcome-vocabulary`.

**Why these:** this is the shortest path from a vague stakeholder ask to a checkable bar and a graded artifact. `/setup-euxlab-skills` comes first because every other skill reads the engagement config and the folder scaffold; without it the rest are prompts, not a system. `/outcome-vocabulary` is the one reference that earns its place immediately, because two skills consume the job-story and outcome formats on day one.

**Deliberately absent:** research planning (v0.1 assumes transcripts already exist, which on a live engagement they usually do), the design handoff, the alignment ritual, and the router. A router over ten skills is dead weight; the human still knows what they want.

**Exit criterion:** one real engagement runs ask → assumptions → personas → insights → Hills → reviewed artifact without dropping into freeform chat at any step, and every Hill in that engagement traces to a cited insight. If a step needs improvisation, it is not done.

---

#### v0.2 · The loop closes (6 skills, 16 total)

**Ships:** `/to-research-plan`, `/brief-design-agent`, `/playback` (with DRR capture and the `/file-case-study` branch), `/handoff`, `/design-rationale`, `/mapping-vocabulary`.

**Why these:** v0.1 ends at a reviewed artifact, which is half a loop. This phase adds the front (research becomes planned rather than inherited) and the back (design gets briefed formally, decisions get recorded, the engagement files itself back into the archive). `/design-rationale` and `/mapping-vocabulary` extract here because `/playback` and `/brief-design-agent` are their second consumers.

**Deliberately absent:** anything that generates its own work. The flow still only processes what you hand it.

**Exit criterion:** the full spine runs end to end on one engagement, every decision made in a playback exists as a DRR, and the closing `/file-case-study` step has written at least one case study back into the archive. The compounding loop is proven once, or it is a diagram.

---

#### v0.3 · The engagement sustains itself (6 skills, 22 total)

**Ships:** `/triage-signals`, `/insight-lint`, `/workflow-audit`, `/roi-case`, `/desk-research`, `/metrics-vocabulary`.

**Why these:** the first two phases handle work you were given. This one handles work you find: raw signals get a state machine, the repo gets a health check, friction gets surfaced by method rather than by hunch, and the chosen friction gets a number attached, because in an enterprise nothing enters the roadmap unpriced. `/desk-research` lands here because `/roi-case` benchmarks need cited outside sources. `/metrics-vocabulary` extracts here on its second consumer, `/insight-lint` and `/roi-case`.

**Exit criterion:** a piece of work that nobody assigned enters at `/triage-signals` or `/workflow-audit`, carries an ROI number, and reaches `/grill-the-ask` on its own. `/insight-lint` runs clean on the engagement repo.

---

#### v0.4 · Fog and audience (4 skills, 26 total)

**Ships:** `/discovery-map`, `/prototype`, `/stakeholder-questionnaire`, `/plain-english`.

**Why these:** two failure modes the spine cannot absorb. Fog, where the engagement is too large to plan and needs a map of decision tickets before any research is worth running. And audience, where the output is correct but unreadable to the person funding it. `/prototype` lands here rather than earlier because it is a detour off `/brief-design-agent`, and a detour needs a road first.

**Exit criterion:** a foggy engagement is reduced to settled decision tickets without a single deliverable being produced during the mapping, and one output survives a `/plain-english` pass in both directions with no meaning lost.

---

#### v1.0 · The library, hardened (2 skills + the quality gate, 28 total)

**Ships:** `/ask-euxlab`, `/post`, and the work that turns 28 files into a library:

1. **Evals per skill.** Three test briefs each, graded against the completion criteria, per the skill-creator loop. A skill without a failing-then-passing eval is unreleased.
2. **Description optimization.** The model-invoked layer gets pointer wording tuned so the right skill fires without being named; the human-invoked layer gets `disable-model-invocation: true` and stays quiet.
3. **The state contract, tested.** One fixture engagement proves every skill reads and writes the shared folders as specified, so the flow survives skills being run out of order.
4. **Packaging and docs.** Installable with `npx skills add` or as a Claude plugin, README per skill, one worked example engagement end to end.

`/ask-euxlab` waits until here on purpose: a router is only worth writing once the surface is big enough to get lost in, and once the descriptions it routes on are final.

**Exit criterion:** every skill has three passing evals, a cold install on a fresh machine runs the worked example without edits, and `/ask-euxlab` picks the right skill for ten situations written by someone who did not build the suite.

Every skill gets written under `/writing-for-agents` discipline: sharp pointer wording for the model-invoked layer, `disable-model-invocation: true` for everything the human triggers, completion criteria that are checkable and demanding, leading words already in the suite's vocabulary (Hill, seam, frontier, tracer bullet, smell, playback), and pruning against sediment as the suite evolves.

---

## Sources

- aihero.dev/skills and aihero.dev/skills.md (site + agent-facing catalog, retrieved 2026-08-26)
- github.com/mattpocock/skills (repo cloned 2026-08-26; SKILL.md files for grilling, grill-with-docs, to-spec, tdd, implement, code-review, triage, wayfinder, ask-matt, setup, handoff, writing-for-agents + SKILL-MECHANICS)
- Published works cited inline: EDT, JTBD/ODI, Kalbach, Patton, Sharon, Tullis & Albert, Levy, Leavy, Few, Tufte, Brooks, Service Design
