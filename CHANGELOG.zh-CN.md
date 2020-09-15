## 更新日志

### 1.1.61
_2020-09-15_

#### 优化
- 自动化测试方面
  - 优化 `Table`，根据 `name` 属性为单元格添加唯一 `id`；
  - 优化 `Pagination`，为页码按钮等添加唯一 `id`；

### 1.1.60
_2020-08-21_

#### 新特性

- Table
  - 新增文本框过滤。
  - 新增表格nohover属性。
- TreeSelect 
  - 新增默认收起节点。
  - 新增点击节点配置。

#### 修复

- Upload
  - 修复IE10兼容问题。
- Button 
  - 修复点击后失去焦点。
- Tooltip
  - 修复内存泄漏。
- Tree
  - 修复拖拽时位置问题
- Form
  - 修复行内表单样式
  - 修复表单为 `disabled` 时 `rate`, `slider`, `switch`状态不变。
  - 修复 `TreeSelect` 重置。
- Message
  - 修复 `single` 属性不消除`DOM`
- TreeSelect
  - 修复删除后树高亮bug

#### 优化
- 自动化测试方面
  - 优化`Radio`, `Checkbox`, `Input`, `InputNumber`, `Select`, `TreeSelect`, `Cascader`, `Switch`, `TimePicker`, `DatePicker`, `DateTimePicker`, `Upload`等，根据 `form` 表单的 `prop` 自动添加 `name` 属性；
  - 优化 `NavMenu`，根据 `index` 属性添加唯一 `id`；
- TreeSelect
  - 增加 `node-key`

### 1.1.46
_2020-07-23_

#### 新特性

- Transfer
  - 新增懒加载。
- DatePicker
  - 新增年份范围选择。

#### 修复

- DatePicker
  - 修复设置了editable属性，时间输入框不会设置为只读的bug 
- Switch 
  - 切换值时会导致组件被销毁
- Table
  - table-tree在展开节点时如果id是0，无法展开
- NavMenu 和 Popconfirm 
  - 组件在按需加载时，缺少所依赖组件的样式
- Backtop
  - 未设置target时，部分浏览器中 document.documentElement.scrollTop 一直为0 
- Cascader
  - 修复清空options时报错 

### 1.1.41

_2020-05-14_

#### 新特性

- TextEllipsis
  - 新增文字截断组件。

### 1.1.39

_2020-05-09_

#### 新特性

- Table
  - 表格增加`filter-icon`属性，自定义过滤图标。
- InputNumber
  - 增加`default-value` 属性。

#### 紧急修复

- NavMenu
  - SubMenu组件堆栈溢出bug

### 1.1.37

_2020-04-28_

#### 新特性

- Form
  - 增加 `block-message` 配置。
- Link
  - 添加 `:to` 属性
  - 添加 `icon-right` 属性。
- Button
  - 添加 `icon-right` 属性支持。
- Input
  - `textarea` 支持`clearable`属性。
- Select
  - 添加 `option-max-width` 属性以限制下拉框的最大宽度。
- Cascader
  - 添加 `option-max-width` 属性以限制选项框的最大宽度。
- TreeSelect
  - 添加 `option-max-width` 属性以限制下拉框的最大宽度。

#### 修复

- InputNumber
  - 保持输入框为空，而不是重置为最小值。
- Transfer
  - 修复搜索图标位置。

#### 优化

- Table
  - 列禁止拖拽，不触发`mouseDown`事件。
  - 优化卡片表头风格。
  - 优化表格选中样式和划过样式优先级。
- Tabs
  - 优化简洁风格页签样式。
- Popover
  - 优化相关样式
- Tooltip
  - 优化相关样式
- MessageBox
  - 优化相关样式


### 1.1.33

_2020-04-19_

#### 新特性

- Form
  - 增加 label-max-width 配置。
- Switch
  - 文字放置在开关中，增加文字颜色配置，去掉`width`属性。

#### 修复

- Link
  - 修复 Link 和文字按钮对齐 bug
- Input
  - 修复 `prefix-icon` 和 `suffix-icon` 属性与`clearable`属性同时存在时，图标显示 bug
- Autocomplete
  - 修复类型为 textarea 时建议错误问题 (#18478 by @Roojay)
- Image
  - 修复当 preview-src-list 属性不包含 src 时图片预览大图展示为空的问题 (#18975) (#19130 by @luckyCao)
  - 修复 preview-src-list 为空时点击图片会给 body 添加 overflow: scroll 的问题 (#18967 by @inooNgt)
- Transfer
  - 修复和 Form 组件一起使用时错误的行高问题 (#18917 by @Hanx)
- InputNumber
  - 正确计算 inputNumberDisabled (#18439 by @ashuser-pendo)

### 1.1.31

_2020-03-24_

#### 新特性

- Transition
  - 增加 slide 划入。

### 1.1.30

_2020-03-09_

#### 修复

- Table
  - 修复 Table IE 列宽不自适应 bug

### 1.1.29

_2020-03-05_

#### 修复

- Form
  - 修复 Form 表单验证覆盖 bug

### 1.1.28

_2020-02-05_

#### 新特性

- 全局配置
  - 增加 duration 全局配置。

### 1.1.27

_2020-01-15_

#### 修复

- Cascader
  - 修复删除顺序错误 bug

#### 优化

- Image
  - 增加 `append-to-body` 属性
- Message
  - 增加 `single` 属性
- Slider
  - 增加 `rangeClick` 属性

### 1.1.23

_2019-12-27_

#### 修复

- Image
  - 缩略图弹出为 body 层

#### 优化

- Carousel
  - 增加宽度属性
  - 增加配合缩略图组件使用的示例
- Slider
  - 增加`disabled-point`属性

### 1.1.20

_2019-12-25 🎉 圣诞快乐 🎄_

#### 新特性

- Splitpanes
  - 增加 Splitpanes 分割面板组件

#### 修复

- Table
  - `show-overflow-tooltip` 文字过多 bug
- Input
  - 当 type 为 textarea 时，autocomplete 下拉箭头不显示
- Image
  - IE 下图片无法切换正常比例
- Upload
  - 修复 clearFiles 方法，避免同时上传多个文件时，清除 uploadFiles 列表，导致正在上传中的文件再上传完成后产生报错的问题

#### 优化

- Icon
  - 精简无用图标，保留组件及常用图标

### 1.1.14

_2019-12-13_

#### 新特性

- LoadingBar
  - 增加 LoadingBar 组件

#### 优化

- DatePicker
  - 增加 `defaultView` ，配置默认面板。
- Tree
  - 增加 `expand-icon-class` ，配置收起图标。
- Popconfirm
  - 增加 `confirm` 和 `cancel` 文档
- Select
  - 基础多选文字隐藏后自动显示 tooltip
  - 增加 `collapse-tags-max-num` 配置
  - 增加 `collapse-texts` 配置
  - 增加 `tooltip-effect` 配置
- Cascader
  - 基础多选文字隐藏后自动显示 tooltip
  - 增加 `collapse-tags-max-num` 配置
  - 增加 `tooltip-effect` 配置
  - 增加 `tooltip-max-width` 配置
- TreeSelect
  - 增加 `collapse-tags` 配置
  - 基础多选折叠后自动显示 tooltip
  - 增加 `collapse-tags-max-num` 配置
  - 增加 `tooltip-effect` 配置
- Slider
  - 增加 `tooltip-effect` 配置

#### 修复

- Select
  - 默认宽度问题
- Image
  - 关闭图片预览后，鼠标键盘事件失效。
- Table
  - 自定义表头样式。
  - 表头和内容复选框对齐样式。
- Dialog
  - dialog 误触关闭，使用 `mousedown` 替换 `click` 。
- DatePicker
  - 切换类型时 popper 定位错误。

### 1.0.99

_2019-12-02_

#### 优化

- Progress
  - 增加 active 动效
  - 增加 插槽

### 1.0.96

_2019-11-27_

#### 新特性

- Popconfirm
  - 增加 Popconfirm 组件
- Affix
  - 增加 Affix 组件
- Table
  - 简化合并列处理

#### 修复

- DatePicker
  - 修复选择最小日期的 bug (#17191 by @smk0621)
- Select
  - 修复测试用例 (by @msidolphin)
- Tree
  - 增加 font-size 样式 (#17094 by @spengjie)
- Table
  - 头部可自定义 (#17291 by @ziyoung)
  - 更新头部样式 (#17284 by @ziyoung)
  - 修复时候 filter 之后高度问题 (#17348 by @ziyoung)
  - 修复 row-style 失效的 bug (#17002 by @a631807682)
  - 修复头部消失的 bug (#17341 by @ziyoung)
- Calendar
  - 导入 el-button 和 el-button-group (#17376 by @masongzhi)
- MessageBox
  - 修复图表位置 (#17410 by @nullptru)
- TimePicker
  - 滚动后设置正确的位置 (#16868 by @mattheyan)
- Message
  - 修复关闭的 offsetHeight（#17564） (#17852 by @gzwgq222)
- Form
  - ValidateField 的回调应为可选项 (#17314 by @CarterLi)
- Cascader
  - 修复 TypeScript 3.7 的兼容问题 (#17881 by @CarterLi)
- Menu
  - 修复 NavigationDuplicated 在 vue-router@^3.1.0 的报错 (#17269 by @iamkun)
- Dropdown
  - 更新类型文件 (#17550 by @iamkun)
- Progress
  - 增加 strokeLinecap 属性 (#17552 by @iamkun)
- InfiniteScroll
  - 跳过不可见元素触发 (#17553 by @iamkun)
- Image
  - 优化用户体验 (#16985 by @luckyCao)
  - 优化大图片展示问题 (#16796 by @luckyCao)
- Drawer
  - 修复 drawer-append-to-body 失效的 bug (#16953 by @JeremyWuuuuu)
- Select
  - 修复空 tag 的 bug (#17199 by @luckyCao)
- Scrollbar
  - 修复 FireFox 双滚动条的 bug (#18091 by @iamkun)

#### 优化

- I18n
  - 更新 sv-SE.js (#17926 by @FOLLGAD)
- Docs
  - 修复 time-select 文档错误 (#17250 by @wacky6)
  - 修复 Drawer 文档错误 (#17122 by @haoranyu)
  - 修复 Loading 示例 (#17862 by @MBearo)
  - 增加 input event 相关文档 (#18061 by @zhouxinyong)
  - 移除 Input repeat change event 相关文档 (#18085 by @zhouxinyong)

### 1.0.94 之前版本

_2019-11-20_

#### 新特性

- TreeSelect
  - 添加 TreeSelect 组件
- Calendar
  - 支持 农历 属性的配置
- DatePicker
  - 支持 季度 选项
- Transfer
  - 支持 列宽 配置
- Form
  - 增加 多列 布局
  - 优化 验证错误 位置
- Table
  - 增加 卡片 风格
  - 拖拽列功能可配置
- Progress
  - 进度条可配置路径两端的形状
- NavMenu
  - 增加 选中背景高亮 配置
- Dialog
  - 增加拖拽指令
- Popover
  - 增加最大宽度配置
- Scrollbar
  - 增加滚动条使用文档

#### 修复

- Table
  - 固定列表头错位 bug
- Badge
  - 白边问题
- Dropdown
  - IE 错位问题
- Steps
  - IE 兼容问题
- Image
  - IE 兼容问题

#### 优化

- I18n
  - 更新 DatePicker 语言包
- Icon
  - 优化字体包体积，删除组件无用图标
