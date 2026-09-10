---
name: session-handoff
description: "Save or restore project progress across AI coding tools (Cursor ↔ Claude Code ↔ Claude.ai) using HANDOFF.md in the project root. Use when the user says 保存进度, 写交接文档, 交接, handoff, save progress, 额度快用完了, quota is running out, 我要切换到 Cursor/Claude Code, 继续上次的进度, resume where we left off, 读取交接文档, continue the project — or at the START of a session when HANDOFF.md exists. Also suggest it proactively when a long session hits a natural milestone."
---

# Session Handoff — HERo Thesis

Single source of truth: **`HANDOFF.md`** in the repo root. Any tool reads it and
reconstructs the working context. Two operations.

## Operation 1: SAVE

1. **Read `HANDOFF.md` first.** You are updating it, not overwriting. Move
   finished items from *In Progress* to *Done*; append one line to the Session Log.
2. Fill every section. Be reproducible, not descriptive:
   - exact paths and label/macro names, never "the config file"
   - exact values, verbatim error messages in code blocks, verbatim commands
   - the *reasoning*: "chose X because Y failed with Z"
3. **Write a dated change table** in `thesis-wzl/zh/CHANGELOG_<YYYY-MM-DD>.md`
   with four columns: 时间 / 修改内容 / 原因 / 出处. "出处" must name the
   supervisor comment number, the email point, the review file section, or the
   user instruction that caused the change. `HANDOFF.md` stays a summary and
   links to the changelog; detail lives in the changelog.
4. Keep `HANDOFF.md` under ~200 lines. Collapse old Session Log entries to one
   line each.
5. **Do not claim work you did not do.** Check `git status` mtimes against what
   the session actually touched — this repo often has files dirty from a previous
   Cursor session. List those separately as "not touched this session".
6. Verify the build before saving, and record the numbers:
   ```bash
   cd /home/xy/HERO-thesis/thesis-wzl && \
     PATH="/home/xy/HERO-thesis/.tools:$PATH" \
     /home/xy/HERO-thesis/.tools/tectonic -X compile main.tex --outdir . --keep-intermediates
   grep -ic undefined main.log; grep -c '\entry{' main.bbl; pdfinfo main.pdf | grep Pages
   ```
7. Offer to commit `HANDOFF.md` and the changelog.

## Operation 2: RESUME

1. Read `HANDOFF.md` in full, then `CLAUDE.md` (precedence rules), then the newest
   `thesis-wzl/zh/CHANGELOG_*.md`.
2. Verify against reality: `git log -3 --oneline` and `git status`. If they
   disagree with *In Progress*, **trust git and the filesystem**, and say so.
3. Read only the files the current objective needs, from *Relevant Files Map*.
4. Before writing any thesis text, read
   `.cursor/skills/thesis-writing/references/supervisor-requirements.md` — those
   are marking criteria, and §6 of HANDOFF.md records decisions already settled.
5. Summarise in 3–5 lines: "Picking up from … Next step is … Shall I proceed?"
6. **Do not re-ask** anything answered in *Key Decisions & Constraints*.

## Hygiene

- `HANDOFF.md` and the changelogs are committed — they are shared state.
- No secrets, no tokens.
- One `HANDOFF.md` per repo; use subsections under *Current Objective* for
  parallel tracks rather than extra files.
- When a milestone closes, prune Done items into a single Session Log line.
