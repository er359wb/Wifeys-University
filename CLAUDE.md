# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Purpose

This repository organizes Wifey's tutoring and learning materials by subject
(e.g. `C++ Programming tutoring`, `Digital Logic Circuit`, `Physics tutoring`).
Each subject gets its own top-level folder.

## Git workflow

- Commit and push directly on the branch this session is configured to use;
  do not create additional feature branches.
- Open a pull request into `main` for review — do not push straight to
  `main` unless a human explicitly confirms that direct-to-main pushes are
  enabled for this session (some sessions are hard-restricted to a branch
  and cannot do this regardless of what's asked in chat).
- Use clear, descriptive commit messages.
- Never force-push, rewrite history, or delete branches without being
  explicitly asked.

## Working conventions

- Keep changes minimal and scoped to exactly what was requested — don't add
  extra folders, files, or content that wasn't asked for.
- Git doesn't track empty directories, so new empty folders get a
  `.gitkeep` placeholder.
- Don't invent tutoring content, structure, or naming on your own
  initiative — ask, or wait for instructions, when it's unclear what a
  folder should contain.
- Prefer editing/extending existing files over creating new ones.
- No emojis unless explicitly requested.
- No comments in code unless they explain a non-obvious "why."

## Actions requiring confirmation

Ask before: deleting files or branches, force-pushing, rewriting history,
merging pull requests, or any other hard-to-reverse action. A one-time
approval does not carry forward to future, similarly-risky actions.

## Communication

- Keep responses short and direct: state what changed and what's next.
- Don't pad answers with unrequested options, caveats, or filler.
