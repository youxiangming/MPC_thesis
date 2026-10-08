---
name: thesis-writing
description: "Write and revise academic English for Xiangming's M.Sc. thesis on whole-body MPC deployment for the Hero mobile manipulator (WZL, RWTH Aachen), and for the related WBMP seminar paper. Use this skill whenever the user asks to draft, translate, polish, or restructure thesis text — including when they provide Chinese bullet points to be turned into English prose, say '写论文', '翻译成学术英语', '润色', 'draft chapter X', 'improve this paragraph', 'de-AI this text', or paste LaTeX/Typst thesis content for review. Also use it when writing abstracts, figure captions, or supervisor emails about the thesis. The core job is to produce academic English that reads like a competent engineering graduate student wrote it, not like an LLM, and that is factually grounded in the Hero/OCS2 project."
---

# Thesis Writing — Hero Whole-Body MPC

Produce and revise academic English for the master's thesis "Whole-body motion control for autonomous mobile manipulators in production environments" (WZL IQS, Cognitive Robotics group, supervisor Guillaume Tréheux) and the parallel WBMP seminar paper.

Four reference files support this skill:

- `references/supervisor-requirements.md` — the binding rules from the supervisor's annotated review (sourcing, primary-vs-review citation, figure density, and the language rules he marked). **Read this before any drafting, polishing, or citation task.** These are marking criteria, not preferences; where they conflict with a general style rule, they win.
- `references/citation-workflow.md` — how a citation is actually added in this repo: which `.bib` file, key convention, which `\cite` commands the WZL template supports (`\citep` does **not** compile here), and placement. **Read this before touching citations or `.bib` files.**
- `references/style-guide.md` — the full de-AI style rules with before/after rewrite examples. **Read this before any drafting or polishing task.**
- `references/terminology.md` — canonical terminology and acronym discipline. Read it before writing any content that names hardware, software, or methods. It deliberately contains no parameter values — numbers always come from the repository at draft time.

**Before any drafting that states facts about the robot, integration, experiments, or results:** follow `load-hero-project`. That skill now also refreshes `/home/xy/thinking` (debug notes / problem log). Skip the vault check only if this same session already reported it.

## Core workflow: Chinese bullets → English draft

The user's standard input is Chinese-language bullet points or rough notes. The output is academic English prose ready to paste into the WZL LaTeX template (thesis) or Typst (seminar paper).

0. **Refresh sources first.** Run `load-hero-project` Mode B at least, including the `/home/xy/thinking` mtime check. If a thinking note is relevant to this section (problems, mitigations, experiment intent), read it before drafting.
1. **Read the bullets for logical structure first, not sentence-by-sentence.** Chinese notes often list facts in discovery order; the English draft should present them in argument order (claim → evidence → implication). Reorder freely. If the intended logic is ambiguous, ask one short question rather than guessing.
2. **Draft in prose, not bullets.** Thesis body text is continuous paragraphs. Only keep list form if the source is genuinely enumerable (e.g., experimental procedure steps, hardware specs) and the target section conventionally uses lists.
3. **Never source numbers from this skill or from memory.** Every quantity in the draft must be read from the repository at draft time (config files, `HANDOFF.md`, measurement outputs) or come verbatim from the user's notes. If a number can't be verified, write `\todo{verify: ...}` (LaTeX) or a `// TODO` comment (Typst) instead of inventing one. **A number you derived from two configured settings is not a measured number** — if the quantity appears in a recording, count it there; if it does not, present it as a configured value and not as an outcome. The full rule, with the cases where this has already failed, is `CLAUDE.md` §Numbers; it wins over anything here.
4. **Apply the style guide** (see `references/style-guide.md`) as you write — not as a cleanup pass afterwards. Drafts written "AI-flavored first, fixed later" retain structural tells even after word substitution.
5. **Return the draft plus a 2–4 line note** listing (a) reordering decisions made, (b) anything flagged as TODO/unverified, (c) terms where a translation choice was non-obvious. Keep this note short; don't annotate every sentence.

## The register to hit

Write like a strong non-native engineering graduate student who reads a lot of ICRA/IROS/RA-L papers: plain, precise, slightly dry. The text should be unremarkable in the best sense — a reader notices the content, not the writing.

Quick self-check before returning any draft (full rules in the style guide and the supervisor requirements):

- No words from the banned list (delve, leverage, crucial, seamlessly, showcase, …), and no subjective praise (excel, wonderful, powerful).
- No three-item parallel constructions used as rhetorical decoration.
- No paragraph that opens with an empty topic sentence and closes with an empty summary sentence.
- Claims are either cited, derived, or hedged — never asserted with LLM confidence ("clearly", "obviously", "it is evident that").
- **Every non-obvious statement carries a source**, placed at the end of the sentence or paragraph it supports.
- **No fact is cited to a literature review** when it originates in a paper that review summarises.
- No absolute claim of cost, speed, or quality without a named baseline.
- No suitability verdict before the criteria exist as a numbered, referenceable list (currently R1–R7, `\cref{tab:requirements}`).
- Present tense for chapters, documents, and published methods that still exist.
- Sentence lengths vary; at least one paragraph per section contains a short sentence (< 10 words).
- Every acronym expanded at first use, then used consistently (see glossary).
- Any passage explaining a mechanism, taxonomy, architecture, or two-way contrast has a figure, or a note saying why it does not.

## Document conventions

**Thesis (LaTeX, WZL template) — match the current `thesis-wzl/` project exactly.**
All drafts are emitted as LaTeX in the format of the live project, not generic markup. Concrete conventions, verified against the repo:

- **Engine/build:** root is `thesis-wzl/main.tex`, class `format/WZLTemplate` (options `a4paper, 11pt, en, usefiramath, sans, openright`). The project is built by a **bundled Tectonic engine** (`.tools/tectonic`, which runs XeTeX + biber in one pass), driven by the LaTeX Workshop config in `.vscode/settings.json` (auto-build on save, PDF in a right-hand tab). `biber` also lives in `.tools/` and is **not** on the system PATH; there is no system `latexmk`/`xelatex`/`pdflatex`. Never assume pdfLaTeX. Use only RWTH color names defined by the template.
- **Compile check (run after any LaTeX edit):** verify from the thesis root with the same engine the plugin uses —
  ```bash
  cd /home/xy/HERO-thesis/thesis-wzl && \
    PATH="/home/xy/HERO-thesis/.tools:$PATH" \
    /home/xy/HERO-thesis/.tools/tectonic -X compile main.tex \
    --synctex --keep-intermediates --keep-logs -Z shell-escape
  ```
  Exit code 0 with `main.pdf` rewritten means the edit is safe. Do **not** fall back to `latexmk`/`xelatex` (not installed); prepend `.tools/` to PATH so Tectonic finds `biber`.
- **File layout:** body chapters live in `01_chapters/NN_name.tex` and are pulled in via `\include` from `main.tex`. Every chapter file starts with `% !TeX root = ../main.tex`, then `\chapter{...}\label{ch:...}`, and sections use `\section{...}\label{sec:...}` (label prefixes `ch:` / `sec:`). Match this scaffolding when drafting a chapter; don't invent a new file structure.
- **Custom macros (use them, don't retype):** text macros in `Usercustomised_Content/functions.tex` — `\ocs{}` (OCS2), `\mpc{}` (MPC), `\hero{}` (HERo), `\ee{}` / `\EE{}` (end-effector); math vectors `\svec`, `\uvec`, `\qarm`. Acronyms are defined in `Usercustomised_Content/acronyms.tex` — use the acronym mechanism there rather than hardcoding expansions.
- **Packages already loaded by the class** (in `custom_packages.tex`/class): graphicx, caption, subcaption, booktabs, tabularx, float, amsmath, amssymb, bm, xcolor, hyperref, biblatex, csquotes, microtype, unicode-math (Fira Math), plus `siunitx` and `cleveref`. **Do not `\usepackage` these again.**
- **Numbers with units:** siunitx is configured (`detect-all, per-mode=symbol`); write `\qty{0.1}{\meter\per\second}` / `\SI{...}` style, never inline "0.1 m/s" in math-adjacent text. `\hz` is a declared unit.
- **Cross-references:** cleveref is loaded with `[capitalise,noabbrev]`; always use `\cref{...}` / `\Cref{...}` (never hardcode "Figure 3.2" or "Section 3").
- **Figures:** `\graphicspath` points at `03_figures/`; reference images by filename relative to that, and wrap in the template's figure conventions.
- **Citations:** the bibliography is `lit/References.bib` (loaded via `\bibliography{lit/References.bib}`). Only cite entries that exist and are verified there; if a needed entry is missing or TODO-marked, flag it in the return note instead of citing silently. Entries are Crossref-verified before use (see `references/supervisor-requirements.md` §5) — no `% VERIFY` entry may reach a build that goes to the supervisor. Style is biblatex `alphabetic` with a WZL label template (first 4 letters of the first author's surname + 2-digit year), so the visible label is derived from the entry, not from the key; keys follow `AuthorYearShortTitle`.
- **Figures:** diagrams are TikZ written inline in the chapter file, reusing the `box`/`flow`/`lbl`/`machine` styles established in `03_integration.tex`. After adding one, render the page (`pdftoppm -f N -l N -r 110 -png main.pdf out`) and look at it — TikZ silently lets labels overflow their shapes.
- **TODO discipline:** unresolved facts/numbers stay as `\todo{verify: ...}` in the LaTeX, consistent with the existing `% TODO:` scaffolding already in the chapter stubs.

**Seminar paper (Typst):** same style rules; adapt markup accordingly.

**Tense conventions:**
- Related work / background: present tense for what published methods do ("OCS2 formulates the OCP as…"), past tense for what specific papers reported.
- Implementation chapters: past tense for what was done, present tense for how the system behaves.
- Results: past tense for the experiment, present tense for what the data shows.

**Chapter awareness:** The agreed writing order is Ch. 3 (system/implementation) first, then Ch. 2 (fundamentals/related work), Ch. 4 (experiments), then Ch. 1, 5, 6. When drafting, note which chapter the text belongs to and match its conventions; don't put related-work-style citations density into Ch. 3, and don't put implementation detail into Ch. 2.

## Revision and polishing tasks

When the user pastes existing English (their own or AI-generated) and asks to fix it:

1. Diagnose before rewriting: name the 2–3 dominant problems (e.g., "uniform sentence length, decorative triads, unhedged claims") in one line each.
2. Rewrite the passage in full — don't return a diff-style list of small edits unless asked.
3. Preserve the author's factual content and citations exactly; if a claim looks wrong or unverifiable, keep it but flag it.
4. If the input already reads fine, say so and make only minimal edits. Do not churn text to justify the request.

## What not to do

- Don't inflate. If the bullets support one paragraph, write one paragraph. Thesis examiners at RWTH penalize padding.
- Don't invent related work, citations, or numerical results under any circumstances.
- Don't Americanize/Britishize inconsistently — the thesis uses **British-neutral international English with -ize spellings** (standard in IEEE venues); keep whichever variant the existing chapters already use if they differ.
- Don't restructure the user's argument silently on large scales (section level and above) — propose it first.
- Don't produce a "polished" version that changes technical meaning. When in doubt about a technical claim, ask or flag.
