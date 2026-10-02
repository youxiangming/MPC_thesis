# 英文论文的中文对照

这是当前英文稿（`thesis-wzl/01_chapters/*.tex`，与 `main.pdf` 对应）的**完整中文对照**，用来读懂正文写了什么。正式提交仍以英文 PDF 为准。

- 章节、论点、数字、表与英文一致。
- 公式改成白话，并保留短名字（如 e_p、T_sol），方便和英文 PDF 对上看。
- 图在 PDF 里是 TikZ/曲线；这里只写图在讲什么（并标 `fig:...` 标签）。图号按英文稿浮动体出现顺序估算，**以 PDF 为准**。
- 话题名、文件名、节点名保持英文原样。
- 平台名按正文宏：HERo。`plant` 一律译作**被控对象**。机器名按英文：外部 PC / IPC（不用 workstation）。

**同步状态（2026-10-02）：** 第 1–6 章已按当日英文 LaTeX 核对；补上第 4 章误差分解图 / Hausdorff 方向图、第 6 章 R1–R7 对照图，以及第 3 章手臂轨迹 time-from-start 细节。日常桥循环 **50 Hz**（第 5 章会话仍是 100 Hz）。读中文时仍以 `main.pdf` 为最终权威。

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
