## Affix 固钉

将元素钉在固定位置，常用于顶部菜单或者侧边菜单。  
当内容区域比较长，需要滚动页面时，这部分内容对应的操作或者导航需要在滚动范围内始终展现。  
页面可视范围过小时，慎用此功能以免遮挡页面内容。

### 基本

最简单的用法

:::demo
```html
<template>
  <el-affix :target="getTarget" @change="changeStatus">
    <el-button type="primary">固定在顶部</el-button>
  </el-affix>
</template>
<script>
  export default {
    methods: {
      getTarget() {
        const el = window.document.getElementsByClassName('page-component__scroll')[0].children[0];
        return el;
      },
      changeStatus(val) {
        this.$message({
          message: '状态改变了：' + val,
          type: val ? 'success' : 'error'
        });
      }
    }
  }
</script>

```
:::

### 设置偏移量

设置距离顶部达到指定距离时触发

:::demo
```html
<el-affix  :target="getTarget" :offset-top="100">
  <el-button type="primary">固定距离顶部100px的位置</el-button>
</el-affix>
<script>
  export default {
    methods: {
      getTarget() {
        const el = window.document.getElementsByClassName('page-component__scroll')[0].children[0];
        return el;
      }
    }
  }
</script>

```
:::

### 底部固定

设置距离底部达到指定距离时触发

:::demo
```html
<el-affix  :target="getTarget" :offset-bottom="100">
  <el-button type="primary">固定距离底部100px的位置</el-button>
</el-affix>
<script>
  export default {
    methods: {
      getTarget() {
        const el = window.document.getElementsByClassName('page-component__scroll')[0].children[0];
        return el;
      }
    }
  }
</script>
```
:::

::: tip
注意：Affix 内的元素不要使用绝对定位，如需要绝对定位的效果，可以直接设置 Affix 为绝对定位：
:::
```
<el-affix :style="{ position: 'absolute', top: y, left: x}">
</el-affix>
```

### Attributes

| 参数        | 说明           | 类型               | 可选值 | 默认值       |
|------------|----------------|--------------------|--------|--------------|
| offset-top    | 距离窗口顶部达到指定偏移量后触发    | Number |  —  |    0     |
| offset-bottom | 距离窗口底部达到指定偏移量后触发    | Number |  —  |    -     |
| target        | 设置 Affix 需要监听其滚动事件的元素，值为一个返回对应 DOM 元素的函数 | Function |  —  | () => window |


### Events
| 事件名称 | 说明 | 回调参数 |
|----------|--------|----------|
| change | 在固定状态发生改变时触发   | 固定则为true，否则为false |