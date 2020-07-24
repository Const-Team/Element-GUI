<script>
  import Clipboard from 'clipboard';
  export default {
    methods: {
      copy() {
        var clipboard = new Clipboard('.icon');
        clipboard.on('success', e => {
          this.$message({
            message: e.text +' 复制成功',
            type: 'success'
          });
          // 释放内存
          clipboard.destroy();
        })  
        clipboard.on('error', e => {
          // 不支持复制
          this.$message({
            message: '复制失败',
            type: 'error'
          }); 
          // 释放内存
          clipboard.destroy();
        })
      }
    }
  }
</script>


## Icon 图标

提供了一套常用的图标集合。

### 使用方法

直接通过设置类名为 `el-icon-iconName` 来使用即可。例如：

```html
<i class="el-icon-edit"></i>
<i class="el-icon-user"></i>
<i class="el-icon-delete"></i>
<el-button type="primary" icon="el-icon-search">搜索</el-button>
```

这里仅提供组件内图标和常用图标，项目中需要用到的图标，可以使用阿里的 [iconfont](https://www.iconfont.cn) 图标库，推荐使用iconfont默认配置。

FontClass/Symbol 前缀 请使用 `icon-`，因为按钮中图标需要根据`icon-`来做一些样式处理。

Font Family 不做特别限制，可以使用默认的`iconfont`。

### iconfont图标使用

```css
.iconfont {
  font-family: "iconfont" !important;
  font-size: 16px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```
```html
<i class="icon-server"></i>
<i class="icon-daolan"></i>
<i class="icon-flash"></i>
<el-button type="primary" icon="icon-top">置顶</el-button>
```

### 图标集合

<ul class="icon-list">
  <li v-for="name in $icon" :key="name">
    <span class="icon" @click="copy" :data-clipboard-text="'el-icon-' + name">
      <i :class="'el-icon-' + name"></i>
      <span class="icon-name">{{'el-icon-' + name}}</span>
    </span>
  </li>
</ul>