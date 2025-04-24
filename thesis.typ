#import "thesis-template.typ": *
#import "templates/i-figured.typ"
#set heading(numbering: "1.")
#show heading: i-figured.reset-counters.with(extra-kinds: ("atom",))
#show figure: i-figured.show-figure.with(extra-prefixes: (atom: "atom:"))
#show math.equation: i-figured.show-equation

#show figure: it => {
    set text(size: 10.5pt)
    it
    v(-1em)
    box()
}

#show math.equation: set text(font: "TeX Gyre Termes Math")

#show math.equation.where(block: true): it => {
    set text(size: 10.5pt)
    it
    v(-1em)
    box()
}

#show figure.where(kind: table): it => [
  #set figure.caption(position: top)
  #it
]
// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "基于RISC-V存算一体芯片的编译器关键技术研究",
  name: "简泽鑫",
  idnum: "202102001019",
  major2: "无", 
  major1: "计算机科学与技术（计算机系统）", 
  college: "计算机学院",
  grade: "2021级", 
  advisor: "曾坤",
  jobtitle: "副研究员",
  unit: "计算机学院微电子与微处理器研究所"
)

// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

= 引言

== 研究背景及意义

=== 研究背景

随着人工智能（AI）和大数据应用的迅猛发展，计算需求呈指数级增长，传统的计算架构面临严峻挑战。特别是冯诺依曼架构由于其数据在存储和计算单元之间频繁传输，导致数据移动成为性能瓶颈，限制了系统的整体效率。为了解决这一问题，存算一体（Compute-In-Memory，CIM）架构应运而生，通过将计算功能集成到存储单元中，显著减少数据传输量，从而突破冯诺依曼瓶颈，提升系统性能和能效。

同时，RISC-V作为一种开放、可扩展的指令集架构（Instruction Set Architecture，ISA），凭借其完全开源、模块化设计和强大的可定制性，已成为构建存算一体芯片的首选。然而，基于RISC-V构建的存算芯片具有异构、碎片化的特点，这就要求开发者面向不同存算架构开发多个版本的应用，开发效率低、部署难。因此，如何实现将软件操作（包括计算、数据通信等）和硬件配置（如异构计算单元、存储层次等）解耦，以便AI应用开发不再依赖存算IP设计，是解决“编程墙”的关键问题。

不仅如此，AI应用的不规则的发展趋势和存算芯片的异构化、碎片化的现状，使得我们需要探索新的动态编译优化方法，这种优化方法既需要能够充分的考虑到AI应用的动态变化的特质，又需要能够充分的挖掘未来存算芯片的架构特征。通过动态编译优化，可以实时调整编译策略，使得生成的代码能够更好地适应硬件的运行环境，提高计算效率和资源利用率。

故，本课题将面向RISC-V存算芯片修改LLVM编译器，实现对存算指令的支持。通过深入研究LLVM编译器架构和工作原理，分析RISC-V存算一体芯片的特性，探索如何在LLVM中添加对RISC-V CIM的支持。这包括但不限于对指令集的扩展、内存模型的适配以及优化策略的调整等，以实现应用算子的自动映射和正确指令流的生成，从而更好地协调计算部件，挖掘芯片内部的计算并行性，为RISC-V存算一体芯片提供有力的编译支持。

#figure(image("images/sichuan-highway.jpg"), caption: "凌霄宝殿的建筑设计图")

== 国内外研究现状

=== 深度学习编译器

=== 深度学习加速器

=== RISC-V

== 论文的主要研究工作

== 论文章节安排

#pagebreak()

= 相关工作

凌霄宝殿作为天界的核心建筑，其建设与维护不仅关乎天界形象，更与天界可持续发展息息相关。近年来，随着天界人口增长和经济发展，凌霄宝殿周边环境压力日益增大，环境问题逐渐凸显。为实现天界可持续发展，必须将环境保护理念融入凌霄宝殿建设与维护的全过程

== 神经网络

== 深度学习编译器

在凌霄宝殿选址阶段，应优先选择环境承载力强、生态敏感性低的区域，避开珍稀动植物栖息地和生态脆弱区。规划设计应遵循生态优先原则，合理布局功能区，预留生态廊道，构建人与自然和谐共生的空间格局。



#figure(
  table(
  columns: 3,
  stroke: (x: none),
  align: horizon,

  [], [*High Neuroticism*], [*Low Neuroticism*],

  [*High Agreeableness*],
  table.cell(stroke: orange + 2pt)[
    _Sensitive_ \ Prone to emotional distress but very empathetic.
  ],
  [_Compassionate_ \ Caring and stable, often seen as a supportive figure.],

  [*Low Agreeableness*],
  [_Contentious_ \ Competitive and easily agitated.],
  [_Detached_ \ Independent and calm, may appear aloof.],
), caption: [Neuroticism and Agreeableness]
)

== LLVM简介

== 计算图优化研究

优先选用环保建材，减少对环境的污染。推广使用可再生能源，如太阳能、风能等，降低能源消耗。施工过程中应采取有效措施控制扬尘、噪音、废水等污染，最大限度减少对周边环境的影响。建立健全凌霄宝殿环境保护管理制度，明确责任主体，加强日常巡查和维护，及时发现和处理环境问题。推广使用节能环保设备，减少能源消耗和污染物排放。

注重生态修复与景观营造相结合，在凌霄宝殿周边建设生态绿地、湿地公园等，增加绿化面积，提升环境质量。选择适宜的植物种类，构建稳定的生态系统，发挥其净化空气、调节气候、美化环境等功能。 建立完善的环境监测体系，定期对凌霄宝殿周边环境进行监测，评估环境质量变化趋势，为环境管理提供科学依据。加强环境保护宣传教育，提高天界居民的环保意识，鼓励公众积极参与凌霄宝殿环境保护工作。

Let $a$, $b$, and $c$ be the side
lengths of right-angled triangle.
Then, we know that:
$ a^2 + b^2 = c^2 $

Prove by induction:
$ sum_(k=1)^n k = (n(n+1)) / 2 $

== 本章小结


#pagebreak()

= 计算图算子自动调度器

#pagebreak()

= 基于RISC-V存算一体芯片的编译器后端设计

#pagebreak()

= 编译器测试与分析

#pagebreak()

= 总结与展望

== 本文的工作总结


== 未来的工作展望