# How to Add a Citation (this project)

The supervisor's resource list ends with `\cite{treheux26}`. That entry is not a
website — it is the last step of the pipeline he is describing:

```
database  →  reference manager  →  .bib entry with a key  →  \cite{key}  →  biber
IEEE/Scopus/  Zotero/Citavi/       References.bib             in the text     builds
Scholar       JabRef                                                          the list
```

The rule underneath it: **a reference is never typed into the running text or
into the bibliography by hand.** It exists once, as an entry in a `.bib` file,
and every mention in the thesis is a `\cite{}` pointing at that entry's key.
Biber then generates both the in-text label and the reference list. Renumbering,
re-ordering, and consistency are automatic; a hand-written reference silently
falls out of all of that.

## Who decides what

Three levels of authority. Resolve in this order.

**1. The WZL template decides — not negotiable.**
`thesis-wzl/format/WZLTemplate_files/SET_Bibliography.tex` fixes the citation
format for the whole chair. Do not override any of it:

| Setting | Value | Effect |
|---|---|---|
| `backend=biber` | biber, not bibtex | build breaks otherwise |
| `style=alphabetic` | alphabetic labels | not `[1]`, not `(Author, 2021)` |
| `\DeclareLabelalphaTemplate` | 4 uppercase letters + 2-digit year | `[SLEI21]` |
| `maxalphanames=1` | label from first author only | no `[SFMH21]` |
| `\labelalphaothers{}` | et-al `+` marker removed | `[SLEI21]`, never `[SLEI21+]` |
| `maxnames=10`, `giveninits=true` | up to 10 authors, initials only | `M. Giftthaler, F. Farshidian, ...` |
| `isbn=true`, `url=true`, `urldate=iso`, `date=iso` | ISBN/URL printed, ISO dates | |

The template's README adds one hard constraint: **BibTeX keys must not contain
spaces.**

The label template's first element is `\field[final]{shorthand}`, so the
`shorthand` field is the sanctioned way to fix a label — using it is following
the template, not working around it.

**2. Where the template is silent, the supervisor decides.**

| Question | Template | Supervisor's requirement |
|---|---|---|
| When does a statement need a citation? | silent | Every statement that is not completely obvious. |
| May a review be the source? | silent | No. Reviews are search starting points; cite the paper the fact comes from. |
| Where does the citation go? | silent | "put the citation at the end of the paragraph" — never mid-sentence after a tool's name. |
| Where do I search? | silent | IEEE Xplore, Scopus, ScienceDirect, SpringerLink, Google Scholar. |
| How do I manage references? | README says Citavi | Zotero, Citavi, or JabRef — he listed all three, Zotero first. |
| Supplementary tools | silent | ORKG Ask (question-style retrieval), VOSviewer (bibliometric maps). |

Note the one place his instruction does not survive contact with this template:
he suggested `\citep`, which is a natbib command and is **undefined here** (see
the command table below). His intent — a parenthetical citation at the end of the
paragraph — is served by plain `\cite`.

**3. Where neither says anything, these are the project's own conventions.**
They are choices, recorded so they stay consistent; change them deliberately or
not at all.

| Choice | Convention | Why |
|---|---|---|
| `.bib` file split | `References.bib` (published, DOI) + `sources-manual.bib` (repos, manuals, standards, internal) | an automated export would delete anything it cannot regenerate |
| Key naming | `AuthorYearShortTitle` | Better BibTeX's default, so the Zotero pipeline the supervisor recommends produces exactly these keys |
| Author-in-text form | `Sleiman et~al.~\cite{...}`, written by hand | `\textcite` prints all four authors here (`maxnames=10`, no et-al marker) |
| Metadata source | Crossref, checked per entry | Zotero and Scholar both get fields wrong |

One deliberate deviation worth knowing about: the supervisor's example key was
`treheux26` (surname + 2-digit year). This project uses
`Treheux2026TopicWBMP` instead. The key is internal — both print `[TRÉH26]` —
and his style collides in this bibliography, where Farshidian has two 2017
entries that would both become `farshidian17`. If he asks for his convention,
it is a rename of 56 keys plus every `\cite` in the text; raise it before doing it.

## Step by step

1. **Find the paper** (IEEE Xplore, Scopus, ScienceDirect, SpringerLink, Google
   Scholar). Copy its **DOI** — the DOI is the identifier everything else is
   derived from.
2. **Verify the metadata against the publisher**, not against Scholar's BibTeX
   button. Crossref is authoritative:
   ```bash
   curl -s "https://api.crossref.org/works/<DOI>" \
     | python3 -c "import json,sys; m=json.load(sys.stdin)['message']; \
   print(m['title'][0]); print(m['container-title'][0], m.get('volume'), m.get('page')); \
   print([a['family'] for a in m['author']])"
   ```
   This is not optional paranoia: the 2026-09 pass found 3 wrong entries out of
   12 unverified ones, including one journal name that was entirely incorrect and
   one paper that does not exist.
3. **Put the entry in the right file** (`thesis-wzl/lit/`):
   - `References.bib` — published literature: journal articles, conference
     papers, books. Has a DOI. A reference manager can own these.
   - `sources-manual.bib` — everything a reference manager cannot reproduce:
     source repositories, vendor documentation, standards, operating manuals,
     unpublished internal reports. **Never point an automated exporter at this
     file**; an export would delete these entries.
4. **Key convention:** `AuthorYearShortTitle` — `Pankert2020PerceptiveMPC`,
   `Sleiman2021UnifiedMPC`. This matches Better BibTeX's default so Zotero
   exports line up with what is already there.
5. **Cite it:** `\cite{Pankert2020PerceptiveMPC}` at the end of the sentence or
   paragraph the source supports.
6. **Rebuild** and check that no citation is undefined:
   ```bash
   grep -ic undefined main.log     # must be 0
   ```

## The key name does not decide the printed label

The WZL template loads biblatex with `style=alphabetic` and a custom label
template (`format/WZLTemplate_files/SET_Bibliography.tex`): **first 4 letters of
the first author's surname, uppercased, plus the last 2 digits of the year.**

So `\cite{Treheux2026TopicWBMP}` prints `[TRÉH26]`, and `\cite{treheux26}` would
print `[TRÉH26]` too. Key naming is purely internal; pick the convention that
survives a Zotero export and stop thinking about it.

**Corporate authors produce bad labels.** `ISO9283` has
`author = {International Organization for Standardization}`, so it prints
`[INTE98]`, which tells the reader nothing. The label template checks a
`shorthand` field first, so this is the fix:

```bibtex
shorthand = {ISO~9283},   % -> prints [ISO 9283] instead of [INTE98]
```

## Which citation commands actually work here

Verified by compiling against this template on 2026-09-10:

| Command | Renders as |
|---|---|
| `\cite{Sleiman2021UnifiedMPC}` | `[SLEI21]` |
| `\cite{Sandakalum2022Survey,Thakar2023MobileManip}` | `[SAND22; THAK23]` |
| `\cite[p.~4690]{Sleiman2021UnifiedMPC}` | `[SLEI21, p. 4690]` |
| `\parencite{...}` | `[SLEI21]` — identical to `\cite` in this style |
| `\textcite{Sleiman2021UnifiedMPC}` | `Sleiman, Farshidian, Minniti, and Hutter [SLEI21]` |
| `\citeauthor{...}` | `Sleiman, Farshidian, Minniti, and Hutter` |
| `\citeyear{...}` | `2021` |
| **`\citep{...}` / `\citet{...}`** | **`Undefined control sequence` — build fails** |

`\citep` is a natbib command. The supervisor suggested it ("there is a latex
option such as \citep for that normally"), but biblatex only defines it when
loaded with `natbib=true`, which this template does not do. Do not use it.

`\textcite` is the biblatex equivalent of `\citet`, but the template sets
`maxnames=10` and removes the et-al marker, so it prints **every** author — four
surnames for a typical RA-L paper, which is unreadable in running text. For
author-in-text citations, write the `et al.` by hand:

```latex
Sleiman et~al.~\cite{Sleiman2021UnifiedMPC} unify locomotion and manipulation.
```

That is the form already used throughout Chapters 1–2.

## Placement

**Position marks scope.** A citation sits at the end of the unit it covers: the
sentence, if it supports one claim; the paragraph, if one source carries the
whole paragraph. What it must never do is sit mid-sentence after a tool's name,
which makes it look as though only that clause is sourced. That is what the
review flagged with "put the citation at the end of the paragraph".

The comment is about scope, not about rationing citations to one per paragraph.
`MA_Hisham_469906.pdf` — a master's thesis supervised by the same person — cites
at the end of nearly every sentence that makes a claim:

> ... in combination with shimming [SABR17]. While fixtures are used to force the
> component into shape, ... when gaps exceed 0.2 mm [GUO25]. Both approaches are
> costly, as fixtures must be ... [ABEN12]. According to [ESPO22], gap ...

Note the third form: `According to [ESPO22], ...` — a citation can be a sentence
element, not only a trailing bracket.

```latex
% wrong
\ocs{} is developed at the Robotic Systems Lab, ETH
Z\"urich~\cite{ocs2Toolbox}. It provides solvers for ...

% right
\ocs{} is developed at the Robotic Systems Lab, ETH Z\"urich. It provides
solvers for continuous-time optimal-control problems ...~\cite{ocs2Toolbox}.
```

## Calibration against a thesis from the same supervisor

`MA_Hisham_469906.pdf` (M.Sc., WZL, supervised by Guillaume Tréheux, Dec 2025) is
the closest available reference for what he expects. Measured:

| | That thesis | This thesis (current) |
|---|---|---|
| Label style | `[ABEN12]`, `[CLAU21]` — 4 letters + 2 digits | identical |
| Citations | 344 in 122 pages (~2.8 per page) | 71 in Ch. 1–2 alone |
| Distinct sources | 81 | 57 |
| Placement | end of nearly every claim sentence | same |
| Standards | `[ISO10]`, `[ISO97]`, `[ISO11]` | `[ISO 9283]` via `shorthand` |
| Disambiguation | `[OPEN25a]` / `[OPEN25b]` | biblatex does this automatically |

Two things this confirms:

- The 4-letter label is the house style across toolchains, not a LaTeX artefact.
  That thesis was written in Word with Citavi and produces the same labels.
- Corporate authors get a readable shorthand rather than the mechanical
  truncation. `[ISO10]`, not `[INTE10]`. The `shorthand` field added to
  `sources-manual.bib` reproduces this.

One thing **not** to copy from it: a substantial share of its references are
vendor pages and blog posts (`3dscanners.co.uk`, `bitfab.io/blog`,
`stressebook.com`). Our supervisor's email asks for sources for every non-obvious
statement *and* for primary literature rather than summaries; a blog post
satisfies neither. Match that thesis on citation density and placement, not on
source quality.

**Bibliography entry format differs and that is expected.** That thesis prints
German-style entries (`In: Journal, 63. Jg., 2012, Nr. 5-8, S. 741--752`, no DOI)
because Word + Citavi renders the WZL Citavi style. Our LaTeX template renders
the WZL biblatex style, which prints DOIs. Both are correct for their toolchain;
do not hand-format entries to imitate the Word output.

## The supervisor's own paper

Bergs, Tréheux, Schäper, Pinheiro de Souza, Münker, Göppert and Schmitt,
"Edge Computing Framework for Enhanced Robotic Adaptivity in Line-Less Mobile
Assembly Systems", *Procedia CIRP* 127 (2024), pp. 26--31,
`doi:10.1016/j.procir.2024.07.006` — the ScienceDirect link he sent
(PII `S2212827124003159`) resolves to this. It is in `References.bib` as
`Bergs2024EdgeComputing`.

Procedia CIRP uses Elsevier's numbered style (`[1]`, `[2]`), so its *format*
transfers nothing to this thesis. Its relevance is as content: it is LMAS work
from this group, and its subject — moving robot computation off the platform to
keep the robot adaptive — is the same argument as the distributed host/on-board
split in \cref{ch:integration}.

## Zotero specifics

Zotero is the one the supervisor listed first and the one used most at RWTH.

- Install **Better BibTeX** (retorquere.github.io/zotero-better-bibtex) — it
  produces stable `AuthorYearShortTitle` keys instead of Zotero's own random ones.
- Add papers by DOI: *Add Item by Identifier* (the magic-wand button), paste the
  DOI. Do not import Scholar's `.bib` directly.
- Export to `thesis-wzl/lit/References.bib` via *Export Collection → Better
  BibTeX → Keep updated*, so the file refreshes on every Zotero change.
- **Before enabling that auto-export**, import the current `References.bib` into
  Zotero first, otherwise the first export wipes the 42 verified entries already
  there.
- Zotero still gets metadata wrong. Step 2 above applies to Zotero output too.

Citavi (RWTH has a campus licence) and JabRef work the same way; JabRef edits the
`.bib` file directly, which suits this repo better if you would rather not run a
second database.
