## TextEllipsis 文本截断

简单实现多行文本截断，组件不支持布局变化时自动更新，如需支持更多截断内容，请使用 [vue-clamp](https://www.npmjs.com/package/vue-clamp)。

### 基础用法
:::demo
```html
<template>
  <el-text-ellipsis :text="text" :height="50"></el-text-ellipsis>
</template>

<script>

export default {
  data() {
    return {
      text: 'Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。'
    };
  }
};
</script>
```
:::

### 自定义前缀后缀
:::demo
```html
<template>
  <el-text-ellipsis :text="text" :height="50">
    <span slot="before">新闻：</span>
    <span slot="after">[09/14]</span>
  </el-text-ellipsis>
</template>

<script>

export default {
  data() {
    return {
      text: 'Vue 提供了一个官方的 CLI，为单页面应用 (SPA) 快速搭建繁杂的脚手架。它为现代前端工作流提供了 batteries-included 的构建设置。只需要几分钟的时间就可以运行起来并带有热重载、保存时 lint 校验，以及生产环境可用的构建版本。更多详情可查阅 Vue CLI 的文档。'
    };
  }
};
</script>
```
:::

### 自定义
:::demo
```html
<template>
  <el-text-ellipsis :text="text" :height="60" :isLimit="isLimit" :hideTooltip="!isLimit" :tool-tip-width="400">
    <span slot="after">
      <el-button type="text" v-if="!isLimit" @click="isLimit=true">收起</el-button>
      <el-button type="text" v-else @click="isLimit=false">查看更多</el-button>
    </span>
  </el-text-ellipsis>
</template>

<script>

export default {
  data() {
    return {
      text: 'CommonJS 和 ES Module 版本同时保留原始的 process.env.NODE_ENV 检测，以决定它们应该运行在什么模式下。你应该使用适当的打包工具配置来替换这些环境变量以便控制 Vue 所运行的模式。把 process.env.NODE_ENV 替换为字符串字面量同时可以让 UglifyJS 之类的压缩工具完全丢掉仅供开发环境的代码块，以减少最终的文件尺寸。',
      isLimit: true
    };
  }
};
</script>
```
:::


### Attributes

| 参数           | 说明                           | 类型      | 可选值                               | 默认值  |
| -------------- | ------------------------------ | --------- | ------------------------------------ | ------- |
| text           | 需要省略的文本                   | String  | — | — |
| height      | 限制的高度                         | Number | —                                    | -    |
| isLimit       | 是否开启限制                       | Boolean | —                                    | true   |
| hideTooltip           | 是否使用Tooltip                    | Boolean  | —                                    | true       |
| effect           | Tooltip的风格                       | String  | dark/light                                   | dark       |
| placement             | Tooltip 的出现位置 | String | top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end             | top       |
| tool-tip-width             | Tooltip 的最大宽度 | Number | —             | 200       |
| more     | 省略的形式           | String  | -                                 | -       |