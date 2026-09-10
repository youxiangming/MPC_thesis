---
name: related-literature-search
description: Find, screen, and cite literature related to Xiangming's thesis (whole-body MPC on the Hero mobile manipulator, WZL RWTH) and the WBMP seminar paper, extending the existing systematic review corpus — and verify novelty/differentiation claims against it. Use this skill whenever the user asks to search for related papers, similar work, citations, or references — including phrases like "搜索相关文献", "找类似的论文", "查引用", "find related papers", "literature search", "补充参考文献", "update refs.bib", "check if this is cited", "snowball from this paper", or when they paste a paper/report and ask what else should be cited. Also use it for novelty verification — "验证创新点", "有没有人做过", "确认这个是不是新的", "check if this is novel", "has anyone done this", "verify my contribution claim", "to the best of our knowledge 能不能这么写" — and when writing any thesis chapter that needs new citations, or when verifying DOI/BibTeX entries.
---

# Related Literature Search & Citation

Purpose: extend the thesis reference base beyond the existing systematic literature review (SLR) corpus in a way that is verifiable, screened by the same criteria, mapped to thesis chapters, and directly importable into Zotero/`refs.bib`.

## Two modes — pick one before doing anything

- **Accumulation mode** (default): find literature that supports a chapter or claim. Follow the Workflow below.
- **Verification mode**: test whether a novelty/differentiation claim survives — the goal is to hunt for a counterexample, not to gather support. Triggered by "验证创新点", "有没有人做过", "is this novel", "can I write to the best of our knowledge", or before finalizing a contributions paragraph. **Read `references/verification-protocol.md` and follow it instead of the Workflow below.** Do not answer a novelty question from a few web searches — that is exactly the failure the protocol exists to prevent.

## Ground truth inputs (read before searching)

- `references/seed_corpus.md` (bundled) — the SLR inclusion/exclusion criteria, validated search vocabulary, the 29-paper corpus summary, and the core citation lineage. Read this first; do NOT re-derive it from the PDFs.
- If in the Claude.ai thesis project: `report_KALIMORO_wbmpsearch.pdf` and `wbmp_complete.xlsx` are the authoritative corpus (only consult for details missing from seed_corpus.md).
- If in the repo/workspace: the user's `refs.bib` — check it first so you never propose duplicates.

## Workflow

1. **Anchor the query.** Determine which thesis chapter or claim needs support (Ch.2 SotA, Ch.3 framework, Ch.4/5 experiments, future work). The chapter determines the tier (see Output format) and the search vocabulary.

2. **Search strategy — in this order:**
   a. *Genealogy first*: for anything OCS2/ETH-related, walk the two-generation lineage in seed_corpus.md before searching — most Ch.2/3 citations come from it.
   b. *Backward snowballing to depth 2 (DEFAULT, not optional)*: for every core or newly-added paper, harvest its own reference list (arXiv HTML pages and the OCS2 docs bibliography expose full lists) and screen those references too. Solver/software foundations (SLQ, DDP, Pinocchio, Crocoddyl, acados) live at depth 2, never at depth 1. Go to depth 3 only on explicit request.
   c. *Web search* with short queries (3–6 words) built from the validated vocabulary in seed_corpus.md plus the specific concept (e.g. "whole-body MPC nonholonomic hardware", "Hausdorff distance trajectory evaluation"). One search per concept.
   d. *Forward snowballing*: search "<key paper title> cited by <topic>" style queries for papers building on the core lineage.

3. **Screen every candidate** against the SLR criteria in seed_corpus.md — but note the thesis needs papers the SLR *excluded* by design (EC 3 excluded control-layer-only work; the thesis Ch.2/3 needs exactly those). Record for each paper: **[SLR]** (already in corpus) or **[NEW]**, and which IC/EC applies.

4. **Verify before citing.** For each [NEW] paper: confirm title/authors/venue/DOI from an authoritative page (publisher, arXiv abstract page, or the paper's own GitHub). Rules:
   - NEVER fabricate or guess a DOI, page range, or author list.
   - **Crossref is the authority.** When the network is reachable, check the DOI directly; the publisher's own metadata beats any secondary source, and Google Scholar's BibTeX is not acceptable as-is:
     ```bash
     curl -s "https://api.crossref.org/works/<DOI>" \
       | python3 -c "import json,sys; m=json.load(sys.stdin)['message']; \
     print(m['title'][0]); print(m['container-title'][0], m.get('volume'), m.get('page')); \
     print([a['family'] for a in m['author']])"
     ```
     The 2026-09 pass over `References.bib` found 3 wrong entries out of 12 unverified ones — one journal name entirely incorrect, one paper that does not exist.
   - Anything unconfirmed gets `TODO-verify` in the BibTeX `note`/`author` field — same convention as the existing three TODO entries in refs.bib. No `TODO-verify`/`% VERIFY` entry may appear in a build that goes to the supervisor.
   - Unfamiliar 2025+ papers must be searched, never cited from memory.

5. **Produce two artifacts:**
   - A tiered markdown digest (see Output format).
   - A `.bib` fragment with Better BibTeX-style keys (`AuthorYearShortTitle`, e.g. `Pankert2020PerceptiveMPC`), ready for Zotero import.

6. **Close with a gap analysis**: what the new papers add that the SLR corpus misses, and whether the thesis differentiation claim (hardware-validated whole-body MPC on a nonholonomic diff-drive base + UR10e, evaluated by Hausdorff/MHD path similarity against motion-capture ground truth, vs. a decoupled baseline) still holds against the new findings. A gap analysis is a provisional signal only — never phrase its result as verified novelty. If the user wants the claim to actually hold up, switch to verification mode.

## Output format

Tiered digest, one line of *why it matters for this thesis* per paper — never just a title list:

- **Tier 1** Core OCS2/ETH lineage (Ch.2–3, must-cite)
- **Tier 1b** Second-generation snowball — solver/software foundations the core papers themselves cite (Ch.3)
- **Tier 2** Alternative whole-body approaches — QP/reactive, linear MPC, SQP/acados (Ch.2 alternatives)
- **Tier 3** Learning-based / hybrid RL+MPC (Ch.2 outlook, publication direction)
- **Tier 4** Evaluation methodology — Hausdorff/MHD path similarity, trajectory-similarity measures, OptiTrack ground truth (Ch.4–5). ISO 9283 is DEFERRED — only mention as fallback, never as the primary framing, unless the user reverses the decision.
- **Tier 5** Safety/constraints (brief)

Each entry: authors (year) — title, venue, DOI/arXiv, [SLR]/[NEW], one-line relevance. BibTeX in a separate fenced block or file, never inline in prose.

## Hard rules

- **A literature review is never the citation for a fact that originates in a paper it summarises.** This is an explicit supervisor requirement (see `../thesis-writing/references/supervisor-requirements.md` §2): "facts that come from the review are actually not in the review but in the papers which have been summarized there. Use Systematic literature reviews as starting points for your research and move on from there."
  - **The KALIMORO internal report is never cited, for anything.** It is an unpublished colleague's working document: use it to find papers, then cite those papers. It has no BibTeX entry any more, and no sentence in the thesis may name it — not even as the starting point of the search. Digests may reference it internally; the thesis may not.
  - Published surveys (Sandakalum 2022, Thakar 2023) may be cited for a synthesis that is genuinely the survey's own contribution, never for a result belonging to a paper they cover.
  - When a review states a fact you want: that is a search key, not a citation. Follow it to the primary paper, verify it, cite it. Every digest entry sourced from the SLR corpus must therefore resolve to the primary DOI before it reaches `References.bib`.
- Check `refs.bib` / prior digests for duplicates before proposing a paper.
- Quote nothing longer than a phrase from sources; digests are in your own words.
- If a claimed paper cannot be verified to exist, say so explicitly rather than including it.
- Scopus, Web of Science, IEEE Xplore, Google Scholar, Connected Papers and Semantic Scholar are NOT reachable from this environment. Never imply they were searched. Build the strings, name the step as the user's, and screen what they paste back.
- Absence of evidence from web search is weak evidence. Never write "no one has done this"; hedge as "no found paper", and reserve the structured-search wording for a claim whose protocol run is archived.
- When the user gives a Chinese request, respond in the language they used, but keep titles, BibTeX, and technical terms in English.
