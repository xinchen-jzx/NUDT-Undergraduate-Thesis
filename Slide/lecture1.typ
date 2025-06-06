#import "@preview/touying:0.6.1": *
#import "shahe.typ": *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import "../algo.typ": algo, i, d, comment, code
#import cosmos.clouds: *
#show: show-theorion

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

#show: university-theme.with(
  aspect-ratio: "16-9",
  // align: horizon,
  // config-common(handout: true),
  config-common(frozen-counters: (theorem-counter,)),  // freeze theorem counter for animation
  config-info(
    title: [基于 RISC-V 存算一体芯片的编译器关键技术研究],
    subtitle: [],
    author: [答辩人：简泽鑫],
    date: datetime.today(),
    institution: [指导老师：曾坤],
    logo: "images/logo.png",
    email: "jianzexin21@nudt.edu.cn",
    landing: "images/landing.jpg",
    seclanding: "images/section.jpg"
  ),
)

// #set heading(numbering: numbly("{1}.", default: "1.1"))

#title-slide()

== 本章目录 <touying:hidden>

#components.adaptive-columns(outline(title: none, indent: 1em))

= 研究背景与问题

== 研究背景

- AI 技术兴起和广泛应用

- #text(fill: yellow, "数据密集型")应用的兴起暴露了传统以处理器为中心的#text(fill: yellow, "冯诺依曼架构")的#text(fill: yellow, "局限性")，这些架构难以满足片外存储器带宽需求

- 存内/近存计算架构越来越得到人们的关注，逐步走向商业化
  - Neurocube，ISAAC，Microsoft Brainwave NPU 等

#figure(
  image("../images/CIM-Simplify.png", width: 80%), 
)

#figure(
  image("../images/CIM.png", width: 65%), 
)

- CIM 架构对编译器技术提出了新的挑战

#figure(
  image("../images/CIM-Compiler.png", width: 70%), 
)

= 面向 RISC-V 存算一体芯片的编译器

#figure(
  image("../images/overview.png", width: 35%),
)

= NPU 指令的智能识别



= 指令调度

== 静态指令调度

基于表调度（List Scheduling）设计一种的静态指令调度策略：

1. 调度候选生成：
  - 构建 DAG（有向无环图）表示基本块中所有机器指令；
  - 计算每条指令的依赖关系（数据依赖和调度顺序约束）；
  - 对于所有入度为 0 的指令（无前驱），将其加入就绪队列（ready list）。
2. 调度选择逻辑（核心）：
  - 每次从 ready list 中选择一条指令调度；
  - 若存在无依赖的 NPU 指令，优先调度该 NPU 指令；
  - 否则，采用标准的表调度优先级策略进行调度（如critical path、latency、资源利用等）。

> 闭包

#pagebreak()

#figure(
  image("../images/code.png", width: 40%),
)

== 动态指令调度

#figure(
  image("../images/runtime.png", width: 80%),
) <Runtime>

= 编译器测试与分析

== 实验参数设置

- 在本次实验中，我们采用了一个自定义设计的 FASHION-MNIST 网络模型进行研究，该模型专门针对 FASHION-MNIST 数据集进行了训练优化

#figure(
  table(
  columns: 2,
  stroke: (x: none),
  align: horizon,

  [*层类型*], [*核尺寸/步长*],

  [*Conv*],
  [$3 * 3$/$1, 1$],

  [*Conv*],
  [$3 * 3$/$1, 1$],

  [*MaxPool*],
  [$2 * 2$/$2, 2$],

  [*Conv*],
  [$3 * 3$/$1, 1$],

  [*MaxPool*],
  [$2 * 2$/$2, 2$],

  [*Flatten*],
  [-],

  [*Full_Connect*],
  [-],

  [*Full_Connect*],
  [-],

  [*LogSoftmax*],
  [-],
), caption: [自定义 FASHION MNIST 网络模型结构]
)

#figure(
  image("../images/ONNX-Display.png", width: 70%), 
)

== 实验结果分析

- 通过本文编译器编译 ONNX 模型和使用 Python 模拟该网络模型，其每一层的输出以及最终输出的计算结果一致

#let t6-1 = table(
  columns: 1,
  [
    ```txt
    * * * * Performance Analysis * * * * 
    NPU work ratio: 61%
      Off-chip Transfer ratio: 41%
      Tensor Manipulate ratio: 2%
      Matrix Processing ratio: 9%
      Vector Processing ratio: 11%
    CIM Analysis
      CIM Compute ratio: 3.7%
      CIM Space Utilization: 69.9%
      CIM Utilization: 2.6%
      Effective Performance: 26.739GOPS @INint8-Wint8
    ```
  ],
)

#align(
  center,
  [
    #t6-1
  ],
)

#pagebreak()

#let t6-2 = table(
  columns: 1,
  [
    ```txt
    * * * * Power Analysis * * * *
    - - - - NPU Level - - - - 
      Spad R/W energy cost: 3491064.32pJ, ratio:44%
      PE vector energy cost: 1.11pJ, ratio:0%
      CIM R/W energy cost: 1295134.72pJ, ratio:16%
      CIM compute energy cost: 3120578.56pJ, ratio:39%
      NPU energy cost: 7906778.71pJ
      CIM Compute Energy Efficiency: 12.5TOPS/W
      NPU Energy Efficiency: 4.93TOPS/W @INint8-Wint8
    - - - - System Level - - - - 
      NPU ENERGY NPU energy cost: 7906778.71pJ, ratio:9%
      CPU ENERGY CPU energy cost: 0pJ, ratio:0%
      Off-chip ENERGY pSRAM energy cost: 75476480pJ, ratio:91%
      Energy Efficiency
        Total energy cost: 83383258.71pJ
        Total Energy Efficiency: 0.47TOPS/W @INint8-Wint8
    ```
  ],
)

#align(
  center,
  [
    #t6-2
  ],
)

- 实验选取了神经网络中比较常见的 $20$ 种算子在 RISC-V 存算一体模拟器中来评估 NPU 核心的性能表现，深度学习常见的算子的分类如下所示

#figure(
  table(
  columns: 2,
  stroke: (x: none),
  align: horizon,

  [*算子类别*], [*举例*],

  [*逐元素操作算子*],
  [Add, Multiply, Equal, And, Quantization],

  [*乘累加算子*],
  [Conv, GEMM, Full_Connect],

  [*激活函数算子*],
  [Exp, Sigmoid, Tanh, ReLu, Leaky_ReLu, Softmax],

  [*归一化算子*],
  [Layer_Normalization],

  [*数据排布算子*],
  [ReduceMax, ArgueMax, Transpose, Clip, Max_Pooling],
), caption: [测试算子类别表]
)

#figure(
  image("../plot/result.png", width: 70%),
)

= 总结与展望

== 研究总结

1. 面向 RISC-V SRAM 存算一体芯片修改 LLVM 编译器，实现了对存算指令的支持
  - 包括但不限于对指令集的扩展、内存模型的适配、NPU 指令的智能识别、指令调度以及优化策略的调整等
2. 智能识别 NPU 加速指令
  - 在 LLVM IR 中间表示上进行应用特征分析，识别出可加速的 LLVM IR 范式，以自动将它们卸载到 CIM 加速器的 NPU 核心进行加速计算，转为特定的 RISC-V 加速指令，充分利用 RISC-V 通用核心、NPU 加速核心的高效能特征
3. 指令调度
  - 在 CPU 和 NPU 异构计算单元之间进行指令的静态和动态调度

== 研究展望

本文编译器未来仍有改进空间：

1. 可探索更高效的算法和策略，以获取更高的计算效率和更低的内存占用，例如引入机器学习算法智能来地决策算子融合的顺序和程度等。

除了具体的技术完善方向外，本文的研究也在更广泛的层面上为我国 RISC-V 芯片产业的发展提供了积极价值：

- 推动国产 RISC-V 架构芯片软件生态建设
    
- 构建具有自主知识产权的 AI 编译器核心技术

= 请各位老师批评指正！