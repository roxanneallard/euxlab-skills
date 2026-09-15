# Changesets

This folder holds pending release notes, managed by [`@changesets/cli`](https://github.com/changesets/changesets).

Add one with every user-visible change:

```bash
npx changeset
```

On push to `main`, the Release workflow opens a version pull request. Merging it bumps `package.json`, syncs `.claude-plugin/plugin.json`, and writes `CHANGELOG.md`. Installed plugin users see the update once `plugin.json`'s version moves.
