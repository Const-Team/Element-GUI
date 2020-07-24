## Scrollbar 滚动条

美化滚动条

### 基础用法

:::demo 使用时，请设置外层盒子高度。如果尺寸不会发生变化，最好设置 `noresize` 为 `true` 来优化性能。
```html
<el-scrollbar 
  tag="ul"
  wrap-class="demo-scrollbar-list"
  wrap-style="color: red;"
  view-style="font-weight: bold;" 
  view-class="view-box"
  :noresize="true">
  <li v-for="value in 30" :key="vlaue">{{value}}111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</li>
</el-scrollbar>
```
:::


### Attributes

| 参数    | 说明  | 类型 | 可选值  | 默认值  |
| ----    | ---- | ---- | -----   | ----     |
| native  | 是否显示模拟滚动条 | boolean  | —   | false  |
| wrap-class  | 外层盒子类名 | string  | —   | —  |
| wrap-style  | 外层盒子样式 | string  | —   | —  |
| view-class  | 内层盒子类名 | string  | —   | —  |
| view-style  | 内层盒子样式 | string  | —   | —  |
| noresize  | 是否自适应 | boolean  | —   | true  |
| tag  | 生成的标签 | String  | —   | div  |