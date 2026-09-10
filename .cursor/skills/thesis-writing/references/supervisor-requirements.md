# Supervisor Requirements (Guillaume Tréheux)

Binding rules derived from the annotated review of `mini-thesis-v1.pdf` (52 PDF
comments, 2026-09) and the covering email. These are not stylistic preferences —
they are the criteria the thesis is being marked against. Where a rule below has
a "Failed as" line, that is the actual sentence that drew the comment; treat it
as the negative test case.

Full traceability: `thesis-wzl/zh/SUPERVISOR_COMMENTS_v1.md` (raw comments),
`thesis-wzl/zh/SUPERVISOR_COMMENTS_RESOLVED.md` (per-comment resolution).

---

## 1. Sourcing — the email's first requirement

> "Please ensure to use sources for each statement that is not completely obvious."

**Rule.** Every statement that is not a definition the reader already shares, a
value read from this project's own repository, or a result derived in the text,
carries a citation.

Statement classes that always need one:

- Claims about industry, manufacturing trends, or what is "common practice".
- Claims about what a method, framework, or tool does, cannot do, or is used for.
- Any comparison between approaches (reach, cost, maturity, reactivity).
- Any definition of a technical concept imported from the literature — including
  ones that feel too basic to cite. *Failed as:* the definition of whole-body
  motion planning drew "Wonderful statement, where is it defined? A robotics book
  such as Modern Robotics can be cited here."
- Any formula taken from a textbook (Grübler, manipulability, null-space
  projection), even when the arithmetic is carried out here.

Statement classes that do **not** need one: numbers measured in this project,
configuration values read from the repo at draft time, and conclusions derived
step-by-step from something already cited.

**Placement.** The citation goes at the end of the sentence or paragraph it
supports, not mid-sentence after the tool's name. *Failed as:* `\ocs{} ... ETH
Z\"urich~\cite{ocs2Toolbox}. It provides ...` drew "put the citation at the end
of the paragraph".

**Calibration.** Chapters 1–2 of the current draft run at roughly 30–40 `\cite`
commands per chapter. A related-work chapter materially below that is
under-sourced.

## 2. Primary sources, never the review — the email's third requirement

> "You found interesting literature review, while this is good it is important to
> state that facts that come from the review are actually not in the review but in
> the papers which have been summarized there. Use Systematic literature reviews
> as starting points for your research and move on from there."

**Hard rule.** A literature review is never the citation for a fact that
originates in a paper the review summarises. Find the primary paper and cite it.

**The KALIMORO internal review is not a source at all.** The colleague's
unpublished report (Sant'Anna, *Whole-Body Motion Planning and Control
Integration in Robotic Navigation Stacks*) is a private search aid: it supplies
search strings, screening criteria, and a corpus to walk. It must not appear in
the thesis in any form — no `\cite`, no bibliography entry, no sentence naming
it as the starting point of the search. Its BibTeX entry has been removed so it
cannot be cited by accident.

Whatever it told you, resolve to the paper that told *it*, and cite that.
*Failed as:* "Its lineage also includes foundational work on ..." cited to the
review drew "again cite the direct source, not the review paper"; the catalogue
of integration mechanisms drew "Don't quote the literature review but state
examples in the literature review".

**Published surveys are different.** Sandakalum 2022 and Thakar 2023 may be cited
for a synthesis that is genuinely the survey's own contribution ("the two
published reviews distinguish approaches by how base and arm are coupled"). They
may not be cited for a result belonging to one of the papers they cover.

**Practical consequence.** When a review states a fact you want, the review has
given you a search key, not a citation. Follow it to the paper, verify the paper
(§5), cite the paper.

## 3. Figures — the email's second requirement

> "Use also more figures, it is currently a huge wall of text."

**Rule.** Draw the figure whenever the text is doing one of these jobs:

- explaining a mechanism that unfolds over time (receding horizon, handshake,
  timing),
- introducing a classification or taxonomy (a Venn diagram works well here — the
  supervisor named it explicitly),
- describing an architecture, process split, or data path,
- contrasting two approaches that the argument depends on (decoupled vs.
  whole-body),
- introducing the physical system or a coordinate/DOF convention.

**Density target.** No more than about three pages of continuous prose without a
figure or table. Every chapter contributes entries to the List of Figures; an
empty List of Figures is itself a review finding ("We're missing a lot of
figures", left on the blank LoF page).

**Format.** Diagrams are TikZ in the chapter file, matching the conventions
already in `03_integration.tex` (`box`/`flow`/`lbl` styles). Check every new
figure by rendering the page and looking at it — label overflow outside a shape,
or a label straddling a region boundary in a Venn diagram, is a content error,
not a cosmetic one.

## 4. Language rules from the annotations

**Present tense for anything that still exists.** Chapters, documents, and
published methods are described in the present. *Failed as:* "The previous
chapter argued that ..." drew "always write in present tense, the chapter still
exists." Past tense stays for what was done in this project and what a specific
paper reported.

**Never claim a methodology you did not follow.** Do not describe your own
process as "systematic" unless a documented protocol was executed and can be
shown. *Failed as:* "draws, in part, on a systematic literature review" drew
"beware of using this term. This implies that you used an actual systematic
methodology."

**No subjective evaluation.** Words that praise rather than describe are banned
outright — the supervisor's phrasing was "never use words like this in a thesis".
Includes: excel, wonderful, great, impressive, powerful, elegant. State the
property instead ("effective at finding feasible paths in cluttered spaces, and
probabilistically complete").

**No absolute statements.** "Never make absolute statements in a thesis, always
use comparisons, as everything is relative." Every claim of cost, speed, or
quality is stated against a named baseline. *Failed as:* "They are cheap and
fast" drew "Compared to what". Write "cheaper to solve than an optimisation over
a horizon of the same model".

**Explain the term instead of using it as a verdict.** *Failed as:* "myopic" drew
"meaning?". Replace with what the property actually is: "optimises only the
current instant and therefore cannot trade a worse command now for a feasible one
later".

**No impersonal constructions.** "one speaks of" / "one calls" — the comment was
"is an absolute no-go". Rewrite with the subject doing the work.

**Pronoun clarity beats concision.** Repeat the noun across sentence boundaries.
*Failed as:* "They can amortise the online cost" drew "what is they in the
sentence, reuse learning based schemes, even if it redundant".

**State requirements before judging against them.** Never write that something is
suitable, preferred, or the primary candidate before the criteria exist in the
text as a numbered, referenceable list. *Failed as:* "make it the primary
candidate for the \hero{} platform" drew "You haven't formulated the requirements
thus making this sentence very arbitrary". The thesis now carries R1–R7 in
`\cref{tab:requirements}`; every suitability claim must point at specific
requirement IDs.

**Qualitative score tables need a stated basis.** Say whether a score comes from
published evidence or from a trial run on this platform, and do not let a table
imply measurement where there is none.

**Structural units get real headings.** Where a `\paragraph{}` is carrying a
genuine structural unit, promote it to `\subsection`/`\subsubsection` — "you
could go with a subsubsection".

**No placeholders in a built PDF.** Bracketed template placeholders
(`[Name]`, `[Matriculation No. ...]`) must never survive a compile.

## 5. Citation verification

Every bibliography entry is checked against the publisher's own metadata before
it is cited — Crossref is authoritative, Google Scholar's BibTeX is not.

```bash
curl -s "https://api.crossref.org/works/<DOI>" \
  | python3 -c "import json,sys; m=json.load(sys.stdin)['message']; \
print(m['title'][0]); print(m['container-title'][0], m.get('volume'), m.get('page'), \
m.get('issued',{}).get('date-parts')); print([a['family'] for a in m['author']])"
```

No `% VERIFY`-marked or memory-reconstructed entry may appear in a build that
goes to the supervisor. The 2026-09 pass found three wrong entries out of twelve
unverified ones, including a journal name that was entirely incorrect and one
paper that does not exist.

Entries with no DOI (software, standards, vendor documentation, internal reports,
operating manuals) are maintained by hand and must not be overwritten by an
automated Zotero/Better BibTeX export — keep automated exports in a separate
`.bib` file.

## 6. Open items the supervisor raised that are not yet settled

- **Splitting Chapter 3** ("beefy chapter, might consider splitting"). Structural;
  affects numbering and cross-references throughout. Not to be done without the
  author's decision.
- **`\cite{treheux26}`** appeared in the supervisor's list of citation resources.
  `Treheux2026TopicWBMP` exists in `References.bib` but is cited zero times;
  most likely the supervisor expects the topic description to be cited, plausibly
  in §1.3.1.
