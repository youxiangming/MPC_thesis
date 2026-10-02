# Project Handoff
> Last updated: 2026-10-02 by Cursor · previous 2026-09-30 (Claude Code)
> Detail ledger: `thesis-wzl/zh/CHANGELOG_2026-10-02.md`

## 1. Goal (stable)

LaTeX thesis "Integration and Validation of Whole-Body Model Predictive Control
for a Mobile Manipulator in Line-less Assembly" (WZL-IQS, RWTH Aachen; supervisor
Guillaume Tréheux, M.Sc.). Root `thesis-wzl/main.tex`, built with bundled
Tectonic in `.tools/`.

## 2. Current Objective

Figure/wall-of-text work for Ch.3–6 is largely done. Next priorities are
**submission blockers** (abstract, acronyms, PA vs MA) and the open **Ch.3 split**
decision — not more TikZ unless a review asks.

## 3. State: Done ✅

### Since 2026-09-30 (Claude Code + Cursor, 2026-10-02) — see CHANGELOG

**Ch.3 fact fixes + photos**
- MRT bridge loop **50 Hz** (`mrtDesiredFrequency`); Exp A sessions were 100 Hz; why 50 is enough; `mpcDesiredFrequency=10` = warning only on hardware.
- IPC hardware in §3.2: i5-6300U, 2C/4T, 7.7 GB, non-RT, powersave.
- Joint limits = experiment-time panel values; wrist 3 later widened to ±363°; `fig:pendant-limits` + caption.
- Self-collision: no `collision_pairs_dropped.info`; dropped pairs live in task-file comments; `tab:collision-pairs` (32→12); motive = solve time.
- No torque commands to base/arm in this stack (trajectory / velocity only).
- Photos: `fig:hero-photo` (front/rear), `fig:pendant-limits` — files under `thesis-wzl/03_figures/` (EXIF stripped).
- Prior TikZ (09-30): frames, cost, barrier, rt-invariant, reset, bridge-cycle still in place.

**Ch.2** — learning/RL family removed from taxonomy + comparison table (bbl 61→57).

**Ch.4 figures** — `fig:ee-error-decomp`, `fig:hausdorff-directions`, `fig:sim-dummy-stack`, `fig:sim-box`, `fig:sim-phases`.

**Ch.5 figures** — `fig:hw-solve-ecdf` (+ `hw_*_solve_ecdf.dat`), `fig:hw-lag`; path/error/solve figures present.

**Ch.6** — `fig:requirements-trace` (R1–R7 → evidence).

**zh reading copies** — Ch.1–6 synced to current English (no more 工作站 / dual deployment).

**Rules / memory** — cloud-discussion notes are narrative-only; live `hero-ros2` wins
(`.cursor/rules/thinking-notes-source.mdc`, `CLAUDE.md`, `load-hero-project`).
Claude memory: `ipc-hardware`, `mrt-rate-50hz`, `ur-panel-joint-limits-changed`,
two cloud narrative files.

**Build (verified this handoff):** tectonic exit 0, undefined 0, **57** bib entries, **68** pages.

### Earlier (collapsed)
- 2026-09-30: Ch.3 TikZ 1→7; bridge-on-IPC only; workstation→external PC.
- 2026-09-10: Ch1–2 rewrite; Ch3–6 sourcing; bib rebuild.

## 4. State: In Progress 🚧

Nothing half-edited in LaTeX; tree compiles. **Everything below is uncommitted.**

This handoff session only wrote `HANDOFF.md` + `CHANGELOG_2026-10-02.md`.
All chapter/rule/photo edits are from earlier 2026-10-02 Claude/Cursor sessions.

```
# modified (substantive)
.cursor/rules/thinking-notes-source.mdc
.cursor/skills/load-hero-project/SKILL.md
.cursor/skills/thesis-writing/references/terminology.md
.cursor/thinking-source-state.md
CLAUDE.md
HANDOFF.md
thesis-wzl/01_chapters/02_state_of_the_art.tex
thesis-wzl/01_chapters/03_integration.tex
thesis-wzl/01_chapters/04_simulation.tex
thesis-wzl/01_chapters/05_hardware.tex
thesis-wzl/01_chapters/06_conclusion.tex
thesis-wzl/main.pdf
thesis-wzl/zh/*.md  (01–06, README, SUPERVISOR_COMMENTS_RESOLVED)

# untracked
thesis-wzl/03_figures/hero_photo_front.jpg
thesis-wzl/03_figures/hero_photo_rear.jpg
thesis-wzl/03_figures/ur_pendant_joint_limits.jpg
thesis-wzl/03_figures/hw_mock_solve_ecdf.dat
thesis-wzl/03_figures/hw_real_solve_ecdf.dat
thesis-wzl/zh/CH3_REVISION_PREP.md
thesis-wzl/zh/CHANGELOG_2026-10-02.md   # this handoff
```

Suggested commit batches: (1) rules+memory docs, (2) Ch.2–6 + figures assets, (3) zh copies + changelogs.

## 5. Next Steps (ordered)

1. **Commit** the uncommitted tree (offer below) — otherwise the next tool starts dirty.
2. **Decide: split Chapter 3?** (supervisor #27). Ch.3 is now large (~photos+TikZ+table); natural cut still §3.1–3.2 vs §3.3–3.4. Do before more Ch.3 structure edits.
3. **English abstract** + **acronym list** (template stock still commented) — submission blockers.
4. **Confirm thesis type** PA vs MA (`main.tex` vs topic description).
5. Optional: clarify installation name `kalimoro` (task comment) vs `mft` (pendant photo).
6. Optional: dummy Experiment A lap → three-column mock/dummy/hardware table (Claude floated; not started).
7. Tube-holder / mount-plate close-ups — no longer blocking (`tab:collision-pairs` covers the claim).

## 6. Key Decisions & Constraints

- **Bridge-on-IPC only** — no split/integrated contrast as current options. Launch files for the other layout may still exist in the repo.
- **Off-board machine = "the external PC"** — never workstation/host. Ch.1 "workstations" = assembly stations — leave alone.
- **Experiment figures** from frozen `hero-ros2/src/paper_data/experiment_a/20260814_005ms_8pt/`, never live `task_experiment_a.info`.
- **Daily operating point** in Ch.3 tables from live `task_hardware.info` (T=1.2 s, MRT 50 Hz, …) — label which is which.
- **Joint limits in thesis** = experiment-time panel; do not "fix" task file to match today's pendant W3.
- **Cloud vault notes** = narrative only; `task_hardware.info` / code win. Prefer finer OCS2 deployment note over the broad ledger when they disagree on detail.
- Bib keys `AuthorYearShortTitle`; KALIMORO internal review not citable; no `\citep`; WZL template owns citation format.
- Learning/RL family: **out of the comparison** (author, 2026-09-30). Do not re-add without asking.

## 7. Gotchas / Failed Attempts

- **`join` TikZ key** reserved → use `rail`.
- Tall tables need `[!htbp]` or they float to empty pages.
- TikZ overflow silent — always `pdftoppm` the page (PDF page = printed + 4).
- Do not blind-replace "workstation" (Ch.1 assembly stations).
- Live task config drifted from frozen Exp A (`nThreads`, `useFeedbackPolicy`, horizons, MRT 50 vs 100).
- Pendant photo W3 ≠ task file — intentional post-experiment change, documented in caption.
- vault `zh/CH3_REVISION_PREP.md` §1/§3.2/§5 are **stale** (banner at top); use English tex + this HANDOFF.

## 8. Environment & Commands

```bash
cd /home/xy/HERO-thesis/thesis-wzl && \
  PATH="/home/xy/HERO-thesis/.tools:$PATH" \
  /home/xy/HERO-thesis/.tools/tectonic -X compile main.tex \
  --outdir . --keep-intermediates --synctex

# PDF page N ≈ printed chapter page N-4
pdftoppm -f <pdfpage> -l <pdfpage> -r 120 -png main.pdf /tmp/out

grep -ic undefined main.log   # 0
grep -c '\entry{' main.bbl    # 57
pdfinfo main.pdf | grep Pages # 68
```

## 9. Relevant Files Map

| Path | Role |
|---|---|
| `CLAUDE.md` | Precedence + cloud-note authority |
| `thesis-wzl/zh/CHANGELOG_2026-10-02.md` | Today's change ledger |
| `~/.claude/projects/-home-xy-HERO-thesis/memory/` | IPC, MRT 50, panel limits, cloud narrative |
| `.cursor/skills/thesis-writing/references/supervisor-requirements.md` | Binding marking criteria |
| `thesis-wzl/01_chapters/03_integration.tex` | Ch.3 — photos + TikZ + collision table |
| `hero-ros2/.../config/hero/task_hardware.info` | Daily operating point |
| `hero-ros2/src/paper_data/experiment_a/20260814_005ms_8pt/` | Frozen Exp A |
| `/home/xy/thinking/thesis/claude 云端讨论总结.md` | Broad narrative ledger (not fact authority) |
| `/home/xy/thinking/thesis/OCS2 在 Hero…论文素材.md` | Finer failure/design narrative |
| `thesis-wzl/zh/*.md` | Chinese reading copies — **synced 2026-10-02** |

## 10. Session Log (newest first)

- 2026-10-02 [Cursor]: Wrote this handoff + `CHANGELOG_2026-10-02.md`. Verified build 68 pp / 0 undefined / 57 cites. No LaTeX edits this session.
- 2026-10-02 [Claude Code + Cursor]: Ch.3 MRT 50 Hz, IPC specs, self-collision table, pendant/platform photos, W3 panel caveat; Ch.4–6 figures; Ch.2 drop RL; zh sync; cloud-note rules. Build 61→68 pp.
- 2026-09-30 [Claude Code]: Ch.3 figures 1→7; bridge-on-IPC only; external PC wording; project memory.
- 2026-09-10 [Cursor / Claude Code]: Ch1–2 rewrite; Ch3–6 sourcing; bib; rules docs.
