## Splitpanes 分割面板

:::warning
注意：本组件使用`flex`布局，可能不兼容IE浏览器！
:::

这个组件可以分割一个空间为多个可以调整大小的面板。

### 基本用法

可以通过 `size` 设置某一内含面板所占半分比，通过 `max-size`设置某一内含面板所占最大半分比，通过 `min-size` 设置某一内含面板所占最小半分比。通过添加 `horizontal` 可以分割一个纵向的空间。

:::demo
```html
<template>
  <el-radio-group v-model="horizontal">
    <el-radio :label="false">横向</el-radio>
    <el-radio :label="true">纵向</el-radio>
  </el-radio-group>

  <el-splitpanes :horizontal="horizontal" style="margin-top: 12px;height: 400px">
    <el-pane max-size="60" min-size="30">
      <div class="demo-pane">面板1</div>
    </el-pane>
    <el-pane>
      <div class="demo-pane">面板2</div>
    </el-pane>
    <el-pane>
      <div class="demo-pane">面板3</div>
    </el-pane>
  </el-splitpanes>
</template>
<script>
  export default {
    data() {
      return {
        horizontal: false
      };
    }
  }
</script>
```
:::


### 横纵面板组合使用

Splitpanes 可以嵌套实现组合的横向和纵向分割。

:::demo
```html
<template>
  <el-splitpanes style="height: 400px">
    <el-pane min-size="30">
      <div class="demo-pane">面板1</div>
    </el-pane>
    <el-pane>
      <el-splitpanes horizontal>
        <el-pane>
          <div class="demo-pane">面板2</div>
        </el-pane>
        <el-pane>
          <div class="demo-pane">面板3</div>
        </el-pane>
        <el-pane>
          <div class="demo-pane">面板4</div>
        </el-pane>
      </el-splitpanes>
    </el-pane>
    <el-pane>
      <div class="demo-pane">面板5</div>
    </el-pane>
  </el-splitpanes>
</template>
```
:::

### 动态添加面板

Splitpanes 可以实现动态添加。

:::demo
```html
<el-button @click="panesNumber++">添加面板</el-button>
<el-button @click="panesNumber--">减少面板</el-button>

<el-splitpanes style="height: 400px;margin-top: 12px;">
  <el-pane v-for="i in panesNumber" :key="i">
    <div class="demo-pane">动态面板 {{i}}</div>
  </el-pane>
</el-splitpanes>

<script>
  export default {
    data() {
      return {
        panesNumber: 3
      };
    }
  }
</script>
```
:::

### 动态调整面板大小

Splitpanes 可以实现动态调整大小。

:::demo
```html
<el-slider v-model="paneSize"></el-slider>

<el-splitpanes @resize="paneSize = $event[0].size" style="height: 400px;margin-top: 12px;">
  <el-pane :size="paneSize">
    <div class="demo-pane">面板1宽度：{{paneSize}} %</div>
  </el-pane>
  <el-pane :size="100 - paneSize">
    <div class="demo-pane">面板2宽度：{{100 - paneSize}} %</div>
  </el-pane>
</el-splitpanes>

<script>
  export default {
    data() {
      return {
        paneSize: 50
      };
    }
  }
</script>
```
:::

### 使用v-if显示隐藏面板

:::demo
```html

<el-switch v-model="hidePane" active-text="显示面板" inactive-text="隐藏面板"></el-switch>

<el-splitpanes style="margin-top: 12px;height: 400px">
  <el-pane max-size="60" min-size="30">
    <div class="demo-pane">面板1</div>
  </el-pane>
  <el-pane v-if="hidePane">
    <div class="demo-pane">面板2</div>
  </el-pane>
  <el-pane>
    <div class="demo-pane">面板3</div>
  </el-pane>
</el-splitpanes>

<script>
  export default {
    data() {
      return {
        hidePane: true
      };
    }
  }
</script>
```
:::


### Splitpanes Attributes
| 参数       | 说明     | 类型      | 可选值       | 默认值   |
|---------- |-------- |---------- |-------------  |-------- |
| push-other-panes  | 为真时，拖拽分割条碰撞到临近分割条时，会继续向临近分割条方向挤压下一个面板的空间。否则最多只是压缩自己部分的空间  | Boolean   |  —  |  true |
| horizontal  | 为真时，默认为纵向排布的容器的分割面板  | Boolean   |  —  |  false |
| first-splitter  | 为真时，第一个面板会前会被加上双击可导致最大化的分隔条  | Boolean   |  —  |  false |
| dblclick-splitter  | 为真时，双击分割条会导致面板最大化  | Boolean   |  —  |  true |

### Pane Attributes
| 参数       | 说明     | 类型      | 可选值       | 默认值   |
|---------- |-------- |---------- |-------------  |-------- |
| size  | 面板非固定数值、被伸缩方向相对于所处外容器的初始宽度（高度）百分比  | Number   |  —  | - |
| max-size | 面板非固定数值、被伸缩方向相对于所处外容器的最大宽度（高度）百分比   | Number   | -  |     100    |
| min-size | 面板非固定数值、被伸缩方向相对于所处外容器的最小宽度（高度）百分比   | Number   | — |  0  |


### Events
| 事件名称 | 说明 | 回调参数 |
|---------- |-------- |---------- |
| ready | 面板完成加载后的事件 | — |
| resize | 面板中任何的尺寸变化过程对应触发的事件 | — |
| resized | 面板中任何的尺寸变化完成时对应触发的事件 | — |
| pane-maximize | 双击分割条导致面板被最大化的事件 | — |
| pane-click | 面板非分割条部分被点击触发的事件 | — |
| splitter-click | 分割条部分被点击触发的事件 | — |
