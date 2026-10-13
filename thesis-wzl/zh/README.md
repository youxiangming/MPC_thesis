# 英文论文的中文对照

这是当前英文稿（`thesis-wzl/01_chapters/*.tex`，与 `main.pdf` 对应）的**完整中文对照**，用来读懂正文写了什么。正式提交仍以英文 PDF 为准。

- 章节、论点、数字、表与英文一致。
- 公式改成白话，并保留短名字（如 e_p、T_sol），方便和英文 PDF 对上看。
- 图在 PDF 里是 TikZ/曲线；这里只写图在讲什么（并标 `fig:...` 标签）。图号按英文稿浮动体出现顺序估算，**以 PDF 为准**。
- 话题名、文件名、节点名保持英文原样。
- 平台名按正文宏：HERo。`plant` 一律译作**被控对象**。机器名按英文：外部 PC / IPC（不用 workstation）。

**同步状态（2026-10-13 18:12 再核，可人工对照）：** 第 1–6 章与当前工作区英文 LaTeX 对齐（含未提交改动）。论文类型 **PA**。日常桥循环 **50 Hz**（第 5 章会话仍是 100 Hz）。

**2026-10-13 19:00 补：** 第 3 章两张新图：§3.1 **`fig:tf-tree`**（图 3.3，完整 TF 树，按 `view_frames` 录制结果重画）；§3.3 **`fig:selfcollision-postures`**（图 3.9，腕部靠近底盘的两种姿态，RViz 碰撞体截图）。第 3 章图号现为 3.1–3.12，全文 75 页。

**2026-10-13 当日新增（中英均有）：** §1.1 `fig:line-vs-lmas`；§4.2.3 `fig:sim-rviz`（四子图 ready/run/closeup/done，10-13 另开会话截图）；§6.3 `fig:deciding-experiment`；Ch4–6 去掉「尚未与解耦基线对比」类表述；§6.3 评估计划改为两项 + 滞后补偿实验优先。

本轮相对下午第二轮再补：第 5 章新图 **`fig:hw-policy-u`**（真机十份策略底盘前进速度沿 τ 改号；mock 无此脉冲），图号顺延为 5.1–5.6；第 6 章按英文改写总结/反思/展望（三被控对象 11→27→130 mm、改号机制、可证伪的滞后补偿实验优先）。此前已同步：§4.2.4 dummy 残差（表 4.3 / 图 4.7）、自碰撞节点实测中位 10、`a38bc0d` 快照、无 OptiTrack/PolyScope。

读中文时仍以 `main.pdf` 为最终权威。评阅开项见 [REVIEW_2026-08-20.md](REVIEW_2026-08-20.md)。

## 题名

**英文：** Integration and Validation of Whole-Body Model Predictive Control for a Mobile Manipulator in Line-less Assembly

**中文：** 无产线装配中移动操作臂全身模型预测控制的集成与验证

**德文副标题（封面灰色字）：** Integration und Validierung einer ganzkörperbasierten modellprädiktiven Regelung für einen mobilen Manipulator in der linienlosen Montage

## 章节

| 章 | 对照文件 |
|----|----------|
| 1 无产线移动装配系统导论 | [01_introduction.md](01_introduction.md) |
| 2 全身运动规划研究现状 | [02_state_of_the_art.md](02_state_of_the_art.md) |
| 3 把 OCS2 接到 HERo 上 | [03_integration.md](03_integration.md) |
| 4 仿真验证 | [04_simulation.md](04_simulation.md) |
| 5 真机部署与初步结果 | [05_hardware.md](05_hardware.md) |
| 6 结论与展望 | [06_conclusion.md](06_conclusion.md) |

## 读公式时的短名字

| 短名字 | 意思 |
|--------|------|
| e_p | 位置误差：指令末端和实际末端之间的直线距离 |
| e_o | 姿态误差：两个姿态还差多少转角 |
| e_∥ / t_lag | 沿指令路径落后了多少；再除以指令速度，换成等效滞后（秒） |
| e_⊥ | 横向偏离（切出路径、向内收） |
| H / H̄ / P95 | 两条路径形状差多少（最差点 / 平均 / 95% 分位） |
| T | 预测时域：求解器每次往前看多少秒（日常 `task_hardware.info`：1.2 s；实验 A：1.3 s） |
| T_sol | 策略有效窗口：这份计划允许多久内还能用（日常 1.0 s；实验 A：1.2 s） |
| f_MRT | 桥循环 / 观测发布频率（日常 50 Hz；第 5 章会话 100 Hz） |
| τ = 0 | 刚拍到状态的那一瞬；计划开头那一拍输入 |
| μ_p / μ_o | 末端位置 / 姿态权重（日常 10 / 5；实验 A：16 / 3） |
