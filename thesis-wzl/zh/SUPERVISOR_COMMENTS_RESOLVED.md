# 导师批注处理记录（mini-thesis-v1.pdf，52 条）

生成时间：2026-09-10。原始批注见 `SUPERVISOR_COMMENTS_v1.md`。

## 邮件三条要求的落实

| 要求 | 处理 |
|---|---|
| 每条非显而易见的陈述都要有出处 | Ch1 引用 7 → **33** 处（27 个不同条目），Ch2 引用 13 → **38** 处（32 个不同条目）。|
| 多加图，别是文字墙 | Ch1/Ch2 新增 **5 张图**（1.1、1.2、2.1、2.2、2.3）；全书图目录 0 → 12 条。|
| 综述里的事实要引一手论文 | `SantAnna2026WBMPReview` 引用 6 → **1** 处，且只用于“文献检索起点”。原来的 5 处转引全部换成一手文献。|

另：`References.bib` 全部条目已用 Crossref 逐条核对（作者／刊名／卷期页／年／DOI），
文件头的 12 个 `% VERIFY` 标记 **归零**；顺带纠正两处错刊：
Sandakalum 2022 实为 *Machines* 10(2):97（原写 Applied Sciences 12(21)），
Buckhorst 2022 实为 *Decentralized Holonic Control System Model for LMAS*, RCIM 75:102301。
原 `Kern2019LMAS` 查无此文，换成可核实的 Kern et al. 2016, Procedia CIRP 57:327–332。

## 逐条处理


### PDF p.1

- **原文**：“[Xiangming You] [Matriculation No.440593]”
  - 批注：No need for the brackets
  - 处理：标题页 `\author` / `\studentid` / `\supervisor` 三处方括号已去掉（main.tex）。

### PDF p.4

- **原文**：“II List of Figures”
  - 批注：We're missing a lot of figures
  - 处理：Ch1/Ch2 新增 5 张图（1.1、1.2、2.1、2.2、2.3）；图目录从 0 条变成 12 条。

### PDF p.6

- **原文**：“Manufacturing is increasingly shaped by short product life cycles, high variant diversity, and volat…”
  - 批注：Find a source for this statement
  - 处理：补 [ElMaraghy2013Variety]（CIRP Annals，产品变体管理），把“短生命周期／多变体／需求波动”落到出处。
- **原文**：“The Line-less”
  - 批注：that's not a new paragraph
  - 处理：段落重组：FMS/RMS 一段自然过渡到 LMAS，不再是突兀的新段。
- **原文**：“one such paradigm”
  - 批注：avoid this formulation
  - 处理：删掉“one such paradigm”，改为“把这一发展推到极限：直接取消固定工位网格”。
- **原文**：“The Line-less Mobile Assembly System (LMAS) is one such paradigm studied at the Laboratory for Machi…”
  - 批注：While this statement is true please talk about flexible manufacturing systems in a more generalistic manner
  - 处理：新增一段泛论 FMS 与 RMS：[Koren1999RMS]、[ElMaraghy2005FRMS]、[Kern2016Modular]，再收敛到 LMAS。
- **原文**：“The assembly “line” is dissolved into a dynamically reconfigurable constellation of resources that a…”
  - 批注：You're missing a source
  - 处理：补 [Huettemann2019LMAS]（LMAS 定义）、[Buckhorst2019Planning]、[Buckhorst2022LMAS]。
- **原文**：“cover.”
  - 批注：add a picture of mobile manipulators, helps the reader.
  - 处理：新增图 1.1：移动操作臂示意（(a) 底盘平面位姿 + 无侧滑约束，(b) 六轴臂与末端位姿）。

### PDF p.7

- **原文**：“This freedom”
  - 批注：The addition of degrees of freedom to the system
  - 处理：“This freedom”改为“Adding a mobile base to the arm changes the motion-planning problem in three ways”。
- **原文**：“Large, base-dependent workspace. The target end-effector pose may lie outside the reach of the arm f…”
  - 批注：Excellent
  - 处理：保留（导师认可），并补两篇综述引用。
- **原文**：“Changing, shared environment. Resources move relative to one another; the environment is neither sta…”
  - 批注：Not necessarily true
  - 处理：改写为“Shared workspace with moving resources”：明确“环境已知程度取决于车间”，结论改成“不是不能离线算，而是算完要边执行边修正”，引 [Finean2023ContextAware]。
- **原文**：“mobile base combined with a six-degree-of-freedom (6 DOF) arm is highly redundant with respect to an…”
  - 批注：How many degrees of freedom are added? How do they introduce a redundancy? Grubler's formulae can be good to demonstrate your fact.
  - 处理：新增式 (1.1) Grübler 公式（臂 dof = 6(7-1-6)+6 = 6）与式 (1.2) 冗余度（9-6=3）；再补速度层：非完整约束下 8 个瞬时输入对 6 维任务 → 2 个瞬时冗余。引 [Lynch2017ModernRobotics]、[Siciliano2009Robotics]。
- **原文**：“MoveIt”
  - 批注：such as Moveit
  - 处理：改为“an arm-motion framework such as MoveIt”。
- **原文**：“a trajectory for”
  - 批注：inverse kinematics, be more precise
  - 处理：精确化：先解逆运动学得到目标构型，再规划关节空间轨迹（引 [Sucan2012OMPL]）。
- **原文**：“This decoupled scheme is simple, modular, and reuses mature, well-tested components,”
  - 批注：Why is it simple? because it relies on established robust systems that are prevalent in industry
  - 处理：改为“modular and, above all, built from components that are mature and widely deployed in industry”，并说明这才是它流行的实际原因。
- **原文**：“The decoupling, however, has intrinsic limitations that become severe in the LMAS setting:”
  - 批注：The sentence sounds llm generated but is actually good to introduce the problematic
  - 处理：保留原句（导师认为可用）。
- **原文**：“end-effector target unreachable, even though a jointly chosen base–arm configuration exists.”
  - 批注：Cite more sources
  - 处理：补 [Sandakalum2022Survey]、[Thakar2023MobileManip]、[Haviland2022Holistic]。

### PDF p.8

- **原文**：“the arm’s reach (a common LMAS case) cannot be executed smoothly this way.”
  - 批注：Source again
  - 处理：补 [BurgessLimerick2024ReactiveBase]、[Pankert2020PerceptiveMPC]。
- **原文**：“fixed base pose, cannot react to base drift, moving obstacles, or an updated target without re-trigg…”
  - 批注：I am sure of the existence of adaptive frameworks which could work.
  - 处理：改写为“Cost of reacting to change”：明说“可以重触发，也存在在线预测并修补轨迹的规划器”[Finean2023ContextAware]，真正的代价是**改底盘决策**贵。
- **原文**：“Whole-body motion planning removes this artificial boundary by treating the mobile base and the arm …”
  - 批注：Wonderful statement, where is it defined? A robotics book such as Modern Robotics can be cited here.
  - 处理：补 [Lynch2017ModernRobotics]、[Siciliano2009Robotics]、[Dietrich2015NullSpace]、[Haviland2022Holistic]。
- **原文**：“once embedded in a feedback loop, the plan reacts continuously to a changing target and environment.”
  - 批注：Not quite trivial
  - 处理：加限定：反应能力取决于重解速度与场景变化速率之比，并指向第 5 章的实测。
- **原文**：“mobile manipulation.”
  - 批注：How so?
  - 处理：给出两条具体理由（约束是状态/输入不等式 → MPC 原生处理 [Mayne2000Constrained]；从实测状态重解 → 规划即反馈），并引 [Minniti2019WholeBodyMPC]、[Pankert2020PerceptiveMPC]。
- **原文**：“differential-drive”
  - 批注：mobile base in general
  - 处理：“differential-drive”泛化为“non-holonomic condition of a wheeled base”。
- **原文**：“It is the framework integrated and evaluated in this work.”
  - 批注：remove this sentence for now
  - 处理：该句已删除。
- **原文**：“Objective.”
  - 批注：I quite like that you formulated a dedicated paragraph, but you could go with a subsubsection
  - 处理：`\paragraph{Objective.}` 等三处改为 `\subsection`（1.3.1–1.3.4）。

### PDF p.9

- **原文**：“the selection of a suitable whole-body motion-planning approach for the HERo platform, fol- lowing a…”
  - 批注：good
  - 处理：保留。
- **原文**：“the integration of OCS2 whole-body MPC into the HERo software stack, including a distributed host/on…”
  - 批注：beefy chapter, might consider splitting
  - 处理：**未做（需你决定）**：拆分第 3 章是结构性改动，影响全书编号与交叉引用，留给你拍板。
- **原文**：“Structure.”
  - 批注：redundant with scope and contributions, but I let it pass
  - 处理：保留（导师放行）。

### PDF p.10

- **原文**：“argued”
  - 批注：always write in present tense, the chapter still exist
  - 处理：改为现在时：“\Cref{ch:introduction} argues that …”。
- **原文**：“systematic”
  - 批注：beware of using this term. This implies that you used an actual systematic methodology
  - 处理：删除“systematic”一词描述本文工作；SLR 只写成“文献检索的起点（提供检索式、筛选协议与语料）”，并明说本章每条事实都归到一手文献。
- **原文**：“[SAND22; THAK23]”
  - 批注：Interesting, I'll have to read these
  - 处理：无需改动。
- **原文**：“A whole-body scheme instead treats the base and the arm as a single redundant”
  - 批注：Where do you get this fact from
  - 处理：补 [Haviland2022Holistic]、[Minniti2019WholeBodyMPC]、[Dietrich2015NullSpace]。
- **原文**：“distinguish approaches primarily by how the base and the arm are coupled and by the algorithmic prin…”
  - 批注：a graphical representation would be great but optional. A Venn diagramm is cool there
  - 处理：新增图 2.1：三轴维恩图（whole-body 耦合 / 时域优化 / 在线反馈），whole-body MPC 位于三者交集，采样法在三者之外。

### PDF p.11

- **原文**：“different families”
  - 批注：categories?
  - 处理：“different families”改为“different categories of algorithm”。
- **原文**：“excel”
  - 批注：subjective, never use words like this in a thesis
  - 处理：“excel at”改为“are effective at”，并补“概率完备但不优化 running cost”的准确表述。
- **原文**：“These methods excel at finding feasible paths in cluttered, high-dimensional spaces but do not nativ…”
  - 批注：we're going to need sources for facts like these
  - 处理：补 [Kavraki1996PRM]、[LaValle2001RRT]、[Sucan2012OMPL]、[LaValle2006Planning]。
- **原文**：“When the optimisation is solved once, offline, over a full trajectory, one speaks of trajectory opti…”
  - 批注：&quot;one calls&quot; is an absolute no-go. Reformulate the sentence with trajectory optimisation
  - 处理：“one speaks of”删除，改为“Solving that optimisation once, before execution, over the complete trajectory is *trajectory optimisation*”。
- **原文**：“myopic,”
  - 批注：meaning?
  - 处理：“myopic”删除，改成解释性表述：只优化当前时刻，无法“现在差一点、换以后可行”。
- **原文**：“They are cheap and fast”
  - 批注：Compared to what
  - 处理：改为相对比较：“a single quadratic program is cheaper to solve than an optimisation over a horizon of the same model”。
- **原文**：“ple”
  - 批注：never make absolute statements in a thesis, always use comparisons, as everything is relative
  - 处理：该条 bullet 全部改为相对表述，去掉绝对断言。
- **原文**：“They”
  - 批注：what is they in the sentence, reuse learning based schemes, even if it redundant
  - 处理：“They”改为“Learning-based schemes”（宁可重复）。
- **原文**：“Only online,”
  - 批注：What is only online
  - 处理：改为“It is the online, feedback-driven variant that supplies the disturbance rejection …”，并说明离线轨迹缺少反应机制的原因。

### PDF p.12

- **原文**：“In practice, the mature, deployable representatives of this class are almost exclusively optimizatio…”
  - 批注：Now is a good time for showing a figure explaining how it works
  - 处理：新增图 2.2：滚动时域原理图（t_k 解全时域、只执行第一段、t_{k+1} 从实测状态重解）。
- **原文**：“optimal- control formulations—and the OCS2 toolbox in particular—recur as a common backbone, alongsi…”
  - 批注：Don't quote the literature review but state examples in the literature review
  - 处理：**按邮件要求改掉**：删掉转引，改为直接列一手例子——[wbcros]、[wolfsetup]（ros2_control 包装 / cmd_vel+goal 桥接 + joint-state publisher）、[Stelter2022OpenSource]、[Stueben2021ConstraintWBC]、[Sleiman2021UnifiedMPC]、[Pankert2020PerceptiveMPC]。
- **原文**：“open-source C++ library”
  - 批注：written in
  - 处理：改为“an open-source library written in C++”。
- **原文**：“[FARS17].”
  - 批注：put the citation at the end of the paragraph, there is a latex option such as \\citep for that normally
  - 处理：引用移到段末：SLQ 那段的 [Farshidian2017SLQ; Grandia2019FeedbackMPC; Feller2017RelaxedBarrier; ocs2Toolbox] 统一放句尾。
- **原文**：“Three features make OCS2 well suited to whole-body mobile manipulation. First, it derives the cost a…”
  - 批注：Use a figure?
  - 处理：新增图 2.3：OCS2 结构图（符号模型 → CppAD 自动微分 → SLQ 求解器 + reference manager → policy → MRT → 机器人），三个特性一图说清。

### PDF p.13

- **原文**：“This track record on hardware, its explicit constraint handling, and its process-separable architect…”
  - 批注：You haven't formulated the requirements thus making this sentence very arbitrary
  - 处理：**新增表 1.1（R1–R7 需求表）**，写在 §1.3.2；表 2.1 改为按 R1–R7 逐行打分，正文 9 处引用该表。原来“primary candidate”的空泛结论改成“R1–R4 有硬件证据、R5 靠 MPC–MRT 拆分”。
- **原文**：“Sampling-based planning (MoveIt).”
  - 批注：The WBMP implementation of MoveIt is closed source
  - 处理：补一句：开源 MoveIt 不提供在线协同的全身反馈；具备该能力的是商业闭源的 MoveIt Pro，因此不满足 R7（新增 bib 条目 [moveitpro]）。
- **原文**：“cmd_vel/goal topics”
  - 批注：Joint-state publisher
  - 处理：集成机制里补上 joint-state publisher（机器人状态经此进入求解器）。

### PDF p.14

- **原文**：“A growing body of work hybridises classical navigation with reinforcement learning to amortise the o…”
  - 批注：again cite the direct source, not the review paper
  - 处理：**按邮件要求改掉**：改引一手文献 [Honerkamp2023N2M2]、[Jauhri2022Reachability]、[Iriondo2023DRL]、[Kang2024DoorOpening]。
- **原文**：“hardware stack.”
  - 批注：interfaces
  - 处理：“existing hardware stack”改为“ROS~2 interfaces”。

## 未处理 / 待你决定

1. **第 3 章拆分**（p.9 批注“beefy chapter, might consider splitting”）——结构性改动，影响全书章节编号与交叉引用，需要你先定。
2. 与本次邮件无关但仍未解决的送审前项（见 `REVIEW_2026-08-20.md`）：**缺英文 Abstract**、**缩略语表被注释**、**论文类型 PA 还是 MA 未确认**。

## 编译状态

`tectonic` 退出 0，无 TeX error，无 undefined reference / citation，共 **57 页**（原 48 页）。
