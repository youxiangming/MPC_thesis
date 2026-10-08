# 变更详表 — 2026-10-02

跨 Claude Code + Cursor 会话（相对上次交接 `HANDOFF.md` 2026-09-30）。
每行：**时间 / 修改内容 / 原因 / 出处**。本文件是细账；`HANDOFF.md` 只摘要并链接此处。

> 本 Cursor 会话（18:15）只写交接文档，不改 LaTeX。下列正文改动均属当日更早会话。

---

## A. 规则与项目记忆（云端讨论笔记权威）

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| ~15:40–16:15 Cursor | `.cursor/rules/thinking-notes-source.mdc` 增补两篇云端讨论笔记；权威顺序：live `hero-ros2` > 记忆 > vault | 用户要求把云端讨论写入规则，且数字/架构以最新项目为准 | 用户指令；vault `thesis/claude 云端讨论总结.md` §0/§7 |
| 同上 | `load-hero-project/SKILL.md`、`CLAUDE.md` 同步上述权威说明 | 与规则一致，避免写作时把聊天记忆当事实 | 同上 |
| 同上 | 直接改写 vault `claude 云端讨论总结.md`（部署、力矩、MRT 50、自碰、Exp A） | 用户：「直接修改原文」；指出与实况不符处后回写 | Cursor 会话 [cloud notes](f442b8c7-d7c0-4954-bf42-1dda34ebd39c) |
| ~14:28–18:12 Claude | 新建/更新 memory：`ipc-hardware`、`mrt-rate-50hz`、`ur-panel-joint-limits-changed`、两篇 cloud narrative | 写进 Claude 项目记忆，供后续会话 | Claude Code 会话 `4b558a0c` / `263bbdfb` |

---

## B. 第 2 章 — 删除学习类方法

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| 09-30 后（已在树中） | 删 §2.2.2 Learning-based 整段；taxonomy 节点去掉 learned policies；`tab:sota-comparison` 从四列改三列 | 作者决定不做 RL 对照 | `SUPERVISOR_COMMENTS_RESOLVED.md` p.14 更新；作者决策 |
| 同上 | bib 仍留 `Honerkamp2023N2M2` 等四条，但不再被引用 → `main.bbl` **61→57** | 解释上次交接里未解释的 bbl 漂移 | 编译核对 2026-10-02 |

---

## C. 第 3 章 — 事实修正 + 照片 + 自碰表

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| ~14:00 Claude | §3.2 写入 IPC：i5-6300U、2C/4T、7.7 GB、非 RT、`powersave`；相对外部 PC 线程数论证求解器外置 | 「小机器」无证据；用户提供 `IPC-569` 规格表 | 用户指令；memory `ipc-hardware.md` |
| 同上 | MRT 桥循环改为 **50 Hz**（`mrtDesiredFrequency`）；解释可从 100→50；`mpcDesiredFrequency=10` 只作告警阈值 | 读最新 `task_hardware.info`（hero-ros2 `998f074`）+ vault `OCS2-basic/MRT话题.md` | 用户指令；memory `mrt-rate-50hz.md` |
| 同上 | 自碰：删「`collision_pairs_dropped.info`」；改为「丢掉的对只写在任务文件注释」；动机=降求解时间；新增 `tab:collision-pairs`（32→12） | 文件不存在；vault `self-collision.md` + 原项目 | 用户指令；上次 HANDOFF Gotcha |
| 同上 | UR：本工作不发力矩，只走轨迹/速度接口（证据支持 5.24） | 用户确认核实 | Claude `4b558a0c`；云端素材力矩表述 |
| ~17:00 Claude | 关节限位：任务文件=实验时面板值；腕 3 事后被同事改为 ±363°；照片作 `fig:pendant-limits`，图注写明不匹配 | Drive 照片与 task 文件不一致；用户选方案 (a) | 用户；memory `ur-panel-joint-limits-changed.md`；Drive `1HVULAEEBxMc-w4U1aI-rsGrzi-IhVRDW` |
| 同上 | §3.1 插入 `fig:hero-photo`（front/rear jpg，EXIF 已剥） | 导师「wall of text」+ photo.md #1；用户提供外观照 | Drive 同文件夹；用户 |
| 09-30 已有 | TikZ：`fig:hero-frames`…`fig:bridge-cycle`（见 09-30 交接） | 同上 | 上次 HANDOFF |

---

## D. 第 4–6 章 — 补图（破「有方法没结果图」）

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| ~16:xx Claude | Ch4 新图：`fig:ee-error-decomp`、`fig:hausdorff-directions`、`fig:sim-dummy-stack`、`fig:sim-box`（含 segment）、`fig:sim-phases` | 导师多图要求；优先级清单 A/C | Claude `12b05b7d`；邮件「more figures」 |
| 同上 | Ch5：`fig:hw-solve-ecdf`（用新建 `hw_*_solve_ecdf.dat`）、`fig:hw-lag`；既有 path/error/solve 图保留/加强 | 求解时间分布近零成本；对照 mock/真机 | 同上；冻结 Experiment A 数据 |
| 同上 | Ch6：`fig:requirements-trace`（R1–R7 → 证据） | 结论章零图；追溯需求表 | 同上；表 1.1 |

---

## E. 中文对照同步

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| ~16:15–16:29 Cursor | `zh/01`–`06`、`README`、`SUPERVISOR_COMMENTS_RESOLVED` 按当前英文重写/对齐 | 用户要「方便理解你写了什么」；09-30 后英文已变、中文仍写工作站/双部署 | Cursor [zh sync](894d5a53-8d1a-4fb9-9a86-38c28c4bee89) |
| 同上 | `zh/CH3_REVISION_PREP.md` 顶部标过时 | 避免按旧索引改章 | 文件自注 2026-10-02 |

---

## F. 编译（本交接会话核实）

| 时间 | 结果 | 备注 |
|---|---|---|
| 18:17 | tectonic exit 0；undefined 0；**57** `\entry`；**68** pages | 相对 09-30：61 pp → 68 pp；bbl 57（学习类四条未再引用） |

---

## G. 未做 / 仍开着

| 项 | 状态 |
|---|---|
| 第 3 章是否拆分（批注 #27） | 未决 |
| 英文 Abstract、缩略语表 | 送审前仍开（PA 已确认） |
| 论文类型 PA vs MA | **已确认 PA**（2026-10-02） |
| 选题书外部计量 / OptiTrack | **本文不写**（2026-10-02）；评阅不再当缺口 |
| PolyScope / effort 能力讨论 | **本文不写**；只保留 twist + 关节轨迹 |
| 锁实验 SHA `a38bc0d` | 建议仍做（评阅 P0） |
| `fig:selfcollision` 专用图 | 用 `tab:collision-pairs` 替代，可不再画 |
| 管线夹 / 安装板特写照片 | 正文已描述，照片非阻塞 |
| 安装名 `kalimoro`（task 注释）vs 照片 `mft` | 未澄清 |
| Dummy 一圈补录 → 表 5.1 三列 | 可选 |
| 全部未提交 | 见工程侧 `HANDOFF.md` |

---

## H. 本晚追加（正文 + 评阅）

| 时间 | 修改内容 | 原因 | 出处 |
|---|---|---|---|
| ~18:30 Cursor | 正文删 OptiTrack/外部计量缺口与 PolyScope effort；`REVIEW_2026-08-20.md` 按 PA + 作者决定重写开项；同步 RESOLVED / README / 本 CHANGELOG | 用户：「外部计量本文不提；PA；effort 不再讨论」；「修改评阅」 | 本会话 |
