#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "templates/i-figured.typ"
#import "templates/bilingual-bibliography.typ"
#show: show-cn-fakebold
#let tnr = "Times New Roman"
#let fsong = (tnr, "FangSong")
#let song = (tnr, "SimSun")
#let hei = (tnr, "SimHei")

#let project(title: "", name: "", idnum: "", major1: "", major2: "", college: "", grade: "", advisor: "", jobtitle: "", unit:"", sn: "", paper-type: "公开", blind-review: false, body) = {
  show strong: it => {
    show-cn-fakebold(it)
  }
  // Set the document's basic properties.
  // set document(title: title)
  counter(page).update(0)
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 20mm),
    paper: "a4"
  )
  set text(font: ("TeX Gyre Termes Math", "SimSun"), lang: "zh")
  show regex("[\u0025]"): set text(font: "Times LT Pro")
  // Flag (can be commented)
  // text(font: "SimHei", size: 16pt)[附件3]
  // Or 
  v(-16pt)
  context [
    #if blind-review {
      grid(columns: (1fr, 1fr), [#align(left)[#show-cn-fakebold[#text(font: song, size: 14pt)[编号：#underline(extent: 1em, offset: 3pt, stroke: (thickness: 0.5pt))[#h(1em)#text("                                     ")#h(1em)]]]]], [#align(right)[#show-cn-fakebold[#text(font: song, size: 14pt)[密级：#underline(extent: 2em, offset: 3pt, stroke: (thickness: 0.5pt))[#h(2em)公开#h(2em)]]]]])
    } else {
      grid(columns: (1fr, 1fr), [#align(left)[#show-cn-fakebold[#text(font: song, size: 14pt)[编号：#underline(extent: 1em, offset: 3pt, stroke: (thickness: 0.5pt))[#h(1em)#sn#h(1em)]]]]], [#align(right)[#show-cn-fakebold[#text(font: song, size: 14pt)[密级：#underline(extent: 2em, offset: 3pt, stroke: (thickness: 0.5pt))[#h(2em)#paper-type#h(2em)]]]]])
    }
  ]
  // Space
  v(69pt)
  v(20pt)
  // Title row.
  align(center)[
    #block(text(size: 30pt)[*本 科 毕 业 论 文*])
  ]
  // Space
  v(100pt)
  align(center)[
    #grid(columns: (3.53fr, 10.82fr), row-gutter: 5pt, 
    [#text(weight: "bold", size: 16pt)[*课题名称：*]], [#show-cn-fakebold[#text(weight: "bold", font: fsong, size: 16pt)[#title]]], [], [#line(length: 100%, stroke: (thickness: 0.5pt))])
  ]
  v(73.5pt)
  // Author information.
  grid(
    columns: (0.22fr, 0.29fr, 0.22fr, 0.29fr),
    rows: (14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "学员姓名")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, name))
      }],
    [#text(size: 14pt, font: song, tracking: 56pt, "学号")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: tnr, ""))
      } else {
        align(center, text(size: 14pt, font: tnr, idnum))
      }
    ],
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    // align(center, text(size: 14pt, font: fsong, major1)),
    [#text(size: 14pt, font: song, "首次任职专业")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, major2))
      }
    ],
    text(size: 14pt, font: song, "学历教育专业："),
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, major1))
      }
    ],
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "命题学院")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, college))
      }
    ],
    [#text(size: 14pt, font: song, tracking: 56pt, "年级")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, grade))
      }
    ],
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "指导教员")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, advisor))
      }
    ],
    [#text(size: 14pt, font: song, tracking: 56pt, "职称")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, jobtitle))
      }
    ],
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(-12pt)
  grid(
    columns: (0.22fr, 0.80fr),
    rows: (14pt, 15pt, 8pt),
    text(size: 14pt, ""),
    text(size: 14pt, ""),
    [#text(size: 14pt, font: song, tracking: 9pt, "所属单位")#text(size: 14pt, font: song)[：]],
    context [
      #if blind-review {
        align(center, text(size: 14pt, font: fsong, ""))
      } else {
        align(center, text(size: 14pt, font: fsong, unit))
      }
    ],
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(120pt)
  align(center)[#text(font: hei, size: 16pt)[国防科技大学教育训练部制]]
  pagebreak()
  set page(header: context {
  if counter(page).get().first() > 1 [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})
  // Main body.
  // show par: set block(spacing: 6pt) // for older typst version
  set page(header: [
    #set par(spacing: 6pt)
    #align(center)[#text(size: 9pt)[国防科技大学本科毕业论文]]
    #v(-0.3em)
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.3em)
    #line(length: 100%, stroke: (thickness: 0.5pt))
])
  set par(spacing: 6pt)
  set par(justify: true, leading: 6pt, first-line-indent: 2em)
  let preface-outline = state("preface-outline", false)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("I")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ], numbering: (..n) => context {
  if preface-outline.get() {
    numbering("i", ..n)
  } else {
    numbering("1 / 1", ..n)
  }
})

  align(center)[#text(size: 16pt, font: hei)[目#h(1em)录]]
  v(-8pt)
  set text(size: 12pt)
  set par(leading: 1em, spacing: 1em)
  show outline.entry: it => {
    set par(first-line-indent: 0em)
    let seq = it.body()
    let element = it.element.body
    let prefix = it.prefix()
    // [#prefix #it.page()]
    // v(0.5em)
    // let cname = seq.remove(0)
    [#h(2em)#prefix#h(1em)#it.element.body #box(width: 1fr, it.fill) #it.page()
    ]
  }
  show outline.entry.where(level: 6): it => {
    set par(first-line-indent: 0em)
    preface-outline.update(true)
    let ebody = it.element.body
    [#text(weight: "regular")[#it.element.body] #box(width: 1fr, it.fill) #it.page()
    
    ]
    preface-outline.update(false)
  }
  show outline.entry.where(level: 7): it => {
    set par(first-line-indent: 0em)
    let loc = it.element.location()
    let page_n = loc.page-numbering()
    [#it.element.body #box(width: 1fr, it.fill) #it.page()
    
    ]
  }
  show outline.entry.where(level: 1): it => {
    set par(first-line-indent: 0em)
    let ele = it.body()
    let seq = it.element
    // let cname = seq.remove(0)
    [第#it.prefix() 章#h(1em)#ele #box(width: 1fr, it.fill) #it.page()
    
    ]
  }
  show outline.entry.where(level: 2): it => {
    set par(first-line-indent: 0em)
    let ele = it.body()
    let seq = it.element.numbering
    // let cname = seq.remove(0)
    let prefix = it.prefix()
    [#h(1em)#prefix#h(1em)#it.element.body #box(width: 1fr, it.fill) #it.page()
    ]
  }
  outline(title: "", indent: 1em)
  pagebreak()
  
  set heading(numbering: "1.1")
  counter(heading).update(0)
  show heading.where(
    level: 6
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "bold")
    #let cur = counter(heading).display()
    #it.body
  ]
  show heading.where(
    level: 7
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #it.body
  ]

  counter(page).update(1)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("i")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  set par(spacing: 18pt)

  // align(center)[#text(size: 16pt, font: hei)[摘#h(1em)要]]
  heading([摘#h(1em)要], level: 6)
  v(16pt)
  text(font: song, size: 12pt)[
    SRAM 存算一体架构可以有效减少数据的无效搬运，具备突破冯诺依曼架构瓶颈的潜力。由于 RISC-V 指令集具有开源开放、扩展性强等优势，已经逐渐成为构建存算一体芯片的首选。然而，基于 RISC-V 构建的存算芯片具有异构、碎片化的特点，这就要求开发者面向不同存算架构开发多个版本的应用，开发效率低、部署难。因此，如何实现将软件操作（包括计算、数据通信等）和硬件配置（如异构计算单元、存储层次等）解耦，以便 AI 应用开发不再依赖存算 IP 设计，是解决“编程墙”的关键问题。

    不仅如此，AI应用的不规则的发展趋势和存算芯片的异构化、碎片化的现状，使得我们需要探索新的动态编译优化方法，这种优化方法既需要能够充分的考虑到AI应用的动态变化的特质，又需要能够充分的挖掘未来存算芯片的架构特征。通过动态编译优化，可以实时调整编译策略，使得生成的代码能够更好地适应硬件的运行环境，提高计算效率和资源利用率。

    因此本研究致力于解决上述难题，将面向 RISC-V SRAM 存算一体芯片修改 LLVM 编译器，实现对存算指令的支持，这包括但不限于对指令集的扩展、内存模型的适配、NPU 指令的智能识别、指令调度以及优化策略的调整等。通过对应用程序进行应用特征分析，识别出可以加速的计算部分，并转为特定的 RISC-V 加速指令，充分利用 RISC-V 已有指令集实现在执行 AI 任务运行时对各类计算资源的灵活调度，充分发挥SRAM存算一体阵列高能效、高算力密度的硬件优势。

    通过测试表明，本文实现的编译器能够对预训练神经网络模型进行优化、将应用算子自动映射到具有不同IP设计的加速部件，根据不同芯片架构特征生成正确的指令流来协调各个计算部件，挖掘芯片内部的计算并行性以及基于目标体系结构的代码生成。
  ]
  v(0pt)
  text(font: hei, size: 12pt)[关键词：]
  text(font: song, size: 12pt)[深度学习编译器；LLVM 编译器；调度器；存算一体]

  pagebreak()
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("i")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  // align(center)[#text(size: 16pt, font: tnr, weight: "bold", "ABSTRACT")]
  heading([ABSTRACT], level: 6)
  v(16pt)
  text(font: song, size: 12pt)[
    The SRAM _Computing-in-Memory_ (CIM) architecture can effectively reduce the ineffective transfer of data and has the potential to break through the bottleneck of the von Neumann architecture. Due to the advantages of open source and strong scalability of the RISC-V instruction set, it has gradually become the first choice for building computing-in-memory chips. However, the computing-in-memory chips built on RISC-V are heterogeneous and fragmented, which requires developers to develop multiple versions of applications for different storage-computing architectures, which is inefficient and difficult to deploy. Therefore, how to decouple software operations (including computing, data communication, etc.) and hardware configurations (such as heterogeneous computing units, storage levels, etc.) so that AI application development no longer relies on computing-in-memory IP design is the key issue in solving the "programming wall".

    Not only that, the irregular development trend of AI applications and the heterogeneous and fragmented status of computing-in-memory chips require us to explore new dynamic compilation optimization methods, which need to fully consider the dynamic characteristics of AI applications and fully explore the architectural characteristics of future computing-in-memory chips. Through dynamic compilation optimization, the compilation strategy can be adjusted in real time, so that the generated code can better adapt to the hardware operating environment and improve computing efficiency and resource utilization.

    Therefore, this project is committed to solving the above problems. The LLVM compiler will be modified for RISC-V SRAM CIM chips to support CIM instructions, including but not limited to the expansion of the instruction set, the adaptation of the memory model, the intelligent identification of NPU instructions, instruction scheduling, and the adjustment of optimization strategies. By analyzing the application characteristics of the application, the computing parts that can be accelerated are identified and converted into specific RISC-V acceleration instructions, and the existing RISC-V instruction set is fully utilized to realize the flexible scheduling of various computing resources when executing AI tasks, giving full play to the hardware advantages of the high energy efficiency and high computing density of the SRAM storage and computing integrated array.

    Experimental results shows that the compiler implemented in this paper can optimize the pre-trained neural network model, automatically map the application operator to the acceleration component with different IP designs, generate the correct instruction stream according to the characteristics of different chip architectures to coordinate the various computing components, explore the computing parallelism inside the chip, and generate code based on the target architecture.
  ]
  v(0pt)
  text(font: hei, size: 12pt, weight: "bold")[KEY WORDS: ]
  text(font: song, size: 12pt)[Deep Learning Compiler, LLVM Compiler, Scheduler, Computing in Memory]
  pagebreak()

  counter(page).update(1)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("1")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  // align(center)[#text(size: 16pt, font: hei)[前#h(1em)言]]
  // heading([前#h(1em)言], level: 6)
  // v(16pt)
  // set par(spacing: 12pt, leading: 1em)

  // text(font: song, size: 12pt)[
  //   前言内容。

  //   前言第二段。

  //   前言第三段。
    
  //   ]
  
  // set heading(numbering: "1.1")
  // counter(heading).update(0)
  show heading.where(
    level: 1
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    第#cur 章#h(1em)#it.body
    #v(1em)
    #counter(figure.where(kind: "i-figured-"+repr(image))).update(0)
    #counter(figure.where(kind: "i-figured-"+repr(table))).update(0)
    #counter(figure.where(kind: "i-figured-"+repr(math.equation))).update(0)
  ]

  show heading.where(
    level: 2
  ): it => box(width: 100%)[
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 14pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #cur#h(1em)#it.body
    #v(1em)
  ]

  show heading.where(
    level: 3
  ): it => box(width: 100%)[
    #set text(size: 12pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #cur#h(1em)#it.body
  ]

  set text(size: 12pt)
  set par(leading: 1em)
  body

  pagebreak()
  heading([#text(weight: "bold")[致#h(1em)谢]], level: 7)
  v(16pt)
  set par(spacing: 12pt, leading: 1em)

  context [
    #if blind-review {

    } else {
      text(font: song, size: 12pt)[
        落笔于此，湘江畔的梧桐已悄然历经四度春秋。四年的时光倏然而过，仿佛昨日初入校园的悸动仍在心头，而今日，已执笔写下人生一个重要阶段的句点。

        盛行千里，不忘师恩。首先，我要特别感谢我的导师曾坤老师和王晨曦老师。从初入大学时的懵懂无知，到如今能够独立完成毕业设计，曾坤老师始终是我前行路上的明灯。他不仅在学术上给予我悉心的指导，帮助我拓宽视野，提升能力，还在生活中给予我无微不至的关怀，让我感受到如家人般的温暖。在这次毕业设计的过程中，从选题到实验，从撰文到定稿，曾坤老师和王晨曦老师的全程指导让我受益匪浅。每一次对实验结果的精益求精，每一次对论文的反复修改，都让我深刻体会到曾坤老师和王晨曦老师在科研工作中的严谨态度和对学生的严格要求。

        我还要感谢我的大学：国防科技大学，这是一座将星辉与书卷同辉、理想与责任同行的学府。这里有晨光熹微下的军姿列列，也有灯火阑珊处的潜心钻研；有挥洒汗水的操场，有洒满月光的实验室。我始终铭记，那些与室友们共度的深夜，那些一同并肩攻坚的清晨，都已悄然镌刻在我的青春年轮之上。
        
        感谢在我大学生活中同行的兄弟与朋友。与侯华玮、杨俯众一起走过的四年时光，我们携手完成了许多充满意义的项目，欢笑与不甘、失落与突破，都化作记忆中一颗颗熠熠生辉的星辰。感谢陈爽、陈诚、梁积新、朱夏辉，是你们在我彷徨时伸出温暖的手，是你们在我疲惫时说出笃定的话语，你们是我岁月中最真实的慰藉与同行。尤其感谢文智华师哥，是他牵我走进科研的世界，在浩瀚的知识之海中点亮第一盏灯，带我看见探索的美与深潜的力量。

        最后的最后，我要感谢我的父母，生育之恩，终身难忘。感谢他们在我十多年的学习生涯中的支持与鼓励。无数个夜晚，当我因失败而踟蹰，是你们温柔的话语穿越千里，抚慰我焦灼不安的心。你们从不言苦，却为我默默担起所有风雨；你们从不索求，却用全部的爱托举我向前。在未来的科研道路上，我愿以银河为志、以家国为念，秉承“银河精神”，行走于星辰大海，不负韶华、不负期许。

        我将继续寻找，就算这无尽的星辰令我的寻找希望渺茫，就算我将单枪匹马。愿未来的我们，都能带着这份温柔与坚定，走向更加辽阔的远方。
      ]
    }
  ]

  pagebreak()
  align(center)[#text(size: 16pt, font: hei)[参考文献]]
  v(16pt)
  set text(size: 10.5pt)
  // bibliography("references.bib", style: "gb-7714-2015-numeric", title:none)
  bibliography("references.bib", style: "templates/gb-t-7714-2015-numeric.csl", title: none)
}