## 更新日志

<details open="open">

<summary>
  <span>1.2.4</span><em>2021-06-04</em>
</summary>

#### 新特性

- Skeleton
  - 增加骨架屏组件

#### 修复

- DatePicker
  - 修复 `cellClassName` 仅在 `type = 'date'` 生效
  - 修复日期区间时间选择bug

- Table
  - 修复懒加载数据

</details>

<details>

<summary>
  <span>1.2.3</span><em>2021-05-30</em>
</summary>

#### 新特性

- Tabs
  - 增加方向键切换标签开关

#### 修复

- MessageBox
  - 修复关闭按钮居中
- Carousel
  - 修复间隔和缩放错误
- Tabs
  - 修复控制台报错 `scrollToActiveTab of undefined`
  - 修复激活页签样式
- Popover
  - 修复禁用时显示浮窗
  - 修复在停用时关闭浮窗
- Drawer
  - 修复鼠标拖动到遮罩层时抽屉关闭
- Dialog
  - 修复IE下弹窗无法遮盖焦点

</details>

<details>
  <summary>
    <span>1.2.1</span><em>2021-04-20</em>
  </summary>

#### 新特性

- Empty
  - 移植 `element-plus` 空状态组件。
- Collapse
  - 新增点击图标展开面板 `trigger`。
- DatePicker
  - 新增季度区间选择器 `quarterrange`。

#### 修复

- Tree
  - 修复 `disabled` 高亮状态。
- Calendar
  - 修复多语言切换bug。
- Input
  - 修复切换密码框光标bug。
- Tooltip
  - 修复`max-width`属性类型判断bug。

</details>

<details>
  <summary>
    <span>1.2.0</span><em>2021-03-19</em>
  </summary>

#### 特别注意

- `Calendar-pro` 在此版本移除，拆分为 [vue-lunar-calendar-pro](https://www.npmjs.com/package/vue-lunar-calendar-pro) 组件进行维护。

#### 修复

- Table
  - 修复卡片表格树样式。

- Popover
  - 修复`Popover`宽度。

- Cascader
  - 修复`Cascader`懒加载。 
  - 修复`Cascader`当前路径。 

- Radio
  - 修复使用 `RadioGroup` 作为动态组件报错。

- ColorPicker
  - 修复选择8位十六进制颜色。

- Image
  - 修复IE中图像匹配错误比率。

</details>

<details>
  <summary>
    <span>1.1.94</span><em>2021-02-23</em>
  </summary>

#### 特别注意

- `Calendar` 将会在下个版本移除，独立成单独的组件进行维护。

#### 优化

- Table
  - 使用内置滚动条 `ElScrollbar`。
  - 优化`tooltip`增加类名，方便自定义样式。

#### 新特性

- Table
  - 新增监听表格滚动方法 `table-scroll`。

#### 修复

- Cascader
  - 修复级联在IE下不会自动截断bug。
- Input
  - 修复复合型输入框尺寸问题。
  - 修复复合型输入框在IE下对齐问题。
  - 修复文本域字数限制样式。
- Drawer
  - 修复通过修改`visible`不触发`destroyOnClose`判断。
- Form
  - 修复`form-item`中`label-wrap`的报错问题。

</details>

<details>
  <summary>
    <span>1.1.89</span><em>2021-01-15</em>
  </summary>

#### 修复

- Cascader
  - 修复级联多选bug。

</details>

<details>
  <summary>
    <span>1.1.88</span><em>🎉 新年快乐 🥳 2020-12-31</em>
  </summary>

#### 新特性

- Dialog
  - 添加 ` draggable ` 属性，允许用户拖动对话框
- NavMenu
  - 添加 `tooltip-effect` 属性

#### 修复

- Autocomplete
  - 修复 ` change event ` 错误。
  - 修复验证失败时无法消失验证。
- Image
  - 更新错误状态。
- InputNumber 
  - 正确计算 ` inputNumberDisabled ` 。
- Popover 
  - 兼容 Vue 2.6 新 ` v-slot ` 语法。
- Cascader
  - 修复多选状态下搜索词被清空
  - 修复 `getCheckedNodes` 返回的勾选节点顺序和`value`传入值的顺序不一致的问题
- Tree
  - 修复 ` showCheckbox` 状态下，组件拖动后 ` check ` 状态显示不正确
- Collapse
  - 修复 ` enter ` 钩子计算高度问题
- Table
  - 修复设置表格高度为 ` height='auto' ` 时高度自动增加
  - 修复当列属性为嵌套对象属性时，表格合计不生效
- Input
  - 使用 `show-password`，点击显示密码，光标位置自动移到开头
- Other
  - 修复函数类型检查问题

#### 优化
- Transfer
  - 替换默认滚动条为 ` el-scrollbar ` ；
  - 优化穿梭框样式 ；
- Scrollbar
  - 添加滚动事件 ` doScroll ` ；
- Table
  - 优化 ` show-overflow-tooltip ` 导致整个 Table 的重新渲染

</details>

<details>
  <summary>
    <span>1.1.83</span><em>2020-11-27</em>
  </summary>

#### 新特性

- Tag
  - 新增文本色和边框色。
- Carousel
  - 新增 ` lazy ` 懒加载。
- Collapse
  - 新增 ` lazy ` 懒加载。

#### 修复

- Form
  - 修复栅格表单问题。
- TreeSelect
  - 修复下拉树勾选回填方式。
- 表单元素
  - 修复表单元素对齐。

</details>

<details>
  <summary>
    <span>1.1.73</span><em>2020-10-29</em>
  </summary>

#### 新特性

- Form
  - 新增栅格表单。
- Pagination
  - 新增对齐方式。
- Layout
  - 新增对齐方式。
- ColorPicker
  - 新增 ` append-to-body ` 属性。
- Breadcrumb
  - 新增 ` title ` 属性。
- Image
  - 新增 ` width ` 和 ` height ` 属性。

#### 修复

- TreeSelect
  - 修复 ` size ` 问题。
- InputNumber
  - 修复文档错误。

#### 优化
- 自动化测试方面
  - 优化 ` Table ` ，根据 ` name ` 属性为单元格添加唯一 ` id ` ；
  - 优化 ` Pagination ` ，为页码按钮等添加唯一 ` id ` ；
- 增加常用原子样式

</details>

<details>
  <summary>
    <span>1.1.60</span><em>2020-08-21</em>
  </summary>

#### 新特性

- Table
  - 新增文本框过滤。
  - 新增表格 ` nohover ` 属性。
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
  - 修复表单为 ` disabled ` 时 ` rate ` , ` slider ` , ` switch ` 状态不变。
  - 修复 ` TreeSelect ` 重置。
- Message
  - 修复 ` single ` 属性不消除 ` DOM ` 
- TreeSelect
  - 修复删除后树高亮bug

#### 优化
- 自动化测试方面
  - 优化 ` Radio ` , ` Checkbox ` , ` Input ` , ` InputNumber ` , ` Select ` , ` TreeSelect ` , ` Cascader ` , ` Switch ` , ` TimePicker ` , ` DatePicker ` , ` DateTimePicker ` , ` Uploa d `等，根据 ` form ` 表单的 ` prop ` 自动添加 ` name ` 属性；
  - 优化 ` NavMenu ` ，根据 ` index ` 属性添加唯一 ` id ` ；
- TreeSelect
  - 增加 ` node-key ` 

</details>

<details>
  <summary>
    <span>1.1.46</span><em>2020-07-23</em>
  </summary>

#### 新特性

- Transfer
  - 新增懒加载。
- DatePicker
  - 新增年份范围选择。

#### 修复

- DatePicker
  - 修复设置了 ` editable ` 属性，时间输入框不会设置为只读的bug 
- Switch 
  - 切换值时会导致组件被销毁
- Table
  -  ` table-tree ` 在展开节点时如果id是0，无法展开
- NavMenu 和 Popconfirm 
  - 组件在按需加载时，缺少所依赖组件的样式
- Backtop
  - 未设置 ` target ` 时，部分浏览器中 ` document.documentElement.scrollTop ` 一直为0 
- Cascader
  - 修复清空 ` options ` 时报错 

</details>

<details>
  <summary>
    <span>1.1.41</span><em>2020-05-14</em>
  </summary>

#### 新特性

- TextEllipsis
  - 新增文字截断组件。
- Table
  - 表格增加 ` filter-icon ` 属性，自定义过滤图标。
- InputNumber
  - 增加 ` default-value ` 属性。

#### 紧急修复

- NavMenu
  -  ` SubMenu ` 组件堆栈溢出bug

</details>

<details>
  <summary>
    <span>1.1.37</span><em>2020-04-28</em>
  </summary>

#### 新特性

- Form
  - 增加 ` block-message ` 配置。
- Link
  - 添加 ` :to ` 属性
  - 添加 ` icon-right ` 属性。
- Button
  - 添加 ` icon-right ` 属性支持。
- Input
  - ` textarea ` 支持 ` clearable ` 属性。
- Select
  - 添加 ` option-max-width ` 属性以限制下拉框的最大宽度。
- Cascader
  - 添加 ` option-max-width ` 属性以限制选项框的最大宽度。
- TreeSelect
  - 添加 ` option-max-width ` 属性以限制下拉框的最大宽度。
- Form
  - 增加 ` label-max-width ` 配置。
- Switch
  - 文字放置在开关中，增加文字颜色配置，去掉 ` width ` 属性。

#### 修复

- InputNumber
  - 保持输入框为空，而不是重置为最小值。
- Transfer
  - 修复搜索图标位置。
- Link
  - 修复 Link 和文字按钮对齐 bug
- Input
  - 修复 ` prefix-icon ` 和 ` suffix-icon ` 属性与 ` clearable ` 属性同时存在时，图标显示 bug
- Autocomplete
  - 修复类型为 ` textarea ` 时建议错误问题
- Image
  - 修复当 ` preview-src-list ` 属性不包含 ` src ` 时图片预览大图展示为空的问题
  - 修复 ` preview-src-list ` 为空时点击图片会给 ` body ` 添加 ` overflow:scroll ` 的问题
- Transfer
  - 修复和 ` Form ` 组件一起使用时错误的行高问题
- InputNumber
  - 正确计算 ` inputNumberDisabled ` 

#### 优化

- Table
  - 列禁止拖拽，不触发 ` mouseDown ` 事件。
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

</details>

<details>
  <summary>
    <span>1.1.31</span><em>2020-03-24</em>
  </summary>

#### 新特性

- Transition
  - 增加 ` slide ` 划入。

#### 修复

- Table
  - 修复 Table IE 列宽不自适应 bug
- Form
  - 修复 Form 表单验证覆盖 bug

</details>

<details>
  <summary>
    <span>1.1.28</span><em>2020-02-05</em>
  </summary>

#### 新特性

- 全局配置
  - 增加 ` duration ` 全局配置。

</details>

<details>
  <summary>
    <span>1.1.27</span><em>2020-01-15</em>
  </summary>

#### 修复

- Cascader
  - 修复删除顺序错误 bug

#### 优化

- Image
  - 增加 ` append-to-body ` 属性
- Message
  - 增加 ` single ` 属性
- Slider
  - 增加 ` rangeClick ` 属性

</details>

<details>
  <summary>
    <span>1.1.23</span><em>2019-12-27</em>
  </summary>

#### 修复

- Image
  - 缩略图弹出为 body 层

#### 优化

- Carousel
  - 增加宽度属性
  - 增加配合缩略图组件使用的示例
- Slider
  - 增加 ` disabled-point ` 属性

</details>

<details>
  <summary>
    <span>1.1.20</span><em>🎉 圣诞快乐 🎄 2019-12-25</em>
  </summary>

#### 新特性

- Splitpanes
  - 增加 ` Splitpanes ` 分割面板组件
- LoadingBar
  - 增加 ` LoadingBar ` 组件

#### 修复

- Table
  - ` show-overflow-tooltip ` 文字过多 bug
- Input
  - 当 ` type ` 为 ` textarea ` 时， ` autocomplete ` 下拉箭头不显示
- Image
  - IE 下图片无法切换正常比例
- Upload
  - 修复 ` clearFiles ` 方法，避免同时上传多个文件时，清除 ` uploadFiles ` 列表，导致正在上传中的文件再上传完成后产生报错的问题
- Select
  - 默认宽度问题
- Image
  - 关闭图片预览后，鼠标键盘事件失效。
- Table
  - 自定义表头样式。
  - 表头和内容复选框对齐样式。
- Dialog
  - dialog 误触关闭，使用 ` mousedown ` 替换 ` click ` 。
- DatePicker
  - 切换类型时 ` popper ` 定位错误。

#### 优化

- Icon
  - 精简无用图标，保留组件及常用图标
- DatePicker
  - 增加 ` defaultView ` ，配置默认面板。
- Tree
  - 增加 ` expand-icon-class ` ，配置收起图标。
- Popconfirm
  - 增加 ` confirm ` 和 ` cancel ` 文档
- Select
  - 基础多选文字隐藏后自动显示 ` tooltip ` 
  - 增加 ` collapse-tags-max-num ` 配置
  - 增加 ` collapse-texts ` 配置
  - 增加 ` tooltip-effect ` 配置
- Cascader
  - 基础多选文字隐藏后自动显示 ` tooltip ` 
  - 增加 ` collapse-tags-max-num ` 配置
  - 增加 ` tooltip-effect ` 配置
  - 增加 ` tooltip-max-width ` 配置
- TreeSelect
  - 增加 ` collapse-tags ` 配置
  - 基础多选折叠后自动显示 ` tooltip ` 
  - 增加 ` collapse-tags-max-num ` 配置
  - 增加 ` tooltip-effect ` 配置
- Slider
  - 增加 ` tooltip-effect ` 配置
- Progress
  - 增加 ` active ` 动效
  - 增加 插槽

</details>

<details>
  <summary>
    <span>1.0.96</span><em>2019-11-27</em>
  </summary>

#### 新特性

- Popconfirm
  - 增加 ` Popconfirm ` 组件
- Affix
  - 增加 ` Affix ` 组件
- Table
  - 简化合并列处理

#### 修复

- DatePicker
  - 修复选择最小日期的 bug
- Select
  - 修复测试用例
- Tree
  - 增加 ` font-size ` 样式
- Table
  - 头部可自定义
  - 更新头部样式
  - 修复时候 ` filter ` 之后高度问题
  - 修复 ` row-style ` 失效的 bug
  - 修复头部消失的 bug 
- Calendar
  - 导入 ` el-button ` 和 ` el-button-group ` 
- MessageBox
  - 修复图表位置
- TimePicker
  - 滚动后设置正确的位置
- Message
  - 修复关闭的 ` offsetHeight ` 
- Form
  -  ` ValidateField ` 的回调应为可选项 
- Cascader
  - 修复 TypeScript 3.7 的兼容问题
- Menu
  - 修复 ` NavigationDuplicated `  在 vue-router@^3.1.0 的报错
- Dropdown
  - 更新类型文件
- Progress
  - 增加 ` strokeLinecap ` 属性
- InfiniteScroll
  - 跳过不可见元素触发
- Image
  - 优化用户体验
  - 优化大图片展示问题
- Drawer
  - 修复 ` drawer-append-to-body ` 失效的 bug
- Select
  - 修复空 ` tag ` 的 bug
- Scrollbar
  - 修复 FireFox 双滚动条的 bug

#### 优化

- I18n
  - 更新 sv-SE.js 
- Docs
  - 修复 ` time-select ` 文档错误 
  - 修复 ` Drawer ` 文档错误 
  - 修复 ` Loading ` 示例 
  - 增加 ` input event ` 相关文档 
  - 移除 ` Input repeat change event ` 相关文档 

</details>

<details>
  <summary>
    <span>1.0.94 之前版本</span><em>2019-11-20</em>
  </summary>

#### 新特性

- TreeSelect
  - 添加 ` TreeSelect ` 组件
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
  - 更新 ` DatePicker ` 语言包
- Icon
  - 优化字体包体积，删除组件无用图标
</details>