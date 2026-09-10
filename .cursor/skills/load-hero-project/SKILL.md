---
name: load-hero-project
description: >-
  Loads the latest ground-truth content from the HERo ROS2 implementation
  project (/home/xy/hero-ros2) and the debug-notes vault (/home/xy/thinking)
  before writing or editing the thesis, so chapters reflect the real code,
  config, experiment design, results, and recorded robot problems instead of
  guessed values. Use whenever starting to write/edit any thesis chapter
  (integration, simulation, hardware, results), when the user says 开始写 /
  编辑章节 / 读取项目最新内容 / 从项目里读 / update thesis from project /
  thinking 笔记, or before making factual claims about the HERo/OCS2 system.
---

# Load HERo project context (ground-truth for thesis writing)

论文 (`/home/xy/HERO-thesis`) 的正文必须与真机实现项目
(`/home/xy/hero-ros2`) 保持一致，并对照调试笔记库
(`/home/xy/thinking`) 里记录的问题、失败路径和实验意图。
写作/编辑任何章节前，先用本 skill 把两类**事实源**读进上下文，
避免凭记忆编造配置、拓扑、结果，或漏掉已经记下来的调试结论。

**实现项目根：`/home/xy/hero-ros2`（只读，绝不修改）。**
**调试笔记库：`/home/xy/thinking`（只读，绝不修改；Obsidian vault）。**

## When to apply

- 开始写或编辑任一论文章节（尤其 Ch.3 集成 / Ch.4 仿真 / Ch.5 硬件 / 结果）。
- 用户说「开始写」「编辑章节」「读取项目最新内容」「从项目里读」「更新论文」。
- 准备写任何关于 HERo/OCS2 的**具体数值、架构、实验设计、结论**之前。
- **每一次**动笔前都要跑 thinking-vault 的 mtime 刷新（见 §Thinking vault），
  同一会话里已经报告过「无更新 / 已读更新」才可跳过。

## 两种模式

### Mode A — 深度加载（一次写作会话里的第一次调用，或用户要求"全部读一遍"）

按顺序读全（下面 §Read map 的 1–7 全读）：文档全集、权威配置、git 历史、
源码结构、**以及该项目的 Cursor 聊天记录和 Claude Code 会话记录**。
然后跑 §Thinking vault：mtime 检查 + 按本章选读笔记。
读完输出一份 §Output brief。

### Mode B — 刷新（同一会话后续调用，默认）

只读增量，快速对齐：

1. `docs/HANDOFF.md`（进度/决策权威，**每次必读**）。
2. `git -C /home/xy/hero-ros2 log --oneline -15` + `git -C /home/xy/hero-ros2 status --short`（看已提交 vs 未提交 WIP）。
3. `git -C /home/xy/hero-ros2 diff` / `git -C /home/xy/hero-ros2 diff --stat`（未提交改动内容）。
4. 上次读取后 `docs/` 里有修改的文件（按 mtime）。
5. **thinking vault mtime 检查**（§Thinking vault）——有更新则读新文件并改 stamp。

输出一句话说明「自上次以来变了什么」，无变化则说明无变化。

## Read map（Mode A 全读，路径已核实）

| # | 事实源 | 路径 | 对应论文 |
|---|--------|------|----------|
| 1 | 进度/决策权威 | `docs/HANDOFF.md` | 全局 / 当前状态 |
| 2 | ISO 9283 实验设计权威 | `docs/experiment_a_design.md`（+ `_en.md`） | Ch.4 实验 |
| 3 | 部署拓扑 / TF / 故障 | `docs/ocs2_integration.md` | Ch.3 集成 |
| 4 | 其余文档 | `docs/coordinate_frames.md` `docs/simulated_hardware.md` `docs/devices.md` `docs/troubleshooting.md` `docs/action_server.md` `docs/zenoh_middleware.md` | Ch.3/5 |
| 5 | 项目总览 | `README.md` `CLAUDE.md` | 背景 |
| 6 | 真机唯一权威配置 | `src/Hero_OCS2/hero_ocs2_mobile_manipulator/config/hero/task_hardware.info` | Ch.3/4 参数 |
| 7 | 实验节点源码 | `src/Hero_OCS2/hero_ocs2_mobile_manipulator_ros/src/EeWaypointTargetNode.cpp` | Ch.4 方法 |

git（Mode A 也读）：
`git -C /home/xy/hero-ros2 log --oneline -25`、`git -C /home/xy/hero-ros2 status --short`、
`git -C /home/xy/hero-ros2 branch --show-current`（工作分支 `jazzy_xm`）。

## 聊天历史（Mode A 才读，文件可能很大）

按修改时间取**最新的 2–3 个**，大文件优先读结尾/用检索而非全量：

- **Cursor 聊天**：`/home/xy/.cursor/projects/home-xy-hero-ros2/agent-transcripts/`
  （结构为 `<uuid>/<uuid>.jsonl`，按 mtime 取最新几个）。
- **Claude Code 会话**：`/home/xy/.claude/projects/-home-xy-hero-ros2/*.jsonl`
  （按 mtime 取最新几个；单个可达数 MB，用检索关键词或读结尾，勿整读）。

目的：捕捉尚未写进 `HANDOFF.md` 的最新决策/调试结论。

## Thinking vault（`/home/xy/thinking`，每次写作必查）

Obsidian 库：真机/仿真调试记录、报错与对策、实验意图、论文大纲草稿。
**不是**当前架构或参数的权威；用来写「碰到了什么、为什么难、试过什么」。
忽略 `.obsidian/`。只读 vault；stamp 写在本仓库
`.cursor/thinking-source-state.md`。

### 刷新命令（Mode A 和 Mode B 都跑）

```bash
STAMP=/home/xy/HERO-thesis/.cursor/thinking-source-state.md
LAST=$(awk '/^last_checked:/{print $2; exit}' "$STAMP")
find /home/xy/thinking \( -name '*.md' -o -name '*.canvas' \) \
  ! -path '*/.obsidian/*' -newermt "$LAST" -printf '%T+ %p\n' | sort
```

- 有输出：读这些文件（大文件用检索/读与本章相关的节，勿整库灌进上下文），
  然后把 stamp 的 `last_checked` 和 file list 改成本次快照。
- 无输出：在 Output brief 写「thinking 笔记：无更新」。
- stamp 不存在：当作首次，走下面 Mode A 读图，并创建 stamp。

### Mode A 读图（按本章选读，不要 25 个文件全读）

| 笔记 | 对应论文 |
|------|----------|
| `Ros build.md` | **每次必读（优先）**：IPC/PC 启动、Experiment A、rosbag、Zenoh、chrony 对时、求解时间/policy lag 日志。写 Ch.3/4/5 部署与实验步骤时对照。文件很长：按本章关键词检索，不要整份灌进上下文。 |
| `thesis/实验收集数据.md` | Ch.4/5 实验设计、Hausdorff/ISO 9283、waypoint |
| `thesis/项目概况与问题解决汇总.md` | Ch.3/5 问题–对策素材 |
| `thesis/Outline.md` | 章节结构草稿（核对，不覆盖现有 LaTeX 结构） |
| `问题收集.md` | Ch.3/5 未收口的问题清单（很长：检索本章关键词） |
| `真机报错信息以及解决方案.md` | Ch.5 真机故障 |
| `小论文素材_问题与解决方案汇总.md` | 研讨课/全文叙事素材 |
| `最新分布式部署启动方案.md`、`ocs2_distributed_deployment_diagnosis.md`、`ocs2-distributed-reset-analysis.md`、`ocs2-deployment-analysis.md` | Ch.3 分布式 / Zenoh / reset |
| `hero-bringup-hardware-control.md`、`调试步骤.md` | Ch.5 bring-up |
| `self-collision.md`、`优化时间.md` | Ch.3 约束与求解时间 |
| `OCS2-basic/*` | 仅当写 Ch.2 OCS2 原理时 |

### 用法边界

- 笔记里的数字、拓扑、「当前架构」必须回 `/home/xy/hero-ros2` 复核后再写进正文。
- 笔记日期可能早于代码；冲突时以代码/`task_hardware.info` 为准，并在 brief 里点出笔记已过时。

## 章节 ↔ 事实源映射（写作时对照）

- **Ch.3 集成**：`ocs2_integration.md`（两机分布式 host/IPC + Zenoh 3 路）、
  `task_hardware.info`、`coordinate_frames.md`；笔记侧看 `Ros build.md`（启动/Zenoh/对时）、
  分布式诊断与 `问题收集.md` 里 MRT/Zenoh/TF 条目。
- **Ch.4 仿真/实验**：`experiment_a_design.md`（ISO 9283 双管线 DEC vs WBMP）、
  `EeWaypointTargetNode.cpp`、`config/.../experiment_a_waypoints.yaml`、
  `simulated_hardware.md`（dummy MRT）；笔记侧 `thesis/实验收集数据.md`、
  `Ros build.md`（Experiment A 启动、rosbag、solver/MRT 日志）。
- **Ch.5 硬件**：`HANDOFF.md` §4 真机 bring-up 状态、`troubleshooting.md`、`devices.md`；
  笔记侧 `Ros build.md`（IPC/PC Docker 启动）、`真机报错信息以及解决方案.md`、
  `hero-bringup-hardware-control.md`。

## Rules

- **只读**：绝不修改 `/home/xy/hero-ros2`、其 git、聊天历史、或 `/home/xy/thinking`。
  唯一可写的附属文件是本仓库 `.cursor/thinking-source-state.md`。
- **数值以代码为准**：任何配置数字（`nThreads`/`timeHorizon`/速度限位等）以
  `task_hardware.info` 当前内容为准，不要用 `HANDOFF.md`、thinking 笔记或记忆值；
  写进论文前用 `grep` 现读现核。
- **区分已提交 vs 未提交**：`HANDOFF.md`/设计文档可能是 untracked 或 WIP。写论文时
  标清哪些是已实现（committed）、哪些是"计划/进行中"，避免把未做的当成已做。
- **权威优先级**：`task_hardware.info`（真机配置）> `experiment_a_design.md`（实验设计）
  > `HANDOFF.md`（进度叙述）> `/home/xy/thinking`（问题/对策叙事，可能过时）
  > 聊天记录（最新但非正式）。冲突时按此顺序，并向用户点出冲突。
- 忽略 `task.info`（旧 dummy 模板）和 `task_gazebo.info`（孤儿文件），真机分析只信
  `task_hardware.info`。

## Output brief（读完后先给用户一段小结，再动笔）

```
项目上下文已加载（Mode A/B）：
- 分支/HEAD：<branch> @ <最新 commit 一行>
- 未提交 WIP：<git status 关键项，或"无">
- 与本次写作相关的事实源：<列 2–4 条最相关文档 + 关键数值>
- thinking 笔记：<无更新 / 列出已读的新文件>
- 自上次以来的变化：<Mode B：变了什么 / 无变化>
- ⚠️ 冲突或存疑：<文档与配置/代码/笔记不一致处，或"无">
```
