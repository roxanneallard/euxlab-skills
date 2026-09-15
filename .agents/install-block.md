# The canonical install block

One install story, one wording. `README.md`, `.changeset/*`, and the site at euxlab.com/system say **this** and nothing else. Change it here first, then propagate.

`euxlab-skills` is not in Claude Code's official marketplace. This repo is its own single-plugin marketplace, named `euxlab` in `.claude-plugin/marketplace.json`. So a Claude Code user adds the marketplace once, then installs the plugin from it. If the plugin is accepted into the official marketplace later, the Claude Code block shrinks to `claude plugins install euxlab-skills` and this file records the switch.

## Claude Code: the plugin

<canonical-block name="claude-code">

```bash
claude plugins marketplace add roxanneallard/euxlab-skills
claude plugins install euxlab-skills@euxlab
```

Or, from inside a session:

```
/plugin marketplace add roxanneallard/euxlab-skills
/plugin install euxlab-skills@euxlab
```

The first command adds this repo as a marketplace. The second installs the plugin from it. Pull a new version with `/plugin marketplace update euxlab`.

</canonical-block>

## Codex, and other agents: skills.sh

The plugin is Claude Code only. Everywhere else, [skills.sh](https://skills.sh) copies editable skill files into the project. Use the whole-set form on `README.md`:

<canonical-block name="skills-sh-whole-set">

```bash
npx skills@latest add roxanneallard/euxlab-skills
```

Pick the skills you want, and which coding agents to install them on. **Make sure `setup-euxlab-skills` is one of them.** The loop skills load the four reference skills, so take those too.

</canonical-block>

The single-skill form, wherever one skill is named on its own:

<canonical-block name="skills-sh-one-skill">

```bash
npx skills@latest add roxanneallard/euxlab-skills --skill=<name>
```

```bash
npx skills@latest update <name>
```

</canonical-block>

## Claude desktop and web: uploaded zips

Those apps have no skill folder on disk. Skills are uploaded as zips under **Settings > Capabilities > Skills**. `scripts/package-skills.sh` builds one zip per promoted skill into `dist/claude-desktop/`, and each release carries them as downloads.

## The routes are exclusive

The plugin is a managed, read-only bundle you subscribe to. skills.sh writes files you own and edit. Installing both leaves the user with every skill twice. Always say "pick one".
