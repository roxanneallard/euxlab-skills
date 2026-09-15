# euxlab-skills

## 0.1.2

### Patch Changes

- One file in, one file out. Every skill now reads a file, does one thing, and writes the next file. That file is the contract with the next step.
- `/grill-the-brief` writes `docs/interview-guide.md`: the ask sharpened, the graded assumption register, and the questions the fieldwork has to answer. Every weak assumption becomes a numbered question or an explicit decision to accept the risk untested.
- `/design-brief` replaces `/to-hills`. The assignment is scope, requirements, and the insight IDs each requirement serves, with an observable and today's number. `hills/` is gone from the scaffold.
- `/design-review` reviews against the design brief by requirement number instead of against a Hill.
- The two handwork steps are named in the flow. Interviewing and designing are not skills, and pretending otherwise hid where the state comes from.
- Every skill is self-contained. The last dependency on a private vault is gone, so the library installs and runs from this repo alone.
- `/setup-rox-skills` is now `/setup-euxlab-skills`, and the library is EUXLab Skills. If you installed the old command, delete it. The name is the only thing that changed.
- No vault required, and the library says so. `/setup-euxlab-skills` states what the suite needs (a writable folder and an agent) and what it does not (Obsidian, a note app, a wiki, anything built before today).

## 0.1.1

### Patch Changes

- `/grilling`, `/evidence-standards`, `/enterprise-ux-stance`, and `/outcome-vocabulary` moved into their own reference group, so the flow skills cite them instead of restating them.
- Every completion criterion rewritten to be checkable. "Understanding reached" is gone from the library.
- Redaction moved from a final cleanup pass to a step inside each skill.

## 0.1.0

### Minor Changes

- Ten skills shipped: one setup skill, five main-flow skills, four reference skills.
- The state contract is fixed. Seven paths, each with a writer, a reader, and a rule.
- `/design-review` reports two axes side by side and refuses to merge them.
