# Style Guide: Removing AI Flavor from Academic English

The goal is not "human-sounding" in a literary sense. It is the register of a competent engineering thesis: plain, specific, evidence-bound, occasionally awkward in harmless ways, never decorative. AI flavor lives at three levels — word choice, sentence rhythm, and paragraph architecture. Fix all three; word substitution alone is not enough.

## Level 1: Word choice

### Banned words and phrases

Never use these in thesis prose (fine inside quoted material or established technical terms):

delve, leverage (as a verb), harness, showcase, underscore, foster, bolster, spearhead, seamless(ly), holistic, pivotal, crucial (use "important" or, better, say *why*), paramount, myriad, plethora, tapestry, landscape (metaphorical), realm, journey, roadmap (metaphorical), game-changer, cutting-edge, state-of-the-art (allowed only as the literal technical term SOTA in related work, sparingly), robust (allowed only in its control-theoretic meaning), elegant, powerful (for software), excel (verb), wonderful, great, impressive, rich (for data/features), vital role, plays a key role, it is worth noting that, it should be noted that, notably (sentence-initial), importantly (sentence-initial), interestingly, needless to say, in today's world, in recent years (unless followed by actual years and citations), ever-evolving, rapidly growing, paradigm shift, unlock, empower, elevate, streamline, comprehensive (as praise), meticulously, intricate, nuanced.

### Connective inflation

AI text chains formal connectives: *Furthermore… Moreover… Additionally… Consequently…* one per sentence. In real theses, most sentences connect through content, not connectives.

- Budget: at most one of {furthermore, moreover, additionally} per page. Prefer "also", "and", or nothing.
- "However" is fine but not more than once per paragraph.
- Never open three consecutive sentences with connectives.

### Hedging and confidence

- Replace absolute claims with bounded ones: not "this guarantees real-time performance" but "with the Release build, the solve time remained below the replanning interval in all recorded runs".
- Ban confidence markers that carry no evidence: clearly, obviously, evidently, undoubtedly, of course.
- Correct hedges are quantitative or conditional: "in the tested velocity range", "for the rectangular path used here", "assuming synchronized clocks (Sec. X)".

### Rules carried over from the supervisor's review

These were marked individually in `mini-thesis-v1.pdf`; full context in
`supervisor-requirements.md` §4.

- **No subjective evaluation.** "excel", "wonderful", "great" — the comment was
  "subjective, never use words like this in a thesis". Describe the property
  instead.
- **No absolute statements.** "never make absolute statements in a thesis, always
  use comparisons, as everything is relative". "They are cheap and fast" → drew
  "Compared to what". Name the baseline.
- **No impersonal "one".** "one speaks of" / "one calls" → "is an absolute
  no-go". Give the sentence a real subject.
- **Terms are explained, not used as verdicts.** "myopic" → drew "meaning?".
- **Pronouns are re-nouned across sentence boundaries.** "They can amortise the
  online cost" → drew "what is they in the sentence, reuse learning based
  schemes, even if it redundant". Redundancy beats ambiguity here.
- **Present tense for anything that still exists**, including other chapters:
  "The previous chapter argued" → drew "always write in present tense, the
  chapter still exists".
- **Never call your own process "systematic"** unless a documented protocol was
  run — it "implies that you used an actual systematic methodology".

## Level 2: Sentence rhythm

AI prose has suspiciously uniform sentences: 20–30 words, one subordinate clause, balanced halves. Human technical prose is lumpier.

- Vary length deliberately. After two long sentences, write a short one. "The build was switched to Release. Solve time dropped below the replanning interval." is better than folding both into one balanced sentence.
- Kill decorative triads. "improves accuracy, reduces latency, and enhances reliability" — the rule-of-three used as rhythm, not content, is the single strongest AI tell. Lists of three are fine only when there are actually exactly three things and each is load-bearing.
- Avoid "not only X but also Y" entirely.
- Em-dashes: at most one per page. AI overuses them as universal glue; theses use commas, parentheses, or separate sentences.
- Passive voice is acceptable and conventional in methods text ("the trajectory was recorded at 100 Hz"), but alternate with active voice where an agent matters ("the MRT bridge clamps the commanded velocity").
- Don't front-load every sentence with a participial clause ("Leveraging the kinematic model, the controller…"). One per paragraph at most, and never with a banned verb.

## Level 3: Paragraph architecture

This is where "polished" AI text still gets caught.

- **No sandwich paragraphs.** AI paragraphs open with a general topic sentence, list 2–3 supports, and close with a mini-summary restating the opening. Delete the closing restatement; usually delete or sharpen the opener too. A paragraph may simply end on its last piece of evidence.
- **No symmetric section skeletons.** If every subsection has the shape "definition → advantages → limitations → transition", restructure at least some of them. Real chapters are shaped by the material, not by a template.
- **Transitions through content, not meta-commentary.** Not "Having discussed the kinematic model, we now turn to the cost function." but a sentence that makes the cost function *need* the kinematic model: "The cost terms below are evaluated on the state of this kinematic model."
- **One idea can take one sentence.** AI pads every point into a full paragraph. If the fact is "the MRT runs at 100 Hz", it does not need three sentences of context.
- **Bold-term-plus-colon lists** ("**Scalability:** the system…") belong in slides, not thesis prose. Convert to sentences or a plain itemize with full-sentence items.

## Non-native-friendly constructions to prefer

The user drafts from Chinese notes. These patterns translate cleanly and read as normal engineering English:

- Subject–verb–object with the technical noun as subject: "The DDP backward pass operates on 9-dimensional matrices" rather than "It is the DDP backward pass that…".
- Define, then use: introduce a symbol or term in one sentence, use it plainly afterwards. Don't re-explain.
- Numbers do argumentative work: "solve time exceeded the replanning window by a factor of five" persuades more than any adverb — but the numbers themselves must come from the repository or measurement logs at draft time, never from this guide.

## Rewrite examples (calibrated to this project)

**Before (AI-flavored):**
> Furthermore, it is worth noting that the transition to a Release build played a pivotal role in enhancing the overall performance of the MPC pipeline, seamlessly reducing solve times and unlocking robust real-time capabilities that are crucial for deployment on real hardware.

**After:**
> Rebuilding the core OCS2 packages with `-DCMAKE_BUILD_TYPE=Release` reduced the MPC solve time from \todo{value} to below the replanning interval. Policy exhaustion at the MRT, previously deterministic at this solve time, no longer occurred in subsequent runs.

**Before:**
> The whole-body approach offers several key advantages: it improves trajectory smoothness, enhances obstacle avoidance, and enables seamless coordination between the base and the arm.

**After:**
> Treating base and arm as a single kinematic chain lets the solver trade base motion against arm motion within one cost function. In the decoupled baseline, this trade-off is fixed a priori by the navigation goal, which produced the detour behaviour discussed in Section X.

**Before:**
> In today's rapidly evolving landscape of industrial automation, mobile manipulators are playing an increasingly crucial role.

**After:**
> Mobile manipulators combine a mobile base with a serial arm and are increasingly used in production tasks that fixed-base robots cannot reach [cite]. *(Or: delete the sentence — most chapters do not need a global motivation opener.)*

**Before (empty sandwich paragraph):**
> Clock synchronization is a critical aspect of distributed robotic systems. Without proper synchronization, timestamps become unreliable, leading to degraded control performance. Chrony was used to synchronize the machines. In summary, clock synchronization ensures reliable operation of the distributed architecture.

**After:**
> The `observationAge` check in the MRT bridge is the only point where wall-clock times from different machines are compared; the MPC–MRT interface itself operates on a shared abstract time axis and is unaffected by clock skew. Chrony was therefore configured with the host as a local reference server and the IPC as its exclusive client, reducing the measured offset from \todo{before} to \todo{after}.

## Final checklist per draft

1. Search the draft for every banned word — zero hits.
2. Count {furthermore, moreover, additionally} — ≤ 1 per page.
3. Scan for triads — each surviving list of three is genuinely three things.
4. Read only the first and last sentence of each paragraph — no restatement pairs.
5. Every number traceable to a config file, measurement, or citation at draft time; none copied from this skill; otherwise TODO-flagged.
6. Read one paragraph aloud (mentally): if the rhythm is metronomic, break one sentence.
7. Every non-obvious statement has a source, at the end of its sentence or paragraph — and no fact is sourced to a literature review that only summarises it.
8. Every comparative claim names its baseline; every suitability claim points at a requirement ID.
