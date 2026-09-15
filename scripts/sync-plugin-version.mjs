#!/usr/bin/env node
// Copies package.json's version into .claude-plugin/plugin.json.
// Runs inside `npm run version`, right after `changeset version`.
// With --check it writes nothing and exits 1 when the two versions differ.

import { readFileSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const repo = join(dirname(fileURLToPath(import.meta.url)), '..');
const pluginPath = join(repo, '.claude-plugin', 'plugin.json');

const { version } = JSON.parse(readFileSync(join(repo, 'package.json'), 'utf8'));
const source = readFileSync(pluginPath, 'utf8');
const current = JSON.parse(source).version;

if (current === version) {
  console.log(`plugin.json is at ${version}, in sync`);
  process.exit(0);
}

if (process.argv.includes('--check')) {
  console.error(
    `plugin.json is at ${current}, package.json at ${version}. Run \`node scripts/sync-plugin-version.mjs\`.`,
  );
  process.exit(1);
}

// Rewrite only the version line, so key order and formatting survive.
const updated = source.replace(/("version"\s*:\s*")[^"]*(")/, `$1${version}$2`);

if (JSON.parse(updated).version !== version) {
  console.error(`Could not find a version field to replace in ${pluginPath}.`);
  process.exit(1);
}

writeFileSync(pluginPath, updated);
console.log(`plugin.json ${current} -> ${version}`);
