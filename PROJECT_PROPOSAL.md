# 项目申报书：moonbit-counterpoint

项目标识：`moonbit-counterpoint`  
项目名称：MoonBit 对位法规则引擎  
参赛方向：MoonBit 8 月黑客松，应用生态与教育工具方向  
仓库形态：MoonBit 原生库 + CLI 示例 + CI + 规则文档

## 项目简介

`moonbit-counterpoint` 面向音乐教育、自动作曲原型和乐理分析工具，提供可解释的对位法规则检查。项目把传统 species counterpoint 的判断拆成结构化规则：一至五类对位节奏形态、平行五八度、隐伏五八度、旋律跨度、大跳与反向级进恢复、强弱拍不协和处理、终止式形态与错误报告。输出不是单一分数，而是可定位、可分级、可展示给学习者的 `Finding` 列表。

## 选题依据

MoonBit 生态已有 MIDI、音乐 IR、raylib 音频等通用音乐相关包，但公开检索未发现成熟的“对位法规则引擎”包。该项目不重复底层 MIDI 或音频播放能力，而是补齐音乐理论分析层，未来可与 MIDI/MusicXML 包组合成更完整的教学和自动作曲工作流。

## 实施范围

当前版本实现 `Note`、`Species`、`AnalysisOptions`、`Finding`、`Analysis` 等公开模型；提供 `analyze_counterpoint` 作为统一入口；内部按 `intervals`、`melody`、`harmony`、`species` 拆分规则。第一阶段支持上方对位声部，使用整数音高和脉冲时值表达曲例；后续可扩展为上下声部模式、调式终止式、四类悬留准备/解决、规则 profile、MIDI/MusicXML 适配层。

## MoonBit 价值

规则引擎需要强类型建模、清晰的枚举结果、可测试的纯函数和轻量 CLI 展示，MoonBit 很适合把乐理规则做成可维护库。项目同时展示 MoonBit 在教育工具、领域规则系统和可解释分析上的应用场景。

## 测试与质量

仓库包含黑盒测试曲例，覆盖干净一类对位、平行五度错误、二类弱拍不协和、大跳恢复、四类悬留节奏提示。CI 参考 MoonBit 社区模板与参赛仓库做法，执行 `moon fmt --check`、`moon check --deny-warn`、`moon test --deny-warn`、`moon info --deny-warn` 并检查生成文件差异。

## 交付计划

8 月上旬完成核心规则、README、许可证、CI 与申报材料；中旬补充更多曲例、规则 profile 和报告格式；后期接入一个导入适配原型并完善文档。项目将保持公开提交历史，默认分支为 `main`，贡献来源声明为本人原创 MoonBit 源码。
