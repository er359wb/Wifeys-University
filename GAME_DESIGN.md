# Size Duel - Roblox Game Design (Draft)

Working title only. Every section is tagged:

- **[Decided]** - came directly from your idea.
- **[Proposed]** - my suggestion, needs your yes/no.
- **[Open]** - you still need to choose.

---

## 1. Core idea [Decided]

A multiplayer height-guessing game in the style of Magnitudle / "Size It
Up". Each round shows a **reference object** whose height everyone knows,
and a **mystery object**. Players guess how tall the mystery object is by
scaling it against the reference. The player whose guess is **closer to the
real height than their opponents'** wins the round and gets points.

There are two table types:

- **1v1 table** - two players duel.
- **4-player table** - four players compete.

There is an **elimination system** (shape still open - see section 6).

> Note: I could not open magnitudle.com from this environment, so the
> mechanics below are based on your description, not the site itself.
> Tell me anything that differs from how the original plays.

---

## 2. How it looks

### 2.1 Lobby [Proposed]

A single hub world with physical tables. Players walk up and sit down to
join - no menus needed to queue.

```
+-----------------------------------------------------------+
|                         LOBBY                             |
|                                                           |
|   [1v1]     [1v1]     [1v1]          +-----------+        |
|   o---o     o---o     o---o          | LEADER-   |        |
|                                      | BOARD     |        |
|                                      +-----------+        |
|      o               o                                    |
|    o[4P]o          o[4P]o          (spawn)                |
|      o               o                                    |
|                                                           |
+-----------------------------------------------------------+
  o = seat      [1v1] = 2-seat table      [4P] = 4-seat table
```

- A table starts a countdown (e.g. 5 s) once all its seats are full.
- Standing up during the countdown cancels it.

### 2.2 The table stage [Proposed]

The middle of every table is a small stage where the objects appear, so the
whole match happens right at the table and spectators can watch.

```
            reference        mystery
               ___            ?  ?
              |   |          ? ?? ?
              | R |          ? ?? ?      <- mystery object, drawn at
              |   |          ? ?? ?         the size YOU are guessing
         =====|___|==========?=??=?=====
                  table stage
```

### 2.3 Guessing screen (per player) [Proposed]

```
+---------------------------------------------------------+
|  Round 3                                     Time: 12   |
|                                                         |
|  Reference:  Door  (2.0 m)                              |
|  Mystery:    Giraffe                                    |
|                                                         |
|     [ camera view of reference + mystery on the stage ] |
|                                                         |
|  smaller <==========|=============================> bigger|
|                    0.1x    1x     10x     100x          |
|                                                         |
|  Your guess:  2.6x the door   =  5.2 m                  |
|                                                         |
|                        [ LOCK IN ]                      |
+---------------------------------------------------------+
```

- Dragging the slider resizes the mystery object live, next to the
  reference.
- The slider is **logarithmic** (each notch multiplies, not adds), because
  objects range from an ant to a skyscraper.
- The readout shows both "x times the reference" and the real unit
  (metres, with feet as a setting).

### 2.4 Reveal [Proposed]

After everyone locks in (or time runs out):

1. Each player's guess appears as a coloured, see-through "ghost" of the
   object at the size they chose.
2. The real object grows/shrinks into its true size.
3. The closest ghost flashes, and points / damage are shown above each
   player's head.

---

## 3. Round flow [Proposed]

```
 Table full -> Countdown -> Round start -> Guess phase -> Reveal
                               ^                            |
                               |                            v
                               +---- next round <---- Score + elimination
                                                            |
                                        one player left --> Match end
```

| Phase        | Length          | What happens                              |
|--------------|-----------------|-------------------------------------------|
| Round start  | 3 s             | Reference + mystery names shown           |
| Guess        | 20 s            | Players scale and lock in                 |
| Reveal       | 5 s             | Ghosts, true size, round winner           |
| Score        | 2 s             | Points / damage / eliminations applied    |

A player who does not lock in in time keeps whatever the slider was on when
the timer hit zero.

---

## 4. Measuring accuracy [Proposed]

Because sizes span huge ranges, error is measured as a **ratio**, not a
difference in metres. Guessing 2 m for a 1 m object is exactly as wrong as
guessing 0.5 m.

```
error = | log10(guess / actual) |
```

| Guess vs actual | error | Shown to player  |
|-----------------|-------|------------------|
| exact           | 0.00  | "Perfect!"       |
| 1.25x off       | 0.10  | "Off by 1.3x"    |
| 2x off          | 0.30  | "Off by 2x"      |
| 10x off         | 1.00  | "Off by 10x"     |

The player with the **lowest error** wins the round. Ties (same error to
2 decimals) both count as winners.

---

## 5. Scoring [Proposed]

- **1v1:** closest player wins the round.
- **4-player:** placement points each round - 1st = 3, 2nd = 2, 3rd = 1,
  4th = 0.
- **Perfect bonus:** error under 0.02 gives +1 extra point.

Points feed the elimination system and the lobby leaderboard.

---

## 6. Elimination system [Open]

You said you are not sure how elimination should work. Here are four
options; pick one per table type, or mix.

### Option A - Health bar (damage by how far off you were)

- Everyone starts with 100 HP.
- Each round, every player except the winner loses HP equal to how much
  worse their error was than the winner's (e.g. `(yourError - bestError) x 100`).
- 0 HP = eliminated.
- Good for: **1v1** - feels like a fighting-game duel; a bad miss hurts
  more than a near miss.

### Option B - Lives, worst guess loses one

- Everyone has 3 lives.
- Each round, the **furthest** guess loses a life.
- 0 lives = eliminated.
- Good for: **4-player** - simple to understand, always one loser per round.

### Option C - Knockout every round

- Each round, the furthest guess is eliminated immediately.
- 4 players -> 3 -> 2 -> final.
- Good for: fast **4-player** matches (3 rounds before a final).

### Option D - Accuracy threshold

- Any guess worse than a set error (e.g. more than 2x off) loses a life,
  regardless of the others.
- Can eliminate several players at once, or nobody.
- Good for: a harder mode; not recommended as the only system.

### My recommendation

- **1v1:** Option A (health bar).
- **4-player:** Option B (3 lives) until two players remain, then those two
  switch to Option A for a **final duel**. This reuses the 1v1 rules, so the
  4-player table naturally ends in a 1v1.

---

## 7. Object library [Proposed]

Each object entry holds:

| Field       | Example                  |
|-------------|--------------------------|
| Name        | "Giraffe"                |
| Model       | 3D model in ServerStorage|
| Real height | 5.2 (metres)             |
| Category    | Animals                  |
| Difficulty  | Easy / Medium / Hard     |

Reference objects are a small fixed set everyone knows (door, Roblox
avatar, car, house). The game picks a reference that is not too far from
the mystery object's size, so both fit on the stage.

---

## 8. Technical components (Roblox) [Proposed]

### 8.1 Where things live

| Location              | Component            | Job                                           |
|-----------------------|----------------------|-----------------------------------------------|
| Workspace             | Tables (Seats, Stage)| Physical tables players sit at                |
| ServerStorage         | Object models        | Hidden until a round needs them               |
| ServerScriptService   | TableManager         | Detects full tables, starts/cancels matches   |
| ServerScriptService   | MatchController      | Runs one match: rounds, timers, phases        |
| ServerScriptService   | ScoringModule        | Error, points, round winner                   |
| ServerScriptService   | EliminationModule    | HP / lives / knockouts                        |
| ServerScriptService   | ObjectLibrary        | Object list with real heights                 |
| ServerScriptService   | DataService          | DataStore: wins, points, leaderboard          |
| ReplicatedStorage     | RemoteEvents         | Client <-> server messages                    |
| StarterPlayerScripts  | GuessUI              | Slider, lock-in button, timer                 |
| StarterPlayerScripts  | StageView            | Camera + live resize of the mystery object    |

### 8.2 Messages (RemoteEvents)

| Event          | Direction        | Carries                                  |
|----------------|------------------|------------------------------------------|
| RoundStart     | server -> client | Reference name/height, mystery model id  |
| SubmitGuess    | client -> server | Scale factor                             |
| RoundReveal    | server -> client | True height, every player's guess, winner|
| StateUpdate    | server -> client | HP / lives / points per player           |
| MatchEnd       | server -> client | Final standings                          |

### 8.3 Cheating protection

- The **server** owns the real heights; the client only gets the true
  height inside `RoundReveal`, after guessing closes.
- The mystery model is sent at a neutral display size so its starting size
  gives nothing away.
- The server ignores guesses that arrive after the timer or from players not
  at that table.

### 8.4 Edge cases

- Player leaves mid-match -> treated as eliminated; if only one player is
  left, they win.
- Nobody locks in -> slider value at time-out is used.
- Tie on the final elimination -> sudden-death round.

---

## 9. Later ideas (not in first version) [Proposed]

- Coins for wins, spent on slider skins / seat effects.
- Themed object packs (animals, buildings, space).
- Ranked tables with a skill rating.
- Private tables with invite codes.

---

## 10. Decisions needed from you

1. Elimination: accept the recommendation in section 6, or choose other
   options?
2. Guess input: slider only, or slider plus typing a number?
3. Units: metres, feet, or "x times the reference" only?
4. Guess timer / starting HP / starting lives - happy with the
   suggested numbers?
5. Working title - keep "Size Duel" or name it yourself?
