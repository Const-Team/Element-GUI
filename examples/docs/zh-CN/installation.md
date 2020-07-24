## 安装

组件基于 [element-ui](https://element.eleme.cn/#/zh-CN) 做了二次封装，新增了一些组件，感谢饿了么前端团队开源！  
组件会根据饿了么组件升级，做出相应的升级，使用前请查看[更新日志](/#/component/changelog)，但是建议在使用某一版本稳定后，请锁死版本，以免将来组件升级时受到非兼容性更新的影响。

:::warning
本组件兼容现代浏览器，IE浏览器兼容到**IE10**及以上！
:::

### npm 安装

推荐使用 npm 的方式安装，它能更好地和 [webpack](https://webpack.js.org/) 打包工具配合使用。

```shell
npm i element-gui -S
```

### CDN

目前可以通过 [unpkg.com/element-gui](https://unpkg.com/element-gui/) 或者 [www.jsdelivr.com/package/npm/element-gui](https://www.jsdelivr.com/package/npm/element-gui) 获取到最新版本的资源，在页面上引入 js 和 css 文件即可开始使用。

因为组件是基于element-ui二次封装，老项目里面已经引用了element-gui，也可以只引用组件样式，达到风格快速统一！

```html
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-gui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-gui/lib/index.js"></script>

<!-- 或者 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/element-gui/lib/theme-chalk/index.css">
<script src="https://cdn.jsdelivr.net/npm/element-gui/lib/index.js"></script>
```

:::tip
我们建议使用 CDN 引入组件的用户在链接地址上锁定版本，以免将来组件升级时受到非兼容性更新的影响。
:::

如果是通过 npm 安装，并希望配合 webpack 使用，请阅读下一节：[快速上手](/#/component/quickstart)。