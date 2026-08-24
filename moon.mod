// Learn more about moon.mod configuration:
// https://docs.moonbitlang.com/en/latest/toolchain/moon/module.html
//
// To add a dependency, run this command in your terminal:
//   moon add moonbitlang/x
//
// Or manually declare it in `import`, for example:
// import {
//   "moonbitlang/x@0.4.6",
// }

name = "lyyjavastudy/moonbit-counterpoint"

version = "0.3.2"

readme = "README.mbt.md"

repository = "https://github.com/lyyjavastudy/moonbit-counterpoint"

license = "Apache-2.0"

keywords = [
  "music",
  "counterpoint",
  "rule-engine",
  "education",
  "composition",
]

preferred_target = "wasm-gc"

description = "Explainable counterpoint rule engine for MoonBit"
