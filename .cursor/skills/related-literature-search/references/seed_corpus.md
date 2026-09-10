# Seed Corpus — WBMP SLR (Sant'Anna 2026) + Thesis Anchors (v2)


> **The report this corpus came from is not citable.** `report_KALIMORO_wbmpsearch.pdf`
> is an unpublished internal document by a colleague. Use it to locate papers; cite
> only the papers themselves, by DOI. It has no BibTeX entry and must not be named
> anywhere in the thesis.

## Validated search vocabulary
SLR core: "whole-body motion planning", "whole-body control", "mobile manipulator", "navigation stack", ROS/ROS2, MoveIt, Nav2, "local planner", "global planner", integration/framework/architecture.
Thesis additions: model predictive control, MPC, DDP, SLQ, OCS2, nonholonomic, differential drive, UR10e, path accuracy, motion capture, OptiTrack, warm start, solve time, real-time, Hausdorff distance, Fréchet distance, trajectory similarity.

## SLR inclusion/exclusion criteria (screening)
- EC 1 acronym false positives (wireless bitmap etc.) → exclude.
- EC 2 decoupled nav-only / fixed-base-only → excluded from SLR, but INCLUDE for thesis Ch.2 as the decoupled baseline.
- EC 3 control-layer-only without nav-stack integration → excluded from SLR, but the thesis needs exactly these (Pankert 2020, all Tier-1b solver papers).
- EC 4 locomotion-only morphologies → exclude. EC 5 reviews/editorials/unavailable → exclude as evidence.

## Citation genealogy — TWO generations (snowball depth 2)
Generation 1 (applications, cite in order):
1. Giftthaler 2017 ICRA (10.1109/ICRA.2017.7989411) → 2. Minniti 2019 RA-L (10.1109/LRA.2019.2927955) → 3. Pankert & Hutter 2020 RA-L 5(4):6177–6184 (10.1109/LRA.2020.3010721, NOT in SLR, closest prior work) → 4. Minniti 2021 ICRA → 5. Sleiman 2021 RA-L (10.1109/LRA.2021.3068908) → 6. Mittal 2022 IROS.

Generation 2 (what Generation 1 cites — solver/software foundations; source: OCS2 docs bibliography at leggedrobotics.github.io/ocs2/overview.html):
- Farshidian et al. 2017 Humanoids, pp.577–584 — parallel SLQ real-time MPC (arXiv:1710.04029). THE solver paper.
- Farshidian et al. 2017 ICRA — constrained SLQ quadruped framework.
- Grandia et al. 2019 IROS — Feedback MPC for torque-controlled legged robots (relaxed barriers; DDP feedback policy between MPC updates = theory behind MPC-MRT policy evaluation and policy-exhaustion analysis).
- Grandia et al. 2019 RA-L 4(2):1517–1524 — frequency-aware MPC.
- Farshidian, Hoeller & Hutter 2020 CoRL 990–1004 — Deep value MPC (group's own MPC+learning bridge).
- Carpentier et al. 2019 SII 614–619 — Pinocchio. Mastalli et al. 2020 ICRA — Crocoddyl. Verschueren et al. 2021 MPC — acados.
Snowballing rule: when a core paper is added, harvest its reference list (arXiv HTML pages expose full lists) and screen those too — depth 2 is the default, go deeper only on request.

## SLR final corpus (29 papers) — condensed
Reusable for thesis: Stelter 2022 (10.1109/IROS47612.2022.9982245), Stueben 2021, Merkt 2019, Honerkamp N2M2 (10.1109/TRO.2023.3284346), Jauhri 2022 (10.1109/LRA.2022.3188109), Grandia 2020 CBF, Gaertner 2021, Gawel 2019, Dadiotis 2022, Iriondo 2023, Yuan 2024, Tao (10.1049/cim2.70031), Storiale 2025 (10.1109/OJIES.2025.3597747). Full table: report_KALIMORO_wbmpsearch.pdf §3.5.4 / wbmp_complete.xlsx "final papers".

## Evaluation methodology — Hausdorff-first (ISO 9283 DEFERRED)
Current thesis decision (2026-08): Experiment A evaluates path precision via Hausdorff distance, not ISO 9283. ISO remains the documented fallback; data collection (rosbags + OptiTrack) is metric-agnostic so the decision is reversible in post-processing.
Anchor citations:
- Huttenlocher, Klanderman & Rucklidge 1993, T-PAMI 15(9):850–863 — the metric.
- Dubuisson & Jain 1994, ICPR — Modified Hausdorff (mean-based); report d_H AND MHD together.
- Alt & Godau 1995, IJCGA 5:75–91 — Fréchet distance; the order-aware escalation path if Hausdorff proves insufficient.
- Tao et al. 2021, GIScience & Remote Sensing, 10.1080/15481603.2021.1908927 — comparative survey of trajectory similarity measures; the metric-selection justification citation.
- Robotics precedents: arXiv:2105.08466 (d_H for repeated EE trajectory consistency); MHD-vs-ground-truth in navigation evaluation.
Known limitation to state: Hausdorff is order/time-agnostic — velocity claims need a separate speed-profile metric; discrete Fréchet is the drop-in escalation.

## Thesis differentiation claim (re-check against every new finding)
Hardware-validated whole-body MPC on a nonholonomic differential-drive base + UR10e, evaluated with Hausdorff/MHD path-similarity metrology against OptiTrack ground truth vs. a decoupled Nav2+MoveIt baseline. As of 2026-08: no found paper combines these; Hausdorff-based comparison of whole-body vs. decoupled pipelines appears unoccupied.
