---
name: 行政综合四模块 PC 原型
description: 紧凑、清晰、可操作的企业级蓝白工作台
colors:
  primary: "#0865b7"
  primary-action: "#0768bb"
  selected-surface: "#e5f0ff"
  workspace: "#f3f5f8"
  panel: "#ffffff"
  ink: "#172b40"
  body: "#40536a"
  muted: "#7d8b9c"
  border: "#d9e1ea"
  success: "#159455"
  warning: "#dc7a0c"
  danger: "#d84d56"
typography:
  title:
    fontFamily: "NotoSC, Microsoft YaHei, sans-serif"
    fontSize: "24px"
    fontWeight: 700
    lineHeight: 1.4
  body:
    fontFamily: "NotoSC, Microsoft YaHei, sans-serif"
    fontSize: "14px"
    fontWeight: 400
    lineHeight: 1.7
  label:
    fontFamily: "NotoSC, Microsoft YaHei, sans-serif"
    fontSize: "13px"
    fontWeight: 400
    lineHeight: 1.4
rounded:
  control: "2px"
  surface: "2px"
spacing:
  xs: "4px"
  sm: "8px"
  md: "14px"
  lg: "20px"
  xl: "28px"
components:
  button-primary:
    backgroundColor: "{colors.primary-action}"
    textColor: "{colors.panel}"
    rounded: "{rounded.control}"
    height: "32px"
    padding: "0 12px"
  input:
    backgroundColor: "{colors.panel}"
    textColor: "{colors.ink}"
    rounded: "{rounded.control}"
    height: "32px"
    padding: "0 10px"
  panel:
    backgroundColor: "{colors.panel}"
    textColor: "{colors.ink}"
    rounded: "{rounded.surface}"
    padding: "10px"
---

# Design System: 行政综合四模块 PC 原型

## Overview

**Creative North Star: “企业级蓝白工作台”**

界面以日常高频办公为场景，优先保证扫读、批量操作和状态判断。蓝色承担工作台品牌、主操作和选中状态；白色侧栏与内容区承载高密度业务；浅灰工作区分隔层级。顶部加入来自参考图的轻量几何层次，门户采用贴边信息板块，后台采用紧凑树形导航与数据网格，不引入深色侧栏或大卡片仪表盘。

**Key Characteristics:**

- 44px 紧凑蓝色顶部导航、34px 多页签与搜索型树形侧栏。
- 细边框、灰蓝表头、2px 低圆角和 32px 表单控件。
- 门户使用 2:1 头部信息区、三列内容区与双列辅助区。
- 门户顶部增加“行政综合 / 内容发布工作台”上下文带，作为页面定位而不是营销式 Hero。
- 后台采用查询、批处理、数据账本连续阅读节奏；行选中、状态标签和审批节点拥有短促反馈动效。
- 编辑页左右严格 2:1，底部操作固定。
- 状态以低饱和底色和明确文本表达。

## Colors

主色保持克制，只出现在导航、主按钮、链接和选中状态；大面积区域使用白色与冷灰。

**The One Accent Rule.** 同一操作区域只保留一个实心蓝色主动作，其余使用白底描边。

## Typography

本地自托管 Noto Sans CJK SC，回退微软雅黑。列表、表单与正文保持清晰的中文阅读密度；标题通过字重和尺寸建立层级，不使用装饰字形。

## Layout

后台使用 44px 顶部导航、34px 页签和 184px 左侧栏（1366px 时为 176px）。管理页在浅灰工作区内使用白色面板；表格行高 40px，并只在自身容器横向滚动。编辑页为 `minmax(0, 2fr) minmax(0, 1fr)`，两栏独立滚动，底部 56px 操作栏固定可见。1366px 及以上不产生页面整体横向溢出。

## Elevation & Depth

常规结构依赖边框与背景层次，不使用普遍阴影。只有弹窗、底部固定栏和短时提示使用柔和的偏移阴影，以说明覆盖或悬浮关系。

动效仅用于页面进入、行悬停、项目进入按钮、审批节点 hover 和状态反馈；所有动效均提供 `prefers-reduced-motion` 降级，不使用连续滚动或会阻碍批量操作的动画。

## Shapes

控件使用 3px 圆角，面板使用 4px 圆角。状态标签和小型业务图标可使用更高圆度，但内容面板不使用胶囊或大圆角卡片。

## Components

### Buttons

32px 高度，主按钮为实心蓝色，次按钮白底描边；危险操作使用红色文本与浅红边框。聚焦状态使用清晰蓝色外环。

### Cards / Containers

后台面板白底、1px 冷灰边框、2px 圆角，无常驻阴影。门户栏目使用薄边框、标题分隔线和极轻的向下阴影，强调信息板块而非卡片装饰。

### Inputs / Fields

32px 高，1px 冷灰边框；悬停加深为蓝灰，聚焦切换为蓝色并显示 2px 半透明聚焦环；只读字段使用浅灰背景。

### Navigation

顶部为紧凑蓝色主导航，当前一级模块以白底蓝字显示。侧栏为白底，圆形蓝色业务图标，当前项使用浅蓝底和蓝色文字。页签当前项使用实心蓝色。

### Workbench Composition

门户以编辑式双栏新闻区为视觉锚点，项目列表用连续行而非重复卡片；下方三列信息区和双列辅助区严格填满网格。后台和审批页保留高密度企业工作台语法，使用标题下划线、局部滚动表格、固定操作栏和低饱和状态标签建立层级。

## Do's and Don'ts

### Do:

- **Do** 保持表单、筛选和表格的紧凑节奏。
- **Do** 用明确状态文字配合颜色，不依赖颜色单独传达结果。
- **Do** 让表格、表单栏和弹窗各自在局部滚动。

### Don't:

- **Don't** 恢复深色侧栏、大圆角卡片或大面积装饰渐变。
- **Don't** 把四个模块机械做成完全相同的能力集合。
- **Don't** 通过缩小整体字体或页面缩放解决窄屏问题。
