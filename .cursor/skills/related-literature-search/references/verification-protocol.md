# Differentiation Claim Verification Protocol

A structured mini-review whose goal is **not** to find related work but to exhaustively hunt for a counterexample that would falsify a novelty claim. Run it twice: once while experiments are still adjustable, once again shortly before submission (to catch new preprints).

Division of labour: steps 2, 4, and 5 require databases and citation-graph tools that Claude cannot reach (Scopus, Web of Science, IEEE Xplore, Google Scholar, Connected Papers, Semantic Scholar are not accessible — the sandbox network allows only package registries and GitHub). Claude builds the strings, screens what the user pastes back, and writes the archive record. Say this split explicitly at the start so the user knows which steps are theirs.

---

## Step 1 — Decompose the claim (Claude)

Split the claim into orthogonal components. A counterexample must satisfy **all** the necessary ones; treat weakly-reported attributes as screening bonuses rather than search terms, because papers often use them without mentioning them in the abstract.

Worked example (current thesis claim):
- A = whole-body vs. decoupled pipeline comparison on physical hardware — necessary
- B = Hausdorff / MHD / path-similarity metric — necessary
- C = external motion-capture ground truth — screening bonus, NOT a search term

Search design = cartesian product of A's and B's vocabularies. State the decomposition to the user before generating strings; a wrong decomposition invalidates everything downstream.

## Step 2 — Structured database search (user runs; Claude writes the strings)

Produce one string per database, using each database's own syntax. Scopus template:

```
TITLE-ABS-KEY ( ( "mobile manipulat*" OR "whole-body" OR "whole body" )
  AND ( "Hausdorff" OR "Frechet" OR "Fréchet" OR "path similarity"
        OR "trajectory similarity" )
  AND ( experiment* OR hardware OR "real robot" OR evaluat* ) )
```

Rules:
- Target a hit count small enough to read every abstract (tens, not hundreds). If a string returns zero, that is a red flag for over-narrow vocabulary, not a result — broaden the first group (e.g. `robot*`) and re-run to confirm the pipeline works.
- Run in **three** databases: Scopus, Web of Science, IEEE Xplore. IEEE Xplore matters most for RA-L/ICRA/IROS coverage; the three have different indexing so agreement across them is the actual evidence.
- The user already has a bibliometrix/biblioshiny R environment from the SLR — reuse it for Scopus exports rather than screening in the browser.

## Step 3 — Full-text search to cover the abstract blind spot (user runs)

Database search only covers title/abstract/keywords. The most likely counterexample is a paper that used the metric in its results section without mentioning it in the abstract. Google Scholar searches full text:

```
"Hausdorff distance" "mobile manipulator" "whole-body"
```

Quoted multi-term combinations, 3–5 pages deep (Scholar's relevance decays fast).

## Step 4 — Forward citation check (user runs; highest yield)

Anyone who did this experiment almost certainly cites the same anchors. For each anchor paper, open its Scholar "Cited by" list and use **search within citing articles** — never scroll manually, some anchors have thousands of citations.

Anchor selection: 2–4 papers, mixing the domain anchors and the method anchor. Current set: Pankert & Hutter 2020, Sleiman et al. 2021, Dubuisson & Jain 1994.

## Step 5 — Citation-graph cross-check (user runs)

Connected Papers or Semantic Scholar "related papers" on the closest prior work (currently Pankert & Hutter 2020). These use co-citation and bibliographic coupling, so they surface topically adjacent work with no direct citation link — exactly the class that keyword search and backward snowballing both miss. Ten minutes; treat as a safety net, not a primary method.

## Step 6 — Screen and adjudicate (Claude)

For every candidate the user pastes back, record: reference, which components (A/B/C) it satisfies, and the exclusion reason if it fails. Only a paper satisfying all necessary components is a counterexample.

If a counterexample exists, do not soften the finding. Report it plainly and offer the options: narrow the claim (add a differentiating component), reposition it, or drop it. Discovering this before the experiments are finished is the entire point of running the protocol early.

## Step 7 — Archive (Claude)

Write a record containing: date, every string, per-database hit counts, anchors used in step 4, candidates screened with exclusion reasons, and the resulting claim wording. Destination: an Obsidian problem card with `thesis-relevance` frontmatter pointing at the chapter that carries the claim, plus a copy in the thesis repo so the appendix can cite it.

## Step 8 — Set the claim wording (Claude)

Two tiers — never overstate which one the evidence supports:

- Protocol not run, or run partially → `to the best of our knowledge, no prior work ...`
- Full protocol run and archived → `a structured search across Scopus, Web of Science, and IEEE Xplore (see Appendix X) returned no prior work that ...`

The second is much stronger because it is a checkable statement rather than a disclaimer, but it is only honest with the archive record in place. Never write "no one has done this" in either case.
