# Prison Escape (Roblox)

A round-based Roblox game. The prisoners already broke out, but they left their
stash inside. Each round they have to run back across the yard, touch the
prison wall to grab the stash, and make it back to the safe zone. One player is
the Cop, and the Cop's job is to shoot every one of them before they get out.

## How a round works

1. Everyone waits in the lobby, a glass-walled room on a building beside the
   yard. A round starts once at least 2 players are in the server.
2. One player becomes the Cop, picked at random or chosen by the host (see
   Lobby settings).
3. The Cop gets a gun with `Ammo per prisoner x number of prisoners` bullets
   (2 per prisoner by default) and starts in front of the prison.
4. Everyone else is a Prisoner and starts in the blue safe zone at the other end
   of the yard. The Cop can't enter the safe zone and bullets don't hurt anyone
   standing in it.
5. Prisoners run to the prison wall (the glowing yellow strip in front of it) to
   grab the stash, then run back to the safe zone. That counts as escaping.
6. The round ends when every prisoner has escaped or been caught, or when the
   timer runs out. Anyone still out on the yard when time runs out is caught.
7. If nobody escaped, the Cop wins. Otherwise every prisoner who escaped wins.
   Wins show on the leaderboard.

Players who are caught or who escape go back to the lobby and can watch the
rest of the round through the glass.

## Controls

| Action         | PC         | Gamepad  | Phone / tablet   |
| -------------- | ---------- | -------- | ---------------- |
| Sprint         | Q          | X        | SPRINT button    |
| Drift          | E          | Y        | DRIFT button     |
| Shoot (Cop)    | Left click | R2       | Tap where to aim |

- **Sprint**: a few seconds of extra speed.
- **Drift**: a quick slide in the direction you are moving. You can steer it
  while it lasts, which makes you hard to hit.

## Pickups on the yard

| Pickup   | Who can take it | What it does                          |
| -------- | --------------- | ------------------------------------- |
| Ammo     | Cop only        | +2 bullets                            |
| Speed    | Prisoners       | A short speed boost                   |
| Recharge | Prisoners       | Resets the Sprint and Drift cooldowns |
| Shield   | Prisoners       | Blocks one bullet                     |

A new pickup appears somewhere else on the yard a few seconds after one is
taken.

## Lobby settings

The host can change these from the panel on the left of the screen between
rounds. The host is the private server owner if they are in the game,
otherwise whoever has been in the server the longest.

| Setting         | Options                                     | Default |
| --------------- | ------------------------------------------- | ------- |
| Cop pick        | Random, or Choose (the host picks a player) | Random  |
| Ammo / prisoner | 1 to 10                                     | 2       |
| Round time      | 1:00 to 5:00                                | 2:00    |

## Opening it in Roblox Studio

### With Rojo (recommended)

1. Install Rojo: https://rojo.space/docs/v7/getting-started/installation/
2. In this `prison-escape` folder, run:

   ```
   rojo build -o PrisonEscape.rbxlx
   ```

3. Open `PrisonEscape.rbxlx` in Roblox Studio.

While you are editing the scripts, `rojo serve` together with the Rojo Studio
plugin keeps Studio in sync with the files instead.

### By hand

Create these in Studio and paste in the contents of each file:

| File                          | Create in Studio                                                         |
| ----------------------------- | ------------------------------------------------------------------------ |
| `src/shared/Config.luau`      | ModuleScript `Config` in a Folder named `Shared` in ReplicatedStorage    |
| `src/shared/Net.luau`         | ModuleScript `Net` in that same `Shared` folder                          |
| `src/server/init.server.luau` | Script `PrisonEscapeServer` in ServerScriptService                       |
| `src/server/*.luau` (others)  | ModuleScripts with the same names, inside `PrisonEscapeServer`           |
| `src/client/init.client.luau` | LocalScript `PrisonEscapeClient` in StarterPlayer > StarterPlayerScripts |
| `src/client/*.luau` (others)  | ModuleScripts with the same names, inside `PrisonEscapeClient`           |

### Testing

A round needs at least 2 players, so pressing Play on its own only shows the
lobby. To test a real round, go to the **Test** tab, choose **Clients and
Servers**, set it to 2 or more players, and press **Start**.

## Changing the game

- Every number (speeds, cooldowns, bullet speed, timers, how many pickups, the
  size of the yard) is in `src/shared/Config.luau`.
- The yard is built by `src/server/Arena.luau` when the server starts. To use a
  map you built yourself in Studio instead, put a Model named `PrisonArena` in
  Workspace containing: parts named `SafeZone`, `StashZone`, `FieldFloor` and
  `CopSpawn`, a SpawnLocation named `LobbySpawn`, and a Folder named
  `PrisonerSpawns` with one part per prisoner spawn point. `SafeZone` and
  `StashZone` are the areas that count as the safe zone and the prison wall, so
  make them invisible and non-collidable. The game then uses your map instead of
  building one.

## Files

```
prison-escape/
  default.project.json   Rojo project: where each folder goes in the game
  src/shared/            Used by both the server and the players' devices
    Config.luau          All the numbers and lobby setting limits
    Net.luau             Remote events and the shared round state
  src/server/            Runs on the Roblox server
    init.server.luau     Starts everything
    Arena.luau           Builds the yard, lobby and spawn points
    Round.luau           Lobby -> countdown -> round -> results loop
    Lobby.luau           Host and lobby settings
    Gun.luau             The Cop's gun and the bullets
    Skills.luau          Sprint, Drift cooldowns, speed boosts and shields
    Pickups.luau         Ammo and skill pickups on the yard
  src/client/            Runs on each player's device
    init.client.luau     Starts everything
    Hud.luau             Timer, messages, skill buttons, ammo, settings panel
    Controls.luau        Keys and buttons for skills, the Drift slide, aiming
    Effects.luau         Bullet tracers and spinning pickups
```
