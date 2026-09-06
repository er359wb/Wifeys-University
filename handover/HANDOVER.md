# Handover

Last updated: 2026-09-06 (repo setup session — curriculum, conversation
history, and syllabus added; no new tutoring done yet this session).

## Progress so far

Curriculum now fully in place: `curriculum/slides/` (6 decks),
`curriculum/textbook/`, and `curriculum/SYLLABUS.md` (topic breakdown
per unit, with textbook cross-references). See `curriculum/SYLLABUS.md`
for the full topic list per unit — this section only tracks
completion status.

Tutoring itself started before this branch existed, in prior claude.ai
chats. Transcripts are preserved in `conversation_history/`:
- `2026-08-31_pomoshch-s-pervym-urokom.md` — first lesson: radix/base,
  positional notation, binary<->octal conversion (grouping method).
- `2026-09-02_bystrye-voprosy-po-prezentatsii.md` — quiz attempt on
  Unit 1 topics; table-memorization drilling for octal/hex; the
  8-4-2-1 shortcut was introduced here, then abandoned after confusing
  her (see Learner profile). Session cut off before the planned
  randomized drill happened.
- `2026-09-07_perenos-v-claude-code-setup.md` — migration to this
  Claude Code branch/repo.

**Unit 1 — Number Systems and Codes: in progress.**
- Done / solid: radix/base concept, positional notation formula,
  binary<->octal conversion (grouping method, incl. why grouping is
  right-to-left but the written result is left-to-right), binary<->hex
  conversion, memorizing the octal->binary and hex->binary tables by
  rote (not the 8-4-2-1 shortcut — that's rejected, see below).
- Not yet drilled to fluency: randomized recall of the octal/hex
  tables (asked out of order, not just top-to-bottom).
- Not started within Unit 1: signed numbers (sign-magnitude, 1's/2's
  complement), addition/subtraction via complements, BCD, Excess-3,
  Gray code, parity, ASCII.

**Units 2-6: not started.**

## Learner profile

- **Language**: Russian, casual/informal tone. All technical
  terminology stays in English (course is taught in English), with a
  short Russian gloss the first time a term appears — don't
  permanently translate terms into Russian afterward.
- **Explanation length**: short. No walls of text, no lecture dumps.
  One idea at a time, small chunks.
- **Learns by doing, not reading**: default pattern is one short
  worked example, then immediately hand her problems to solve. Ask
  for her answer before explaining further — per CLAUDE.md's testing
  rule, never give the answer/solution/strong hint before she attempts
  it or explicitly asks.
- **Table memorization over shortcuts**: the 8-4-2-1 bit-weight
  shortcut was tried for octal/hex-to-binary conversion and confused
  her across several re-explanations (2026-09-02 session) — she
  couldn't connect "which weights add up to this digit" back to the
  positional-notation idea she'd just learned. She explicitly said "я
  не поняла" repeatedly and asked to drop it. Abandoned; do not
  reintroduce it in any form. She uses direct table memorization only
  (rote, "learn it like the alphabet").
- **Direction confusion is a recurring sticking point**: when grouping
  bits (e.g. binary->octal, binary->hex), she gets confused about why
  groups are formed right-to-left (from the LSB) but the final answer
  is written left-to-right. This needs to be stated explicitly every
  time it comes up in a new context, not assumed as "already learned."
- **Notation preference**: always wants explicit subscript notation
  for number bases, e.g. (101)₂, (7)₈, (2F)₁₆, rendered as actual
  subscripts — she asked for this herself and it should be applied
  everywhere from here on, not just where originally introduced.
- **Communication when lost vs. confident**: when lost, she asks
  short, sometimes garbled/typo'd questions ("Тип в байнари? Все равно
  странный лайфхак он не работает") rather than staying silent — that
  is a real signal to slow down and change approach, not push forward.
  When confident, she asks for practice directly ("Может задание
  даш") or requests drilling out of order ("погоняй вразнобой").
- **Pace**: prefers moving through material quickly once a concept
  clicks (asked to "пройтись по всему уроку" / go through the whole
  lesson), but needs the step-by-step breakdown when something doesn't
  land — don't compress explanations further just because she wants
  speed; compress *scope* (fewer sub-topics at once), not depth per
  sub-topic.
- **No emojis** (explicit repo-wide instruction, also matches her own
  style in the transcripts).

## Next steps

1. Resume Unit 1: drill octal/hex table recall in randomized order
   (this was planned and never completed — session cut off right
   before it, per the 2026-09-02 transcript).
2. Once table recall is fluent, move to signed numbers (sign-magnitude,
   1's/2's complement) and addition/subtraction, then the remaining
   codes (BCD, Excess-3, Gray, parity, ASCII) to finish Unit 1.
3. Proceed to Unit 2 (Boolean Algebra) only after Unit 1 is confirmed
   complete via actual practice, not assumption.
4. See `curriculum/SYLLABUS.md` for the full per-unit topic list, and
   the session's task list (Units 1-6, one task per topic) for
   fine-grained tracking.

Per CLAUDE.md: don't mark a topic/task done on assessment alone —
require her to solve problems correctly or explicitly confirm
understanding. Nothing above should be read as "done" unless stated as
such.
