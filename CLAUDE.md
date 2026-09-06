# CLAUDE.md

Guidance for Claude Code when working on the `main` branch of this
repository.

## Purpose

This repository organizes Wifey's tutoring and learning materials. Each
subject has its own dedicated branch with a Claude session tutoring from
curriculum documents sent to that session:

- `mathematics`
- `cpp-programming-tutoring`
- `digital-logic-circuit`
- `physics-tutoring`

A session working on `main` is the **manager** session — it doesn't teach
any subject itself. Its job is repo-level coordination: creating new
subject branches when a new subject is added, keeping this file and the
README accurate, and general repo housekeeping.

## Creating a new subject branch

- Branch name: kebab-case, no spaces (e.g. `chemistry-tutoring`).
- Branch from `main`.
- Give the new branch its own root-level `README.md` and `CLAUDE.md`
  describing that subject and the tutoring role — follow the pattern of
  the existing subject branches.
- Also create a `handover/` folder with a starter `HANDOVER.md` inside
  (see an existing subject branch for the template) — this is where that
  session records learning progress and hands over to a future session.
- Don't add the subject as a folder on `main` — subject content lives
  only on its own branch, not on `main`.
- List the new branch in this file and in README.md.

## Git workflow

- Subject branches are independent and don't merge into `main` — they're
  standalone tutoring workspaces, not feature branches.
- For changes to `main` itself (this file, the README, repo-level setup),
  open a pull request into `main` and get it merged without asking the
  user each time — this is standing policy, confirmed by the user. Try
  enabling GitHub's native "Allow auto-merge" on the PR first. If GitHub
  reports auto-merge isn't available for the repo (e.g. it's private on a
  free plan), or that the PR is already mergeable with nothing to wait on
  (there are no required status checks configured here, so this is the
  common case), merge the PR directly instead — either path should end
  with the PR merged, not left open.
  - This policy lives here in CLAUDE.md, not in any one session's memory
    — a fresh session only knows about it by reading this file.
  - The repo's visibility (public/private) has changed hands multiple
    times in the past; this rule is written to work either way so it
    doesn't need editing every time visibility changes.
- Do not push straight to `main` unless a human explicitly confirms that
  direct-to-main pushes are enabled for this session (some sessions are
  hard-restricted to a branch and cannot do this regardless of what's
  asked in chat).
- Use clear, descriptive commit messages.
- Never force-push, rewrite history, or delete branches without being
  explicitly asked.

## Privacy review before committing

This repository is currently public, so anything committed to it — on
`main` or any subject branch — is visible to anyone.

- Before committing any file the user adds or asks to publish (notes,
  worksheets, homework, photos, scans, etc.), read its actual content
  first — never commit a file sight unseen.
- Redact personal particulars before committing: full real names (this
  repo already uses "Wifey" as a stand-in — keep it that way), home
  addresses, phone numbers, email addresses, school/institution names,
  dates of birth, ID or student numbers, photos of identifiable people,
  and signatures.
- Check filenames too, not just file contents — a filename can leak the
  same information a redacted file body doesn't.
- If it's unclear whether something counts as personal/sensitive, ask the
  user rather than guessing either way.

## Working conventions

- Keep changes minimal and scoped to exactly what was requested — don't
  add extra folders, files, or content that wasn't asked for.
- Don't invent tutoring content, structure, or naming on your own
  initiative — ask, or wait for instructions, when it's unclear.
- Prefer editing/extending existing files over creating new ones.
- No emojis unless explicitly requested.
- No comments in code unless they explain a non-obvious "why."

## Agent usage

- Never spawn subagents or temporary agents (e.g. via a Task/Agent tool)
  to do work in this repository — do all work directly in this session,
  yourself.
- This applies on every branch in this repo, not just `main`.
- Multi-agent orchestration is an inefficient use of tokens for
  repo-scale tasks like tutoring and repo housekeeping — it burns usage
  unnecessarily for work a single session handles fine.

## Actions requiring confirmation

Ask before: deleting files or branches, force-pushing, rewriting history,
or any other hard-to-reverse action. A one-time approval does not carry
forward to future, similarly-risky actions. Exception: getting pull
requests into `main` merged (via auto-merge or directly, see Git workflow
above) is pre-approved standing policy and does not need to be asked about
again.

## Communication

- Keep responses short and direct: state what changed and what's next.
- Don't pad answers with unrequested options, caveats, or filler.
