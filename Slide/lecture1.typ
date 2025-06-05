#import "@preview/touying:0.6.1": *
#import "shahe.typ": *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: node, edge
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
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

== 研究问题

Insight of this work:

1. 数据搬运瓶颈
  - CIM 加速核的高吞吐来源于阵列内原位乘累，但频繁的片外/片上 SRAM 与通用 CPU 之间往返传输会大幅耗时耗能
2. 针对 CIM 架构的指令级特化与调度优化

= 面向 RISC-V 存算一体芯片的编译器

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

= 总结与展望

== 研究总结

#slide(composer: (1fr, 1fr))[
  First column.
][
  Second column.
]


== 研究展望

本文编译器未来仍有改进空间：

1. 可探索更高效的算法和策略，以获取更高的计算效率和更低的内存占用，例如引入机器学习算法智能来地决策算子融合的顺序和程度等。

除了具体的技术完善方向外，本文的研究也在更广泛的层面上为我国 RISC-V 芯片产业的发展提供了积极价值：

- 推动国产 RISC-V 架构芯片软件生态建设

- 构建具有自主知识产权的 AI 编译器核心技术

= 请各位老师批评指正！


#show: appendix

= Appendix

== Appendix

Please pay attention to the current slide number.