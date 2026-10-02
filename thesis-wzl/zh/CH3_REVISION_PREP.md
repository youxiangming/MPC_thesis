# 第 3 章修改准备与材料索引（2026-09-30）

> **状态（2026-10-02 更新）：本文件 §1、§3.2、§5 描述的是 09-30 的旧状态，已过时。**
> 之后的变化：第 3 章已有 7 张图；§3.2 只保留 bridge 在 IPC 上的单一部署；
> 「workstation」统一改为 external PC；MRT 循环频率按 `task_hardware.info`
> （hero-ros2 commit `998f074`）写为 50 Hz，§3.4 补了 MRT 的作用和降频理由；
> IPC 硬件（i5-6300U，2 核 4 线程）已写入 §3.2。§4 的材料索引仍然可用。
> 是否拆分第 3 章（§3.1）仍待决定。

对象：`01_chapters/03_integration.tex`（579 行，PDF p.17–27，共 11 页）。
中文对照：`zh/03_integration.md`。本文件只做索引与核对，**未改动任何正文**。

---

## 0. 改第 3 章时必须守的规则（摘自规则文件，按本章裁剪）

完整原文：`.cursor/skills/thesis-writing/references/supervisor-requirements.md`（优先级最高）、
`style-guide.md`、`terminology.md`、`citation-workflow.md`。

| 规则 | 对第 3 章的具体含义 |
|---|---|
| 非显然陈述都要出处，引用放句尾/段尾 | 工具/方法/标准/教科书公式要引；**本项目配置值、实测、自建代码的叙述不引** |
| 不引综述里的二手事实 | 本章目前没有综述引用，保持 |
| 描述机制、架构、时序、平台/坐标约定 → 必须画图 | 本章 11 页仅 1 张图（见 §3），**是本章最大的缺口** |
| 连续散文 ≤ 约 3 页不见图/表 | p.21–23 恰好 3 页只有公式，p.17–18 没有平台图 |
| 现在时写仍然存在的东西；做过的事用过去时 | 实现章：做了什么用过去时，系统如何工作用现在时 |
| 无主观词、无绝对陈述、先有需求再谈"合适" | 合适性判断要指向 R1–R7（`\cref{tab:requirements}`） |
| 实现章引用密度低于第 1–2 章是正常的 | 现有 17 处 `\cite`，不必追 30–40 |
| 图用 TikZ 写在章节文件里，沿用 `box`/`flow`/`lbl`/`machine` 样式 | 加图后必须 `pdftoppm` 渲染该页，目视检查标签溢出 |

---

## 1. 本章现状结构

| 节 | 行号 | PDF 页 | 浮动体 | 被其他章引用的 label（**改名会断引用**） |
|---|---|---|---|---|
| 引言段 | 1–15 | 17 | — | `ch:integration` |
| 3.1 平台 | 18–72 | 17–18 | **无** | `sec:hero-platform`（Ch4 ×2、Ch6） |
| 3.2 分布式架构 | 75–249 | 18–21 | 表 3.1（p.19）、图 3.1（p.20） | `sec:distributed-arch`（Ch5、Ch6）、`fig:architecture`（Ch4 ×2） |
| 3.3 模型与参数化 | 252–455 | 21–25 | 表 3.2（p.24），式 3.1–3.5 | `sec:wholebody-model`（Ch6）、`tab:mpc-config`（Ch4、Ch6）、`eq:rt-invariant`（Ch5 ×2、Ch6） |
| 3.4 硬件接口 | 458–579 | 25–27 | 表 3.3（p.26） | `sec:hw-interfaces`（Ch4 ×3、Ch5 ×2、Ch6）、`tab:bridge-guards`（Ch5 ×2） |

本章引用其他章的 label：`sec:sota-ocs2`、`sec:sim-path`、`sec:hw-challenges`、`ch:simulation`、`ch:hardware`。

**引用（17 处，全部已在 bib 中且无 VERIFY 标记，已于今天逐个核对）：**
`References.bib`：Carpentier2019Pinocchio ×2、Farshidian2017SLQ、Feller2017RelaxedBarrier、
Giftthaler2017Kinematic、Lynch2017ModernRobotics ×2、Macenski2022ROS2 ×2
`sources-manual.bib`：ocs2Toolbox ×4、CppAD、Chrony、twistMux、zenoh、ros2control ×2、
ROS2、HenkelRoth2019freeMoVe、HenkelRoth2020mr3ROS、UR10e

---

## 2. 导师对第 3 章说过什么

`mini-thesis-v1.pdf` 的 52 条批注只到 PDF p.14（第 1–2 章），**第 3 章正文没有逐句批注**。
直接涉及第 3 章的只有：

- **批注 #27**（p.9，对 Contributions 列表的第 3 章条目）："beefy chapter, might consider splitting"
  → 处理状态：**未做，等你决定**（`SUPERVISOR_COMMENTS_RESOLVED.md:117`）。
- 邮件三条通则（出处、多加图、不引综述）照样适用于第 3 章。

所以这次修改的依据主要是三条通则、`REVIEW_2026-08-20.md` 里的第 3 章条目，以及你自己的计划（§3 里的 `photo.md`）。

---

## 3. 待你决定的两件事

### 3.1 要不要拆第 3 章（批注 #27）

影响全书章号和交叉引用（§1 的 label 表列出了所有外部引用点）。可参考的已有材料：

- `/home/xy/thinking/thesis/Outline.md` 下半部分的「论证链」表：它设想过另一种结构，
  3.3 为**实时预算**，3.6 为**安全层**（"误差是算法的还是你限幅限出来的？"），全书共 7 章。
  这张表可以当作拆分的切口：3.1–3.2（平台+部署）/ 3.3–3.4（模型+实时预算）/ 桥与安全层。
- 最自然的拆法（仅供讨论，未执行）：
  **Ch3「系统与部署」**（现 3.1 + 3.2 + 3.4 桥/控制层）
  **Ch4「全身模型与实时参数化」**（现 3.3 + `eq:rt-invariant`），原 Ch4–6 顺延。
  拆分前要先确定论文类型（PA 还是 MA），它决定篇幅预期（`CLAUDE.md` 待决事项）。

### 3.2 加哪些图

**你自己的计划**（`/home/xy/thinking/thesis/photo.md`，今天 15:09 修改）：

| # | 内容 | 放置 | 形式 | 需要的素材 |
|---|---|---|---|---|
| P1 | 实体机器人照片 + URDF 尺寸标注 | 3.1 | 照片 + 叠加标注 / 并排 URDF 渲染 | 现场拍照；尺寸已核对（见 §5） |
| P2 | 实时运行的 TF 树 | 3.2 末尾（`world`–`odom` 恒等变换、`footprint`、`tool0`） | `ros2 run tf2_tools view_frames` 导出，或 TikZ 重画精简版 | 在机器人上运行一次 |
| P3 | 笔记本与机器人的连接图 | 3.1 末尾 / 3.2 开头 | TikZ：工作站、IPC、UR 控制器、AP、`192.168.12.0/24` | `hero-bringup-hardware-control.md` §一 |

**规则要求、但尚未计划的机制图**（候选，按"必须画"的程度排序）：

| # | 机制 | 位置 | 理由（supervisor-requirements §3） | 素材 |
|---|---|---|---|---|
| C1 | 时间轴：horizon $T$、`solutionTimeWindow`、solve 间隔、MRT 插值段 → 式 (rt-invariant) | 3.3 表 3.2 后 | "随时间展开的机制"；p.21–23 连续 3 页无图 | vault `OCS2-basic/OCS2 策略时间窗口.md`（已有按比例示意）；策略时间轴 artifact |
| C2 | 重置握手时序图（bridge ↔ MPC，含 15 s 告警、重试、基线重置） | 3.4 | "handshake" 被规则点名；HANDOFF/CHANGELOG 已列为可选图 | `ocs2-distributed-reset-analysis.md`、`MobileManipulatorHardwareMRT.cpp` |
| C3 | 平台自由度/坐标约定：`footprint`、非完整约束（无 $y$ 向速度）、臂安装偏移、`tool0` | 3.1 | "物理系统或坐标/DOF 约定" | 可与 P1 合并 |
| C4 | bridge 每周期流程 / hold 状态机（对应表 3.3 的 guard） | 3.4 | 架构/数据路径；把表 3.3 变成可读流程 | `小论文素材…汇总.md` 问题 6 |
| C5 | split vs integrated 对比示意 | 3.2 | "两种方案对比" | 表 3.1 已部分承担，可降级为可选 |
| C6 | 自碰撞对：32 → 12 的筛选示意 | 3.3 | 可选；文字已清楚 | vault `self-collision.md`（逐对判定） |
| C7 | 松弛障碍函数曲线（log 段 + 二次延拓，标出 $\delta$） | 3.3 式 (barrier) 旁 | 可选；一张小 pgfplots 图 | 式本身 |

⚠ **9 月 10 日的「17 项加图计划」已丢失**：claude-mem 里只有摘要（obs #574、#576、#579、#582，
Gemini 会话，内容只到"章节级"），计划正文没有写进任何文件。上表是今天按规则重新推出来的，不是那份计划的恢复版。

---

## 4. 按小节的材料索引

代码根目录：`/home/xy/hero-ros2/src/Hero_OCS2/`，下文简写为 `$OCS2`。
配置：`$OCS2/hero_ocs2_mobile_manipulator/config/hero/task_hardware.info`。

### 3.1 平台
- 平台参数、网络拓扑：vault `hero-bringup-hardware-control.md` §一「设备拓扑 192.168.12.0/24」、§三 CANopen、§四 UR10e
- 厂商手册：`materials/569_MR_3_BA_DEU_LD-1.PDF`、`569_MR_3_BA_ROS.PDF`（= `HenkelRoth2019freeMoVe` / `HenkelRoth2020mr3ROS`）
- 素材汇总：`小论文素材_问题与解决方案汇总.md` §1.1、§1.3
- 拍照清单：`thinking/thesis/photo.md`

### 3.2 分布式架构
- **核心**：`小论文素材…汇总.md` 问题 1（握手）、2（RViz/TF + latched 话题跨 Zenoh）、3（时钟）、9（split vs integrated 权衡）
- `ocs2_distributed_deployment_diagnosis.md`（Zenoh 路由器、启动顺序）
- `最新分布式部署启动方案.md`（"为什么是这个先后"，对应 l.241–249 启动顺序段）
- `ocs2-deployment-analysis.md` §3.2 数据流、`OCS2_ROS_interferce.md` ② 节点/话题流
- 启动文件：`$OCS2/hero_ocs2_mobile_manipulator_ros/launch/manipulator_hero_{pc,ipc}.launch.py`、`include/mrt_bridge.launch.py`
- ⚠ `thinking/Hero_ROS2/High-level architecture.canvas` 画的是 **Nav2 + OCS2 的未来架构**（`Hero_nav2_ocs2_planner`、`/hero/whole_body_control`），
  不是当前系统，只能用于第 6 章展望，不能拿来画图 3.1

### 3.3 模型与参数化
- 模型形式：`小论文素材…汇总.md` §1.2；`OCS2-basic/OCS2_MobileManipulator_Implementation.md`
- 求解时间调参原理：问题 8（碰撞对/timeStep/feedback policy）；`优化时间.md`（埋点量的含义）
- 时间窗口：`OCS2-basic/OCS2 策略时间窗口.md`（"三者要满足的关系"= 式 rt-invariant；含 08-14 实测）
- 自碰撞：`self-collision.md`
- 关节限位与 UR 保护停：`真机报错信息以及解决方案.md` §2026.8.11（C150A0 按制动距离提前触发；`delta=1e-3` 障碍"形同虚设"）
  → 可支撑 l.356–362"URDF ±360° 宽于安全面板"那段；若要写 $\delta$ 的实际效果，这里有素材

### 3.4 硬件接口与控制层
- bridge 源码：`$OCS2/hero_ocs2_mobile_manipulator_ros/src/MobileManipulatorHardwareMRT.cpp`
  （l.170 `arm_preview_seconds`，l.174 `observation_timeout_sec`，l.276–279 hold 与时间戳，l.331 循环频率，l.359 staleness，l.605–635 臂步长限幅）
- 素材：`小论文素材…汇总.md` 问题 6（桥的三个死锁 bug）、10（headless_mode）、11（专用 hardware_control 启动链 / twist_mux / JTC）、14（MRT 插值）
- 握手：`ocs2-distributed-reset-analysis.md`（上游 `resetMpcNode()` 对照、跨 Zenoh 的 `get_subscription_count` 问题）
- controller_stopper 白名单：`hero-bringup-hardware-control.md` §4.4
- "hold 替代外推"的由来：`问题收集.md` l.978（建议"policy age 超阈值即 hold"，并指出可写成架构章的贡献点）

---

## 5. 事实核对状态（今天现读）

**已核对一致**（`task_hardware.info` 已提交版本 = `a38bc0d` = HEAD）：
horizon 1.2 s、window 1.0 s、1 次迭代、8 线程、feed-forward、`timeStep` 2 ms / rollout 10 ms、
$R$ = 1e-2·diag(8.5, 8.5, 4.0…) → 0.085 / 0.04、$\mu_p$ = 10、$\mu_o$ = 5（running 与 final）、
`minimumDistance` 0.11、`overrideArmLimits true`、barrier $\mu$ = 0.01 / $\delta$ = 1e-3、
bridge preview 0.6 s、staleness 0.2 s。平台尺寸、质量、轮参数、臂安装位姿：`REVIEW_2026-08-20.md` §五 已核对。

**⚠ 漂移，需要你知道：**

1. **`mrtDesiredFrequency` 工作区未提交改动 100 → 50**（`task_hardware.info:100`，文件修改于 09-29 17:59）。
   bridge 的循环频率**直接取这个值**（`MobileManipulatorHardwareMRT.cpp:331`）。
   论文里的 100 Hz 出现在表 3.1、图 3.1、表 3.2、l.463、l.508（"10 ms later"）以及臂限幅的推导里。
   论文以已提交快照为准时 100 Hz 是对的；如果 50 Hz 要保留并重新跑实验，这些地方都要改。
2. **`task_experiment_a.info`**：`a38bc0d`（08-14 实验所用）为 1.3 / 1.2 / false / 8 线程；
   **HEAD（6d63b70）已变为 1.0 / 0.5 / true / 16 线程**。论文第 4、5 章引用的 1.3 s 是快照值，没有错；
   但 `REVIEW_2026-08-20.md` §4.1 表里的"当前磁盘 WIP"一栏（1.0 / 0.5 / true / **10**）已过时：
   这些改动已经提交，且线程数现在是 16。
3. REVIEW §4.1 的建议仍未落实：本章开头 l.13–15 的 "Unless stated otherwise…" 没写配置快照的 commit，
   半年后无法复现。建议加 `a38bc0d`（这是对正文的修改，等你同意）。
4. 同一文件的注释写着 "DEC dual-pipeline comparison deferred 2026-09-28"（`task_experiment_a.info:289`），
   与第 1/6 章里对 DEC 基线的表述是否一致，改到后面章节时要留意。

---

## 6. 语言层面已发现的小问题（未改）

- l.224 "One consistency requirement is easy to violate"：属于没有比较对象的判断，可以改成说明违反后会发生什么
- l.382 "are worth spelling out"：接近禁用句式 "it is worth noting"
- 破折号 `---` 正文约 5 处（l.91、289、352、484、…），本章 11 页，未超上限
- l.44–46 "an order of magnitude below the arm's capability"：比较对象是 UR10e 的额定关节速度，但没给出处，建议补 `\cite{UR10e}` 或给出具体数值
- l.78–80 "the on-board IPC is a small machine"：没有比较对象（小于什么？），建议给出 CPU 型号，或与工作站对比

---

## 7. 三个回忆来源的检查记录

| 来源 | 结果 |
|---|---|
| Obsidian vault `/home/xy/thinking` | 约 15 份相关笔记已索引（§3–4）；`问题收集.md` l.978 与 bridge hold 设计有关 |
| Claude auto-memory `~/.claude/projects/-home-xy-HERO-thesis/memory/` | **为空**，没有任何记录 |
| claude-mem | obs #518（TikZ 样式）、#572（3.4 节检查）、#574/#576/#579/#582（加图计划摘要，正文已丢失）、#584（HANDOFF） |

三个来源之间**未发现冲突**。唯一的不一致在 `REVIEW_2026-08-20.md` §4.1 内部（见 §5 第 2 条），
属于文档过时，不是来源冲突。
