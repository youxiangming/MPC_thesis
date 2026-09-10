# Terminology Consistency

Terminology must be identical across all chapters. This file fixes *names and phrasing only* — it contains no parameter values. Any number that enters the thesis must be read from the repository (config files, `HANDOFF.md`, measurement outputs) or from `refs.bib` at draft time, never from this skill.

## Canonical terms

| Use this | Not this | Notes |
|---|---|---|
| the Hero platform / Hero | "the robot", "HERO" | freeMoVe differential-drive base + UR10e arm; full description once in the system chapter, then just "Hero" |
| whole-body MPC | WBC, full-body MPC | Expand "model-predictive control (MPC)" at first use |
| whole-body motion planning (WBMP) | — | Seminar-paper umbrella term; in the thesis, distinguish planning vs. control explicitly |
| the decoupled baseline / Nav2 + MoveIt pipeline | "the traditional approach" | Name the components; "traditional" is vague |
| OCS2 | ocs2, Ocs2 | Cite the framework at first mention |
| DDP/SLQ solver | "the optimizer" | Pick one name after first definition and stay with it |
| MPC–MRT interface / the MRT bridge | "the tracking node" | Expand MRT once |
| end-effector (EE) pose error | "tracking error" alone | Specify the reference frame when first defined |
| policy exhaustion | "policy timeout" | The solve-time-exceeds-window failure mode |
| ISO 9283:1998 | "the ISO standard" | Use the standard's own metric symbols (AT_p, RT_p, …) |
| OptiTrack motion capture system | "mocap" before first definition | Ground truth system |
| differential-drive base | "diff drive" (code contexts only) | "Nonholonomic" matters for the contribution claim — use it deliberately |

## Acronym discipline

- Expand every acronym exactly once, at first use in the main text (abstract counts separately — expand again there).
- After expansion, use the acronym consistently; do not alternate between full form and acronym for variety.
- Code identifiers (`solutionTimeWindow`, `TargetTrajectories`, node names) are set in monospace and never translated or paraphrased.

## Where numbers come from (pointers, not values)

- Controller/config parameters → the task `.info` files and YAML configs in the repo
- Architecture and current status → `HANDOFF.md`
- Measured results → rosbag post-processing outputs
- Cited claims → `refs.bib` entries that are verified (never cite TODO-marked entries silently)

If a needed number cannot be verified at draft time, insert `\todo{verify: …}` (LaTeX) or a `// TODO` (Typst) instead of a value.
