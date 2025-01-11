# 基于 Typst 的某奋进世界一流高校学位论文模板

下面是关于毕设论文模板的说明：

目前还**不能保证已经完全符合**学位论文规范要求，欢迎贡献代码或提出issue！

使用方法

- Windows 用户

    - clone 本仓库，并下载**这个版本**的 [Typst](https://github.com/typst/typst/releases/tag/v0.12.0)

    - 将 Typst 添加到环境变量
    
    - 安装在 `fonts/` 文件夹下的字体（用于数学公式）

    - 开始愉快地写作吧！

- Linux 用户

    - Linux 用户应该不需要本指南（请看下面）

- MacOS 用户

    - 安装 Rust 和 Typst (cargo install typst-cli)

    - 安装在 `fonts/` 文件夹下的字体（用于数学公式）

    - 开始愉快地写作吧！

使用 Typst 编译得到PDF文档

```bash
typst c project-application.typ # 开题报告
typst c thesis.typ # 毕业论文
```
