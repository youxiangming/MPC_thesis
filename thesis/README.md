# Thesis: Whole-Body MPC (OCS2) on the HERo Mobile Manipulator

LaTeX source for the thesis. Written in English, `scrreprt` class,
bibliography via `natbib` + `IEEEtran.bst` (IEEE numeric style, needs
only `bibtex` — no `biber`).

## Layout

```
docs/thesis/
  main.tex            top-level document (title page, TOC, \input chapters)
  preamble.tex        packages and document-wide settings
  references.bib      bibliography  (⚠ verify every entry before submission)
  chapters/
    01_introduction.tex        (written)
    02_state_of_the_art.tex    (skeleton)
    03_integration.tex         (skeleton)
    04_simulation.tex          (skeleton)
    05_hardware.tex            (skeleton)
    06_conclusion.tex          (skeleton)
  figures/            put figures here (\graphicspath is set to this dir)
  latexmkrc           latexmk config (pdflatex + biber)
```

## Build

Recommended (handles the bibtex run automatically):

```bash
cd docs/thesis
latexmk -pdf main.tex
```

Manual sequence (if you don't use latexmk):

```bash
pdflatex main
bibtex main
pdflatex main
pdflatex main
```

Alternatively, with Tectonic (self-contained, no TeX install needed):

```bash
tectonic -X compile main.tex
```

Clean auxiliary files:

```bash
latexmk -c
```

## Requirements

A TeX distribution (TeX Live / MiKTeX) with `scrreprt`, `natbib`,
`IEEEtran` (provides `IEEEtran.bst`), `siunitx`, `cleveref`, `microtype`.
On Ubuntu a reasonable subset is:

```bash
sudo apt-get install texlive-latex-extra texlive-science \
  texlive-publishers latexmk
```

## Notes

- **Citations:** entries in `references.bib` marked `% VERIFY` were
  reconstructed from memory and must be checked against the original
  source before submission.
- **Title metadata:** author name and institute are placeholders in
  `main.tex` (`\thesisAuthor`, `\thesisInstitute`).
- Chapters 2–6 are compiling skeletons that mirror the agreed table of
  contents; content is filled in section by section.
