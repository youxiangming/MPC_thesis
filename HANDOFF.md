# Project Handoff
> Last updated: 2026-09-10 15:50 by Claude Code (Opus 5) · session start 13:12

## 1. Goal (stable)

LaTeX thesis "Integration and Validation of Whole-Body Model Predictive Control
for a Mobile Manipulator in Line-less Assembly" (WZL-IQS, RWTH Aachen; supervisor
Guillaume Tréheux, M.Sc.). Root `thesis-wzl/main.tex`, built with the bundled
Tectonic in `.tools/`. Chapters 3–6 were already drafted; this session's work was
Chapters 1–2 plus the citation system.

## 2. Current Objective

Process the supervisor's annotated review of `mini-thesis-v1.pdf` (52 PDF
comments + a covering email) and turn its requirements into standing project
rules. **Complete.** One structural decision is deliberately left open (§6).

## 3. State: Done ✅

### Thesis text
- **`thesis-wzl/01_chapters/01_introduction.tex`** — rewritten. Added FMS/RMS
  paragraph, Grübler mobility derivation (`eq:grubler`, `eq:redundancy`), the
  R1–R7 requirements table (`tab:requirements`), two TikZ figures, and sources
  throughout. `\paragraph{Objective.}` etc. promoted to `\subsection`.
  Citations 7 → **33**.
- **`thesis-wzl/01_chapters/02_state_of_the_art.tex`** — rewritten. Three TikZ
  figures, primary sources replacing the internal review, `\cref{tab:requirements}`
  referenced 9×, table 2.1 re-scored per R1–R7 with a stated basis.
  Citations 13 → **38**.
- **`thesis-wzl/main.tex`** — supervisor name debracketed; `\addbibresource{lit/sources-manual.bib}` added.
  *(Author/matriculation brackets were removed by the user in parallel.)*

### Bibliography
- **`thesis-wzl/lit/References.bib`** — all entries re-verified against Crossref,
  then split. Now 43 published entries, zero `% VERIFY` markers.
- **`thesis-wzl/lit/sources-manual.bib`** — NEW, 13 entries a reference manager
  cannot reproduce (repos, vendor docs, standards, manuals). Hand-maintained only.

### Rules (read these before writing anything)
- **`CLAUDE.md`** — NEW. Precedence: template → supervisor → project convention.
- **`.cursor/skills/thesis-writing/references/supervisor-requirements.md`** — NEW,
  the 52 comments distilled into 6 sections of binding rules, each with the
  sentence that triggered it.
- **`.cursor/skills/thesis-writing/references/citation-workflow.md`** — NEW.
  How to add a citation here; verified command table; calibration against
  `MA_Hisham_469906.pdf`.
- Updated: `thesis-writing/SKILL.md`, `references/style-guide.md`,
  `related-literature-search/SKILL.md`, `references/seed_corpus.md`.

### Review trail
- **`thesis-wzl/zh/CHANGELOG_2026-09-10.md`** — every change with 时间 / 内容 /
  原因 / 出处, traceable to a comment number, an email point or a user instruction.
- **`thesis-wzl/zh/SUPERVISOR_COMMENTS_v1.md`** — all 52 comments extracted from
  the PDF annotation objects, with the highlighted source text.
- **`thesis-wzl/zh/SUPERVISOR_COMMENTS_RESOLVED.md`** — per-comment resolution.

**Build:** `tectonic` exit 0, no undefined references/citations, **57 pages**
(was 48), List of Figures 0 → **12** entries.

## 4. State: In Progress 🚧

Nothing half-finished. All edits compile.

**Uncommitted:** everything. `git status` shows 12 modified + `.cursor/`,
`CLAUDE.md`, `HANDOFF.md`, `thesis-wzl/lit/sources-manual.bib`, `thesis-wzl/zh/`
untracked. Nothing has been committed this session.

⚠️ `thesis-wzl/01_chapters/0{3,4,5,6}_*.tex`, `Usercustomised_Content/*.tex` and
`thesis-wzl/zh/0*.md` show as modified but were **not** touched this session —
they were already dirty at session start.

> Restore this context in any tool: read `HANDOFF.md`, then `CLAUDE.md`, then the
> newest `thesis-wzl/zh/CHANGELOG_*.md`. The `session-handoff` skill
> (`.cursor/skills/session-handoff/` for Cursor, `~/.claude/skills/` for Claude
> Code) automates both saving and resuming.

## 5. Next Steps (ordered)

1. **Commit.** Nothing is in git yet. Suggested split: (a) rules + handoff,
   (b) bibliography rebuild + split, (c) Ch1/Ch2 rewrite.
2. **Decide: cite `Bergs2024EdgeComputing`?** The supervisor's own Procedia CIRP
   paper (`doi:10.1016/j.procir.2024.07.006`). Entry exists, cited 0×. Natural
   spots: §1.1 (LMAS) and §3.2 (distributed architecture — the paper argues for
   moving robot computation to the edge, the same argument as our host/on-board
   split). Also uncited: `Macenski2022ROS2`, `Treheux2026TopicWBMP`.
3. **Write the English abstract** — `format/en/frontmatter.tex` has only
   toc/lof/lot. Blocking for submission.
4. **Rebuild the acronym list** — `Usercustomised_Content/acronyms.tex` still
   holds the template's ~140 stock entries (AAS/FAIR/NFDI…), unrelated to this
   work, and the list is commented out.
5. **Apply the same sourcing pass to Ch3–6.** They have not been reviewed against
   `supervisor-requirements.md`; Ch1–2 are now much denser than they are.

## 6. Key Decisions & Constraints

- **Decision:** BibTeX keys stay `AuthorYearShortTitle`. | **Reason:** it is
  Better BibTeX's default, so Zotero auto-export produces exactly these keys; the
  supervisor's own example style (`treheux26`) collides here — Farshidian has two
  2017 entries. | **Do NOT revisit unless** he explicitly asks for his convention
  (then it is a 56-key rename plus every `\cite`).
- **Decision:** the KALIMORO internal review is **not citable at all** — no
  `\cite`, no bib entry, no mention. | **Reason:** user instruction 2026-09-10;
  it is an unpublished colleague's document. Its BibTeX entry was deleted so it
  cannot be cited by accident. Use it only to locate papers, then cite those.
- **Decision:** two `.bib` files split by "can a reference manager own this". |
  **Reason:** an automated Zotero export would silently delete repos, manuals and
  standards. **Never point an exporter at `sources-manual.bib`.**
- **Decision:** keep the bibliography's English biblatex entry format (with DOIs).
  | **Reason:** `MA_Hisham_469906.pdf` prints German `Jg./Nr./S.` entries because
  it is Word+Citavi. Both are "WZL style" in their own toolchain; do not
  hand-format to imitate the Word output.
- **Constraint:** citation *position marks scope* — end of the sentence if it
  sources one claim, end of the paragraph if one source carries the paragraph.
  Never mid-sentence after a tool's name. Verified against Hisham's thesis, which
  cites at the end of nearly every claim sentence (344 cites / 122 pages).
- **Constraint:** the WZL template owns the citation format
  (`format/WZLTemplate_files/SET_Bibliography.tex`). Do not override; use the
  `shorthand` field, which its label template checks first.

## 7. Gotchas / Failed Attempts

- **`\citep` / `\citet` do not exist here.** The supervisor recommended `\citep`,
  but the template does not pass `natbib=true` to biblatex → `Undefined control
  sequence`, build fails. Use `\cite`; for author-in-text write
  `Sleiman et~al.~\cite{...}` by hand (`\textcite` prints all four authors,
  because the template sets `maxnames=10` and clears the et-al marker).
- **`biber` is not on PATH.** `tectonic` alone fails with
  `error: No such file or directory (os error 2)`. Must prepend `.tools/`.
- **Three of twelve unverified bib entries were wrong.** Sandakalum 2022 is
  *Machines* 10(2):97, not Applied Sciences 12(21); Buckhorst 2022's real title is
  *Decentralized Holonic Control System Model for LMAS*; `Kern2019LMAS` does not
  exist (replaced by Kern et al. 2016, Procedia CIRP 57:327–332). Never trust a
  remembered citation — check Crossref.
- **Crossref's own spelling can be inconsistent.** Hüttemann appears as
  "Huettemann" in the 2016 record and "Hüttemann" in the 2019 one, which printed
  as `[HUET16]` and `[HÜTT19]` — same person, two labels. Normalised by hand; a
  comment in `References.bib` records the deliberate deviation.
- **TikZ overflows labels silently.** The Venn diagram (fig 2.1) initially had
  labels crossing circle boundaries — a *content* error, since a label in the
  wrong region asserts the wrong classification. Always render and look.
- **ScienceDirect is unreachable** (Cloudflare 403), and RWTH's OA record page
  returns a 248-byte stub. The supervisor's paper could not be read, only its
  metadata resolved via Crossref (PII `S2212827124003159` → the DOI above).
- **`pip install` is blocked** (PEP 668) and `venv` has no `ensurepip`. PDF
  annotations were extracted by parsing the file's object streams with `zlib`
  directly — see the approach in the session, not a library.

## 8. Environment & Commands

```bash
# Build (biber MUST be on PATH via .tools/)
cd /home/xy/HERO-thesis/thesis-wzl && \
  PATH="/home/xy/HERO-thesis/.tools:$PATH" \
  /home/xy/HERO-thesis/.tools/tectonic -X compile main.tex \
  --outdir . --keep-intermediates --synctex

# Health checks after any edit
grep -ic undefined main.log        # must be 0
grep -c '\entry{' main.bbl         # cited entries, currently 53
pdfinfo main.pdf | grep Pages      # currently 57

# Look at a figure you just added (TikZ overflows silently)
pdftoppm -f <page> -l <page> -r 110 -png main.pdf /tmp/out

# Verify a citation against the publisher before adding it
curl -s "https://api.crossref.org/works/<DOI>" \
  | python3 -c "import json,sys; m=json.load(sys.stdin)['message']; \
print(m['title'][0]); print(m['container-title'][0], m.get('volume'), m.get('page')); \
print([a['family'] for a in m['author']])"
```

## 9. Relevant Files Map

| Path | Role |
|---|---|
| `CLAUDE.md` | Precedence rules + pointers. Read first. |
| `.cursor/skills/thesis-writing/references/supervisor-requirements.md` | Binding marking criteria from the review |
| `.cursor/skills/thesis-writing/references/citation-workflow.md` | How to add a citation here |
| `.cursor/skills/thesis-writing/references/style-guide.md` | De-AI prose rules |
| `.cursor/skills/related-literature-search/SKILL.md` | Finding + verifying literature |
| `thesis-wzl/lit/References.bib` | 43 published, Crossref-verified |
| `thesis-wzl/lit/sources-manual.bib` | 13 hand-maintained; never auto-export |
| `thesis-wzl/format/WZLTemplate_files/SET_Bibliography.tex` | Chair-level citation format (do not edit) |
| `thesis-wzl/zh/CHANGELOG_2026-09-10.md` | Dated change table with provenance |
| `thesis-wzl/zh/SUPERVISOR_COMMENTS_v1.md` | The 52 comments, extracted |
| `thesis-wzl/zh/SUPERVISOR_COMMENTS_RESOLVED.md` | Per-comment resolution |
| `thesis-wzl/zh/REVIEW_2026-08-20.md` | Earlier internal full-draft review |
| `mini-thesis-v1.pdf` | The annotated PDF from the supervisor |
| `MA_Hisham_469906.pdf` | M.Sc. by the same supervisor — citation calibration |

## 10. Session Log (append-only, newest first)

- 2026-09-10 [Claude Code]: Extracted 52 supervisor annotations from the PDF;
  rewrote Ch1–2 (sources 20 → 71, five new TikZ figures); rebuilt the
  bibliography against Crossref and split it in two; added `shorthand` labels for
  corporate authors; removed the colleague's internal review entirely; wrote
  `CLAUDE.md`, `supervisor-requirements.md`, `citation-workflow.md` and wired
  them into both skills. Build 48 → 57 pages, 0 undefined.
