# 变更详表 — 2026-09-10（Claude Code 会话，13:12–15:50）

每行：**改了什么 · 什么时候 · 为什么 · 依据出自哪里**。
批注编号对应 `SUPERVISOR_COMMENTS_v1.md` 里的顺序（按 PDF 页码排列）。

---

## A. 批注提取（13:12–13:15）

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 13:15 | 新建 `zh/SUPERVISOR_COMMENTS_v1.md` | `mini-thesis-v1.pdf` 里有 52 条 PDF 批注，正文看不到。用 zlib 直接解析 PDF 对象流取出批注文本，并按 QuadPoints 反查被高亮的原文。出处：PDF 注释对象 `/RC` 字段 |

## B. 第 1 章重写（13:20–13:38，15:38 二次修订）

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 13:22 | 首段补 `[ElMaraghy2013Variety]` | 批注 3「Find a source for this statement」，钉在"短生命周期/多变体/需求波动"上 |
| 13:22 | 新增 FMS/RMS 泛论段，引 `[Koren1999RMS]` `[ElMaraghy2005FRMS]` `[Kern2016Modular]` | 批注 6「please talk about flexible manufacturing systems in a more generalistic manner」 |
| 13:22 | 删除"one such paradigm"措辞；LMAS 段并入上文 | 批注 4「that's not a new paragraph」、批注 5「avoid this formulation」 |
| 13:22 | LMAS 定义补 `[Huettemann2019LMAS]` `[Buckhorst2019Planning]` `[Buckhorst2022LMAS]` | 批注 7「You're missing a source」 |
| 13:26 | 新增图 1.1 移动操作臂示意（(a) 底盘平面位姿+无侧滑 (b) 六轴臂+末端） | 批注 8「add a picture of mobile manipulators, helps the reader」 |
| 13:22 | "This freedom"→"Adding a mobile base to the arm…" | 批注 9「The addition of degrees of freedom to the system」 |
| 13:22 | 环境假设段改写为"取决于车间"，引 `[Finean2023ContextAware]` | 批注 11「Not necessarily true」 |
| 13:22 | 新增式 (1.1) Grübler + 式 (1.2) 冗余度 + 速度层非完整约束分析 | 批注 12「Grubler's formulae can be good to demonstrate your fact」 |
| 13:22 | 补 `[Lynch2017ModernRobotics]` `[Siciliano2009Robotics]` `[Yoshikawa1985Manipulability]` `[Dietrich2015NullSpace]` | 同上 + 批注 20「A robotics book such as Modern Robotics can be cited here」 |
| 13:22 | "MoveIt"→"an arm-motion framework such as MoveIt"；补逆运动学步骤 | 批注 13「such as Moveit」、批注 14「inverse kinematics, be more precise」 |
| 13:22 | 解耦方案"simple"改为"built from components that are mature and widely deployed in industry" | 批注 15「Why is it simple? because it relies on established robust systems」 |
| 13:22 | 新增图 1.2 解耦 vs 全身对比 | 邮件第 2 条「Use also more figures, it is currently a huge wall of text」 |
| 13:22 | 删除"It is the framework integrated and evaluated in this work." | 批注 24「remove this sentence for now」 |
| 13:22 | `\paragraph{Objective.}` 等三处 → `\subsection` | 批注 25「you could go with a subsubsection」 |
| 13:22 | **新增表 1.1（需求 R1–R7）** | 批注 48「You haven't formulated the requirements thus making this sentence very arbitrary」 |
| 14:20 | em-dash 由 11 处减到 6 处 | 自查违反了 `style-guide.md`「每页至多 1 处」 |
| 15:38 | 全身规划定义句改为自带 `[Lynch2017ModernRobotics]` `[Haviland2022Holistic]` | **用户指出**引用不在第一句句尾；批注 20 钉的就是第一句 |
| 15:42 | 另两处断言句（"configuration exists"、"cannot be executed smoothly"）改为句尾自带引用 | 同上；并由 `MA_Hisham_469906.pdf` 实证：同导师带的论文几乎每个断言句句尾都有引用 |

## C. 第 2 章重写（13:40–13:49，15:42 二次修订）

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 13:44 | "The previous chapter argued"→"\Cref{ch:introduction} argues" | 批注 29「always write in present tense, the chapter still exists」 |
| 13:44 | 删除自称"systematic"的表述 | 批注 30「beware of using this term. This implies that you used an actual systematic methodology」 |
| 13:44 | 新增图 2.1 三轴维恩图 | 批注 33「a graphical representation would be great but optional. A Venn diagramm is cool there」 |
| 13:44 | "different families"→"different categories of algorithm" | 批注 34「categories?」 |
| 13:44 | "excel at"→"are effective at" | 批注 35「subjective, never use words like this in a thesis」 |
| 13:44 | 采样法补 `[Kavraki1996PRM]` `[LaValle2001RRT]` `[Sucan2012OMPL]` `[LaValle2006Planning]` | 批注 36「we're going to need sources for facts like these」 |
| 13:44 | 删除"one speaks of" | 批注 37「"one calls" is an absolute no-go」 |
| 13:44 | "myopic"改为解释性表述 | 批注 38「meaning?」 |
| 13:44 | "cheap and fast"→"cheaper to solve than an optimisation over a horizon of the same model" | 批注 39「Compared to what」、批注 40「never make absolute statements」 |
| 13:44 | "They"→"Learning-based schemes" | 批注 41「what is they in the sentence… even if it redundant」 |
| 13:44 | "Only online,…"改写 | 批注 42「What is only online」 |
| 13:44 | 新增图 2.2 滚动时域原理 | 批注 43「Now is a good time for showing a figure explaining how it works」 |
| 13:44 | 集成机制改引一手：`[wbcros]` `[wolfsetup]` `[Stelter2022OpenSource]` `[Stueben2021ConstraintWBC]` | 批注 44「Don't quote the literature review but state examples in the literature review」+ 邮件第 3 条 |
| 13:44 | 补 joint-state publisher | 批注 50「Joint-state publisher」 |
| 13:44 | "an open-source C++ library"→"a library written in C++" | 批注 45「written in」 |
| 13:44 | SLQ 段引用统一移到句尾 | 批注 46「put the citation at the end of the paragraph」 |
| 13:44 | 新增图 2.3 OCS2 结构图 | 批注 47「Use a figure?」 |
| 13:44 | 补 MoveIt Pro 闭源说明 + 新建 `[moveitpro]` 条目 | 批注 49「The WBMP implementation of MoveIt is closed source」 |
| 13:44 | 学习类改引一手：`[Honerkamp2023N2M2]` `[Jauhri2022Reachability]` `[Iriondo2023DRL]` `[Kang2024DoorOpening]` | 批注 51「again cite the direct source, not the review paper」 |
| 13:44 | "existing hardware stack"→"ROS~2 interfaces" | 批注 52「interfaces」 |
| 13:44 | 表 2.1 改为按 R1–R7 逐行打分 + 注明打分依据 | 批注 48；另回应 `REVIEW_2026-08-20.md` P1-10「定性打分无逐格依据」 |
| 13:35–14:05 | 图 2.1/2.2/2.3 排版反复修正（标签溢出圆、图例压轴标签、group 标签撞箭头标签） | 渲染 PNG 目视检查发现。维恩图标签越界属**内容错误**（把方法归到了错误的区域） |
| 15:42 | **删除**引言里介绍内部综述的整段 | **用户指令**：同事的未发表报告不得出现在论文里 |

## D. 参考文献重建（13:30–15:42）

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 13:30 | 全部条目过 Crossref 核对，`% VERIFY` 标记 12 → 0 | 邮件第 1 条；`REVIEW_2026-08-20.md` P0-2「12/18 条标 VERIFY，bib 头部自写不得提交」 |
| 13:30 | 纠正 `Sandakalum2022Survey`：Applied Sciences 12(21) → **Machines 10(2):97** | Crossref `10.3390/machines10020097` |
| 13:30 | 纠正 `Buckhorst2022LMAS` 标题 → *Decentralized Holonic Control System Model for LMAS* | Crossref `10.1016/j.rcim.2021.102301` |
| 13:30 | `Kern2019LMAS` 查无此文 → 换 `Kern2016Modular` | Crossref 检索无结果，改用可核实的 Procedia CIRP 57:327–332 |
| 13:30 | 新增 22 条一手文献（OCS2 谱系、采样法、QP-IK、学习类、MPC 理论） | 邮件第 1、3 条 |
| 15:36 | **拆成两个文件**：`References.bib`(43 已发表) + `sources-manual.bib`(13 手工维护) | 防止 Zotero 自动导出把仓库/手册/标准类条目静默清空 |
| 15:36 | `main.tex` 加 `\addbibresource{lit/sources-manual.bib}` | 同上 |
| 15:20 | 10 个机构作者条目加 `shorthand` 字段（`[INTE98]`→`[ISO 9283]` 等） | 模板 `SET_Bibliography.tex:22` 的标签模板首元素就是 `\field[final]{shorthand}`；`MA_Hisham_469906.pdf` 印的也是 `[ISO10]` 而非 `[INTE10]` |
| 15:25 | Hüttemann 拼写统一（`[HUET16]`/`[HÜTT19]` → 同一标签前缀） | 渲染参考页时发现同一人两个标签。Crossref 两条记录拼法不一致，手工归一并在 bib 里注明是有意偏离 |
| 15:35 | 新增 `Bergs2024EdgeComputing` | 导师给的 ScienceDirect 链接，PII `S2212827124003159` → `10.1016/j.procir.2024.07.006`，是他本人的 LMAS 论文 |
| 15:42 | **删除** `SantAnna2026WBMPReview` 条目 | **用户指令**：同事未发表报告不可引，且要防止误引 |

## E. 规则文档落地（14:20–15:43）

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 14:26 | 新建 `supervisor-requirements.md`（6 节，每条附触发它的原句） | **用户指令**「把老师的要求写入这个项目写论文的限制中去」 |
| 14:26 | `style-guide.md` 禁用词表补 excel/wonderful/great/impressive；新增"导师批注沿用规则"小节 | 批注 35、39、40、41、29、30 |
| 14:27 | 新建 `CLAUDE.md` | `.cursor/skills` 是 Cursor 的目录，Claude Code 不自动加载；不加这个文件规则在 Claude Code 里等于没写 |
| 14:51 | `thesis-writing/SKILL.md`、`related-literature-search/SKILL.md` 接线 | 同上 |
| 15:38 | 新建 `citation-workflow.md` | **用户提问**「我应该如何添加引用呢」+ 导师给的工具清单（IEEE/Scopus/…/Zotero/Citavi/JabRef/`\cite{treheux26}`/ORKG Ask/VOSviewer） |
| 15:38 | 实测并记录：`\citep` 在本模板未定义，编译失败 | 导师批注 46 建议用 `\citep`，但模板未传 `natbib=true`。实测报 `Undefined control sequence` |
| 15:43 | `CLAUDE.md` 新增三级优先级（模板 → 导师 → 项目约定） | **用户指令**「模板没有规定的地方，按照老师的要求来」 |
| 15:38 | `citation-workflow.md` 补对标数据（Hisham 论文 344 引用/122 页、`[ISO10]` 写法、不要学它引博客） | 用户提供 `MA_Hisham_469906.pdf` 作参照 |
| 15:43 | 四处文档同步改为"内部综述完全不可引" | **用户指令**（原先我写的是"只能引方法论+一句定位"，口子关死） |

---

## 未做 / 待定

| 项 | 状态 | 出处 |
|---|---|---|
| Ch3–6 溯源审查 | **本会话已做**（见下节 F） | 邮件第 1 条；HANDOFF Next Steps #5 |
| 拆分第 3 章 | **等你拍板**，结构性改动会动全书编号 | 批注 27「beefy chapter, might consider splitting」 |
| `Bergs2024EdgeComputing` / `Treheux2026TopicWBMP` 插入正文 | **忽略，不做**；bib 条目可留着不引用 | **用户指令 2026-09-10**「不重要」；勿再提起 |
| 英文摘要 | 未写，送审阻塞项 | `REVIEW_2026-08-20.md` P0-1 |
| 缩略语表 | 仍是模板自带 140 条无关条目且被注释 | `REVIEW_2026-08-20.md` P0-6 |
| 论文类型 PA vs MA | `main.tex` 写 PA，选题书写 Master's | `REVIEW_2026-08-20.md` P0-5 |
| Ch3 平台/握手图、Ch4 dummy 结果图 | 溯源审查标为 P1/P2，本会话未画 | 邮件第 2 条「wall of text」 |

---

## F. Ch3–6 溯源审查（16:22–16:35，Cursor）

审计基线：Ch1/Ch2 各约 30–37 处 `\cite`；Ch3–6 原先 4 / 5 / 1 / 1。实现章不以相关工作章的密度为目标，但方法主张、标准、外部工具与教科书定义必须有出处；本项目配置/测量/自建叙述不引。

| 时间 | 内容 | 原因 / 出处 |
|---|---|---|
| 16:25 | 新增 `Carpentier2019Pinocchio`、`Huttenlocher1993Hausdorff`、`Dubuisson1994ModifiedHausdorff`、`Moore2015RobotLocalization`（均 Crossref 核对） | Ch3/4 Pinocchio、Hausdorff；Ch6 EKF/`robot_localization`；邮件第 1、5 条 |
| 16:25 | `sources-manual.bib` 新增 `CppAD`、`Chrony`、`twistMux` | Ch3 自动微分 / 对时 / twist 仲裁；无 DOI，手维 |
| 16:28 | **Ch3**：非完整/差速、OCS2 MPC–MRT、SLQ、barrier、Pinocchio、CppAD、Chrony、Zenoh/DDS、`twist_mux`、JTC；三处工具引用移到句尾；弱化 absolute/主观措辞 | 邮件第 1 条；批注 46 位置规则；`supervisor-requirements.md` §1–4 |
| 16:30 | **Ch4**：dummy/`ocs2Toolbox`、MPC 残差、Nav2+MoveIt、Hausdorff+修正型、Pinocchio、$e_o$、ISO APₚ/Table~3/cl.~8.2/dwell 模式、MoveIt `bent`、表注与图注 | 同上；批注 12/20 类「公式/定义也要引」 |
| 16:32 | **Ch5**：ISO 9283、UR10e 跟随误差、freeMoVe 加速度限、Nav2+MoveIt 评价缺口；「systematic bias」→「consistent bias」 | 邮件第 1 条；批注 30 慎用 systematic |
| 16:33 | **Ch6**：ISO / UR10e / freeMoVe / Nav2+MoveIt / Zenoh / feedback policy；「standard next step」改为「direct next step」+ `Moore2015`；「preceding chapters have」→ 现在时 | 批注 29 现在时；邮件第 1 条 |
| 16:35 | 编译 exit 0，undefined 0，**57→59 页**，bbl **53→61**；cite 计数 Ch3 **4→17**，Ch4 **5→20**，Ch5 **1→5**，Ch6 **1→11** | 本会话验证 |

**刻意未做（等拍板）：** 新画 Ch3 平台/握手 TikZ、Ch4 dummy 结果曲线、拆分第 3 章。

**已否决（勿再提起）：** 向正文插入 `Bergs2024EdgeComputing` / `Treheux2026TopicWBMP`（用户 2026-09-10）。
