# 导师批注清单（mini-thesis-v1.pdf, 52 条）

提取自 PDF 注释。`HL` = 被高亮的原文，`→` = 导师批注。

## 邮件要点

1. 每一条不是显而易见的陈述都要给出处（source）。
2. 多加图，现在全是文字墙。
3. 综述（SLR）里的事实要引原始论文，不要引综述本身；综述只是检索起点。

---


### PDF p.1

- **HL:** “[Xiangming You] [Matriculation No.440593]”  
  → No need for the brackets

### PDF p.4

- **HL:** “II List of Figures”  
  → We're missing a lot of figures

### PDF p.6

- **HL:** “Manufacturing is increasingly shaped by short product life cycles, high variant diversity, and volatile demand.”  
  → Find a source for this statement
- **HL:** “The Line-less”  
  → that's not a new paragraph
- **HL:** “one such paradigm”  
  → avoid this formulation
- **HL:** “The Line-less Mobile Assembly System (LMAS) is one such paradigm studied at the Laboratory for Machine Tools and Production Engineering (WZL)”  
  → While this statement is true please talk about flexible manufacturing systems in a more generalistic manner
- **HL:** “The assembly “line” is dissolved into a dynamically reconfigurable constellation of resources that are matched to the current order at run time. This yields a spatially and temporally flexible production system that can absorb product changes, demand fluctuations, and disturbances without a physical relayout.”  
  → You're missing a source
- **HL:** “cover.”  
  → add a picture of mobile manipulators, helps the reader.

### PDF p.7

- **HL:** “This freedom”  
  → The addition of degrees of freedom to the system
- **HL:** “Large, base-dependent workspace. The target end-effector pose may lie outside the reach of the arm from the current base pose, so the base and the arm must cooperate to accomplish a single task.”  
  → Excellent
- **HL:** “Changing, shared environment. Resources move relative to one another; the environment is neither static nor fully known in advance, so trajectories cannot be fully pre-computed offline.”  
  → Not necessarily true
- **HL:** “mobile base combined with a six-degree-of-freedom (6 DOF) arm is highly redundant with respect to an end-effector task.”  
  → How many degrees of freedom are added? How do they introduce a redundancy? Grubler's formulae can be good to demonstrate your fact.
- **HL:** “MoveIt”  
  → such as Moveit
- **HL:** “a trajectory for”  
  → inverse kinematics, be more precise
- **HL:** “This decoupled scheme is simple, modular, and reuses mature, well-tested components,”  
  → Why is it simple? because it relies on established robust systems that are prevalent in industry
- **HL:** “The decoupling, however, has intrinsic limitations that become severe in the LMAS setting:”  
  → The sentence sounds llm generated but is actually good to introduce the problematic
- **HL:** “end-effector target unreachable, even though a jointly chosen base–arm configuration exists.”  
  → Cite more sources

### PDF p.8

- **HL:** “the arm’s reach (a common LMAS case) cannot be executed smoothly this way.”  
  → Source again
- **HL:** “fixed base pose, cannot react to base drift, moving obstacles, or an updated target without re-triggering the whole pipeline.”  
  → I am sure of the existence of adaptive frameworks which could work.
- **HL:** “Whole-body motion planning removes this artificial boundary by treating the mobile base and the arm as a single redundant kinematic (or dynamic) system and planning their motion in one unified optimisation.”  
  → Wonderful statement, where is it defined? A robotics book such as Modern Robotics can be cited here.
- **HL:** “once embedded in a feedback loop, the plan reacts continuously to a changing target and environment.”  
  → Not quite trivial
- **HL:** “mobile manipulation.”  
  → How so?
- **HL:** “differential-drive”  
  → mobile base in general
- **HL:** “It is the framework integrated and evaluated in this work.”  
  → remove this sentence for now
- **HL:** “Objective.”  
  → I quite like that you formulated a dedicated paragraph, but you could go with a subsubsection

### PDF p.9

- **HL:** “the selection of a suitable whole-body motion-planning approach for the HERo platform, fol- lowing a comparison of candidate frameworks (Chapter 2);”  
  → good
- **HL:** “the integration of OCS2 whole-body MPC into the HERo software stack, including a distributed host/on-board architecture for real-time operation, the whole-body model and its parameteri- sation, and the hardware and ROS-control interfaces (Chapter 3);”  
  → beefy chapter, might consider splitting
- **HL:** “Structure.”  
  → redundant with scope and contributions, but I let it pass

### PDF p.10

- **HL:** “argued”  
  → always write in present tense, the chapter still exist
- **HL:** “systematic”  
  → beware of using this term. This implies that you used an actual systematic methodology
- **HL:** “[SAND22; THAK23]”  
  → Interesting, I'll have to read these
- **HL:** “A whole-body scheme instead treats the base and the arm as a single redundant”  
  → Where do you get this fact from
- **HL:** “distinguish approaches primarily by how the base and the arm are coupled and by the algorithmic principle used to generate motion; a third, practical axis concerns where the computation happens in time.”  
  → a graphical representation would be great but optional. A Venn diagramm is cool there

### PDF p.11

- **HL:** “different families”  
  → categories?
- **HL:** “excel”  
  → subjective, never use words like this in a thesis
- **HL:** “These methods excel at finding feasible paths in cluttered, high-dimensional spaces but do not natively optimise a running cost and are typically used offline.”  
  → we're going to need sources for facts like these
- **HL:** “When the optimisation is solved once, offline, over a full trajectory, one speaks of trajectory optimization;”  
  → &quot;one calls&quot; is an absolute no-go. Reformulate the sentence with trajectory optimisation
- **HL:** “myopic,”  
  → meaning?
- **HL:** “They are cheap and fast”  
  → Compared to what
- **HL:** “ple”  
  → never make absolute statements in a thesis, always use comparisons, as everything is relative
- **HL:** “They”  
  → what is they in the sentence, reuse learning based schemes, even if it redundant
- **HL:** “Only online,”  
  → What is only online

### PDF p.12

- **HL:** “In practice, the mature, deployable representatives of this class are almost exclusively optimization-based, because expressing the task in a cost function and the physical restrictions as constraints maps naturally onto the coupled, redundant, and constrained nature of the mobile-manipulation problem.”  
  → Now is a good time for showing a figure explaining how it works
- **HL:** “optimal- control formulations—and the OCS2 toolbox in particular—recur as a common backbone, alongside operational-space control, quadratic-program solvers, and, more recently, learned policies [SANT26].”  
  → Don't quote the literature review but state examples in the literature review
- **HL:** “open-source C++ library”  
  → written in
- **HL:** “[FARS17].”  
  → put the citation at the end of the paragraph, there is a latex option such as \\citep for that normally
- **HL:** “Three features make OCS2 well suited to whole-body mobile manipulation. First, it derives the cost and constraint derivatives that the solver needs by automatic differentiation: the user supplies the model (kinematics, cost terms, constraints) symbolically, and OCS2 generates and compiles eﬀicient derivative code via CppAD/CppADCodeGen. Second, it exposes a reference manager that lets the desired task-space trajectory be updated online, which is exactly the interface a target-generating node needs in order to steer the controller.”  
  → Use a figure?

### PDF p.13

- **HL:** “This track record on hardware, its explicit constraint handling, and its process-separable architecture make it the primary candidate for the HERo platform.”  
  → You haven't formulated the requirements thus making this sentence very arbitrary
- **HL:** “Sampling-based planning (MoveIt).”  
  → The WBMP implementation of MoveIt is closed source
- **HL:** “cmd_vel/goal topics”  
  → Joint-state publisher

### PDF p.14

- **HL:** “A growing body of work hybridises classical navigation with reinforcement learning to amortise the online cost of whole-body planning, learning policies that map observations directly to base and arm commands [SANT26].”  
  → again cite the direct source, not the review paper
- **HL:** “hardware stack.”  
  → interfaces
