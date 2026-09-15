# Loop

Every output is the next input. Step zero runs once per engagement. After that, each skill reads the file the previous step wrote and writes the file the next step reads. Two steps are handwork, and deliberately not skills: interviewing and designing.

## User-invoked

Reachable only when you type them (Claude Code: `disable-model-invocation: true`. Codex: `policy.allow_implicit_invocation: false` in `agents/openai.yaml`).

0. **[setup-euxlab-skills](./setup-euxlab-skills/SKILL.md)**: Step zero, once per engagement. Configure the client, design system, consent posture, and stakeholders, and write the folder scaffold.
1. **[grill-the-ask](./grill-the-ask/SKILL.md)**: Request in, `docs/interview-guide.md` out. Critical questions about requirements, scope, and users, every claim graded, and the questions for the interviews.
   - _Handwork: interview stakeholders and users. Transcripts land in `research/raw/`._
2. **[create-personas-and-job-stories](./create-personas-and-job-stories/SKILL.md)**: One transcript in, one file in `research/personas/` out. Role, workflows, job stories, pain points, and needs, every trait cited. Run per transcript.
3. **[synthesize](./synthesize/SKILL.md)**: `research/personas/` and `research/raw/` in, `research/insights/` out. Insights I01, I02 with evidence from the transcripts, contradictions as C01.
4. **[design-brief](./design-brief/SKILL.md)**: `research/insights/` in, `docs/design-brief.md` out. The design assignment: scope, requirements, and the insights the design has to serve.
   - _Handwork: design in Figma. Screens and a prototype, each screen naming the insight it serves._
5. **[design-review](./design-review/SKILL.md)**: The design in, two reports out. Standards: heuristics, WCAG, design system. Evidence: which insight each screen serves, and where that is written.
