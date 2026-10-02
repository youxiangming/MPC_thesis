# HERo Thesis — working rules

LaTeX thesis: "Integration and Validation of Whole-Body Model Predictive Control
for a Mobile Manipulator in Line-less Assembly" (WZL-IQS, RWTH Aachen).
Root: `thesis-wzl/main.tex`. Supervisor: Guillaume Tréheux, M.Sc.

## Before writing or revising any thesis text, read these

They live under `.cursor/` (shared with Cursor) and are **not** auto-loaded here,
so read them explicitly:

1. `.cursor/skills/thesis-writing/references/supervisor-requirements.md`
   — binding rules from the supervisor's annotated review. **Marking criteria,
   not preferences.** Where they conflict with anything else, they win.
2. `.cursor/skills/thesis-writing/references/style-guide.md` — de-AI style rules.
3. `.cursor/skills/thesis-writing/references/terminology.md` — canonical terms.
4. `.cursor/skills/thesis-writing/SKILL.md` — LaTeX/build conventions for this repo.

For anything touching citations, also read
`.cursor/skills/thesis-writing/references/citation-workflow.md` (how to add one:
which `.bib` file, key convention, which `\cite` commands compile here) and
`.cursor/skills/related-literature-search/SKILL.md` (how to find and verify one).

## Precedence

1. **The WZL template decides** anything it configures — citation style, labels,
   fonts, page layout, the bibliography backend. It encodes chair-level
   formatting rules. Do not override it; use the hooks it provides (e.g. the
   `shorthand` field in the label template).
2. **Where the template is silent, the supervisor's requirements decide** —
   `.cursor/skills/thesis-writing/references/supervisor-requirements.md`.
3. **Where neither says anything**, follow the project conventions already
   recorded in the reference files, and keep them consistent.

**Vault / cloud-discussion notes** (`/home/xy/thinking/thesis/claude 云端讨论总结.md`
and the finer OCS2 deployment note) are narrative supplements for 小论文/thesis
only. Numbers, topology, and "current architecture" always follow live
`/home/xy/hero-ros2` (especially `task_hardware.info`) and settled project
memory. Full rule: `.cursor/rules/thinking-notes-source.mdc`.

One caveat on level 2: check that an instruction actually works against this
template before applying it. The supervisor suggested `\citep`, which is a
natbib command and does not compile here.

## The three rules that get checked hardest

- **Source every non-obvious statement**, citation at the end of the sentence or
  paragraph it supports.
- **Never cite a literature review for a fact that originates in a paper it
  summarises** — follow the review to the primary paper. The KALIMORO internal
  report by the colleague is not citable at all: it is a search aid, has no
  BibTeX entry, and must not be named anywhere in the thesis.
- **Draw the figure** for any mechanism, taxonomy, architecture, or two-way
  contrast. The supervisor's standing complaint is "a huge wall of text".

## Build

`biber` and `tectonic` are bundled in `.tools/` and are not on the system PATH.
There is no system `latexmk`/`xelatex`/`pdflatex`.

```bash
cd /home/xy/HERO-thesis/thesis-wzl && \
  PATH="/home/xy/HERO-thesis/.tools:$PATH" \
  /home/xy/HERO-thesis/.tools/tectonic -X compile main.tex \
  --outdir . --keep-intermediates --synctex
```

Exit 0 plus a rewritten `main.pdf` means the edit is safe. After adding a TikZ
figure, render the page and look at it — TikZ lets labels overflow silently:

```bash
pdftoppm -f <page> -l <page> -r 110 -png main.pdf /tmp/out
```

## Review trail

- `thesis-wzl/zh/SUPERVISOR_COMMENTS_v1.md` — the 52 PDF comments, extracted.
- `thesis-wzl/zh/SUPERVISOR_COMMENTS_RESOLVED.md` — per-comment resolution.
- `thesis-wzl/zh/REVIEW_2026-08-20.md` — internal full-draft review.
- `thesis-wzl/zh/*.md` — Chinese reading copies of each chapter.

## Open decisions (do not settle unilaterally)

- Whether to split Chapter 3 (supervisor: "beefy chapter, might consider splitting").
- Thesis type: `main.tex` declares `\thesistype{PA}`, the topic description says
  Master's thesis. This drives length expectations.
- Still missing before submission: English abstract, acronym list (currently
  commented out, and the template's 140 stock entries are unrelated to this work).
