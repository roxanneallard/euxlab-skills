# Integration with a specific note-taking tool

Requests to make the skills read from, write to, or depend on Obsidian, Notion, a wiki, or any other note-taking tool are out of scope.

## Why this is out of scope

The suite needs a writable folder and an agent. Nothing else. Every file it writes is plain markdown with relative paths and ordinary links, so any editor opens it, `grep` searches it, and `git` versions it.

A tool-specific link format or plugin dependency would break that for everyone who does not use the tool. It would also bring back the assumption this library works to remove: that you need a second brain before you start.

If you keep a vault, put the engagement folder inside it. Every skill behaves the same. See [.agents/adr/0002-self-contained-skills-no-vault.md](../.agents/adr/0002-self-contained-skills-no-vault.md).
