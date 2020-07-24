## LoadingBar 加载进度条

全局创建一个显示页面加载、异步请求、文件上传等的加载进度条。  

`LoadingBar` 只会在全局创建一个，因此在任何位置调用的方法都会控制这同一个组件。主要使用场景是路由切换和`Ajax`，因为这两者都不能拿到精确的进度，`LoadingBar` 会模拟进度，当然也可以通过`update()`方法来传入一个精确的进度，比如在文件上传时会很有用。

例如在路由中使用：
```
// 部分代码省略
import ElementUI  from 'element-gui';
Vue.use(ElementUI);

router.beforeEach((to, from, next) => {
  ElementUI.LoadingBar.start();
  next();
});

router.afterEach(route => {
  ElementUI.LoadingBar.finish();
});
```

### 基本

:::demo
```html
<template>
  <el-button @click="start">开始</el-button>
  <el-button @click="finish">结束</el-button>
  <el-button @click="error">错误</el-button>
</template>
<script>
export default {
  methods: {
    start () {
      this.$loadingbar.start();
    },
    finish () {
      this.$loadingbar.finish();
    },
    error () {
      this.$loadingbar.error();
    }
  }
}
</script>

```
:::

通过直接调用以下方法来使用组件：

```
this.$loadingbar.start()
this.$loadingbar.finish()
this.$loadingbar.error()
this.$loadingbar.update(percent)
```

### Attributes
| 函数名 | 说明 | 回调参数 |
|----------|--------|----------|
| start | 开始从 0 显示进度条，并自动加载进度   | - |
| finish | 结束进度条，自动补全剩余进度   | - |
| error | 以错误的类型结束进度条，自动补全剩余进度   | - |
| update | 精确加载到指定的进度   | percent，指定的进度百分比 |

另外提供了全局配置和全局销毁的方法：
```
this.$loadingbar.config(options)
this.$loadingbar.destroy()

this.$loadingbar.config({
    color: '#5cb85c',
    failedColor: '#f0ad4e',
    height: 5
});
```

###  Options
| 属性 | 说明 | 类型 | 默认值 |
|----------|--------|----------|----------|
| color | 进度条的颜色   | String | #1890FF |
| failedColor | 失败时的进度条颜色   | String | #FF4B53 |
| height | 进度条高度，单位 px   | Number | 2 |
| duration | 隐藏时的持续时间，单位 ms   | Number | 800 |