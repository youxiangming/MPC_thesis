---
name: thesis-review
description: >
  Run a full pre-handover review of the HERo thesis before the user reads it
  themselves, and cross-check the English LaTeX against the Chinese reading
  copies in `thesis-wzl/zh/`. Produces a defect list and an explicit
  ready / not-ready verdict. Use whenever the user signals they are about to
  review the thesis by hand or wants it checked over — "检查一下论文",
  "再次审阅", "我准备人工审核了", "审一遍", "核对中英版本", "是否可以人工审核",
  "review the thesis", "check the draft before I read it", "is it ready for
  review" — and before handing a build to the supervisor.
---

# Thesis review (HERo, WZL)

A reading pass by a person is expensive. This skill spends machine time first so
the person's time goes to judgement calls, not to catching stale numbers.

**Read before starting, in this order:** `CLAUDE.md` (precedence, §Numbers, the
four hard rules), `.cursor/skills/thesis-writing/references/supervisor-requirements.md`
(marking criteria), then `references/terminology.md` and `style-guide.md` if the
pass will touch wording. The auto-memory under
`~/.claude/projects/-home-xy-HERO-thesis/memory/` carries settled decisions
(machine names, MRT rate, config drift, joint limits) — recalled memories reflect
what was true when written, so verify against the live repo before acting on one.

Findings are reported, not silently fixed, unless the user asked for fixes.

## 1. Build health

Clean rebuild — delete the PDF first so a stale file cannot pass as a fresh one.

```bash
cd /home/xy/HERO-thesis && rm -f thesis-wzl/main.pdf && \
  PATH="/home/xy/HERO-thesis/.tools:$PATH" ./.tools/tectonic -X compile \
  thesis-wzl/main.tex --outdir thesis-wzl --keep-intermediates --synctex 2>&1 \
  | grep -iE "^error|Overfull|Underfull|Undefined"
cd thesis-wzl && echo "pages $(pdfinfo main.pdf|awk '/Pages/{print $2}') \
figs $(grep -c 'contentsline {figure}' main.lof) \
tabs $(grep -c 'contentsline {table}' main.lot) \
bib $(grep -c 'entry{' main.bbl) \
undef $(grep -icE 'LaTeX Warning: (Reference|Citation)' main.log) \
texerr $(grep -c '^! ' main.log)"
```

Exit 0 with zero undefined references, zero TeX errors and no overfull boxes is
the bar. `% VERIFY` in `lit/References.bib` must be zero. A "TeX rerun seems
needed" warning comes from the disabled glossary's makeindex step and is benign.

## 2. Numbers

The rule that has failed most often (`CLAUDE.md` §Numbers). Recompute, do not
re-read. Experiment values come from the frozen archive, never the working tree:

```
/home/xy/hero-ros2/src/paper_data/experiment_a/20260814_005ms_8pt/
  {dummy,mock,real}/csv/ee_metrics.csv     e_p, e_o, e_parallel, segment_id
  {dummy,mock,real}/csv/solver_diag.csv    solve_time_last_ms
  {dummy,mock,real}/csv/policy.csv         n_knots, horizon, dt01
  config/                                  the task/waypoint snapshot (a38bc0d)
```

Filter `segment_id >= 1`. Recompute e_p RMS/max, e_o RMS/max, mean
`t_lag = mean(e_parallel)/v_ref` with `v_ref = 0.05`, solve-time mean/median/p95/max,
and the Hausdorff triple (1 mm resampling of the commanded polyline, both
directed distances, symmetric mean and P95). Compare every figure against the
text and the tables of Chapters 4 and 5.

Config values in Chapter 3 are re-read from
`/home/xy/hero-ros2/src/Hero_OCS2/hero_ocs2_mobile_manipulator/config/hero/task_hardware.info`
and from `MobileManipulatorHardwareMRT.cpp` for the bridge thresholds.

Then apply the two tests that caught real defects:

- **Is it derived or counted?** A number obtained by dividing a horizon by a
  configured step, or multiplying a rate by a duration, is a hypothesis. If the
  quantity exists in a recording, it must be counted there. The node count per
  solve went 600 → 120 → a counted median of ten this way.
- **Is it configured or achieved?** `mpcDesiredFrequency` is a configured 10 Hz
  that throttles nothing on the robot; the achieved solve rate is
  `min(f_MRT, 1/t_solve)` ≈ 4.4 Hz. Flag any sentence that presents one as the
  other.

## 3. Supervisor rules

```bash
cd /home/xy/HERO-thesis/thesis-wzl/01_chapters
# banned evaluative words, impersonal constructions, false methodology claims,
# past-tense references to chapters that still exist
grep -inE "excel|wonderful|impressive|elegant|myopic|seamless|crucial|pivotal|delve|one speaks|one calls|systematic|previous chapter" *.tex
# placeholders must never reach a build
grep -n "\\\\todo\|\[Name\]\|\[Matric" *.tex ../main.tex
# sourcing density: Ch1 and Ch2 should sit at 30-40
for f in *.tex; do printf "%-26s %s\n" "$f" "$(grep -o '\\cite{' $f|wc -l)"; done
```

Also check that no fact is cited to a literature review rather than the primary
paper, and that the KALIMORO internal report appears nowhere.

**Figure density** — the supervisor's rule is no more than about three pages of
continuous prose without a figure or table. Measure it rather than guess:

```bash
cd /home/xy/HERO-thesis/thesis-wzl && python3 - <<'EOF'
import re

def float_pages(fn, kind):
    out = []
    for line in open(fn, encoding='utf-8'):
        if re.search(r'contentsline \{%s\}\{\\numberline' % kind, line):
            out.append(int(re.search(r'\}\{(\d+)\}', line).group(1)))
    return out

pages = sorted(set(float_pages('main.lof', 'figure') + float_pages('main.lot', 'table')))
toc = open('main.toc', encoding='utf-8').read()
start = int(re.search(r'chapter\}\{\\numberline \{1\}.*?\}\{(\d+)\}', toc).group(1))
end = int(re.search(r'chapter\}\{References\}\{(\d+)\}', toc).group(1))

gaps, prev = [], start - 1
for p in pages + [end]:
    if p - prev - 1 >= 3:
        gaps.append((prev + 1, p - 1))
    prev = p
print("float pages:", pages)
print("gaps >= 3 pages:", gaps or "none")
EOF
```

## 4. Internal consistency

Read for contradictions across chapters, which is where this draft has failed
repeatedly:

- a table's scores against the sentence that summarises them (Chapter 2's
  requirement table versus the selection paragraph);
- a mechanism described twice in different words (how the reference is
  interpolated, in Chapters 3 and 4);
- hedging that differs between chapters for the same claim (the DDS/Zenoh switch
  in §3.2 versus Chapter 5);
- a conclusion that restates a measurement the body has since corrected
  (Chapter 6 against Chapters 3 and 5);
- a provenance detail that contradicts the narrative order (a recording date
  later than the chapter implies).

## 5. English against Chinese

`thesis-wzl/zh/NN_*.md` are full Chinese reading copies of the current English
and must not drift. Check, in this order:

1. **Structure.** Every `\section`/`\subsection` in the `.tex` has a heading in
   the matching `.md`, same numbering.
2. **Floats.** The `zh` copies point at figures and tables by number
   (`图 4.6`, `表 4.3`). Regenerate the real numbering from `main.lof`/`main.lot`
   after any insertion and confirm each pointer, since inserting one float
   renumbers everything after it.
3. **Numbers.** Every quantity present in both must match:

Build the pair list from whatever changed this round — left column as the
English source spells it, right column as the Chinese copies spell it — then:

```bash
cd /home/xy/HERO-thesis/thesis-wzl && python3 - <<'EOF'
import glob, re
# (label, pattern in 01_chapters/*.tex, pattern in zh/*.md)
pairs = [
    ("dummy e_p RMS",      r"\\qty\{11\}\{\\milli\\meter\}", r"11 mm"),
    ("measured lap",       r"103\.9",                              r"103\.9"),
    ("nodes per solve",    r"median of ten nodes",                  r"10 个节点"),
    ("policies counted",   r"713 policies",                         r"713 份策略"),
    ("config snapshot",    r"a38bc0d",                              r"a38bc0d"),
]
def count(globpat, pat):
    return sum(len(re.findall(pat, open(f, encoding='utf-8').read()))
               for f in glob.glob(globpat))
for label, en, zh in pairs:
    e, z = count('01_chapters/*.tex', en), count('zh/*.md', zh)
    flag = "" if (e > 0 and z > 0) else "   <-- MISSING ON ONE SIDE"
    print(f"{label:22s} EN {e:3d}   ZH {z:3d}{flag}")
EOF
```

A quantity present on one side only is the defect this catches: it means a
correction landed in one language and not the other.

4. **Corrections.** When a claim changed in the English, grep the Chinese for the
   superseded wording — including `zh/README.md`, whose per-round summary is easy
   to leave behind, and `zh/CHANGELOG_*.md`.
5. **Settled terminology.** 外部 PC / IPC (never 工作站), HERo, `plant` → 被控对象.

## 6. Look at the figures

TikZ overflows silently. Render every figure added or changed since the last
review and read the page:

```bash
cd /home/xy/HERO-thesis/thesis-wzl && pdftoppm -f <pdfpage> -l <pdfpage> -r 100 -png main.pdf /tmp/fig
```

The LoF prints *printed* page numbers; the PDF page is offset by the front
matter, so locate the page with `pdftotext -f N -l N main.pdf - | grep` before
rendering. Check labels inside shapes, labels straddling a Venn region boundary,
and diagrams wider than the text block.

## 7. Report

Open with the verdict — ready for manual review, or not, and why. Then:

- defects found this pass, each with `file:line` and the evidence that it is a
  defect (a config value, a recomputed number, a source line);
- build health as a single line of metrics;
- what was verified and, equally, **what was not** — say plainly if the
  bibliography metadata was not re-checked this pass, or if a chapter's derived
  quantities were not audited;
- open items that block submission (abstract, untracked figure data, unsigned
  declaration) separated from open items that are the user's decision
  (splitting Chapter 3);
- the two or three passages the person should read first, which are the ones
  whose wording changed most recently.

Do not claim a check that was not run.
