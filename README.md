[![element-gui (latest)](https://img.shields.io/npm/v/element-gui/latest.svg)](https://www.npmjs.com/package/element-gui)  [![element-gui (downloads)](https://img.shields.io/npm/dy/element-gui.svg)](https://www.npmjs.com/package/element-gui) 
![Build and Deploy](https://github.com/Const-Team/Element/workflows/Build%20and%20Deploy/badge.svg)  ![NPM Publish](https://github.com/Const-Team/Element/workflows/NPM%20Publish/badge.svg)  [![Netlify Status](https://api.netlify.com/api/v1/badges/f4287430-5d5b-433b-9822-85c4e5d81a94/deploy-status)](https://app.netlify.com/sites/element-gui/deploys)
[![node](https://img.shields.io/node/v/element-gui/latest.svg)](https://www.npmjs.com/package/element-gui) [![MIT](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/Const-Team/Element/blob/master/LICENSE)

----

## 安装

组件会根据现有bug进行升级，使用前请查看[更新日志](https://uxd.const.team/#/component/changelog)，但是建议在使用某一版本稳定后，请锁死版本，以免将来组件升级时受到非兼容性更新的影响。

### npm 安装

推荐使用 npm 的方式安装，它能更好地和 [webpack](https://webpack.js.org/) 打包工具配合使用。

```shell
npm i element-gui -S
```

### CDN

目前可以通过 [unpkg.com/element-gui](https://unpkg.com/element-gui/) 或者 [www.jsdelivr.com/package/npm/element-gui](https://www.jsdelivr.com/package/npm/element-gui) 获取到最新版本的资源，在页面上引入 js 和 css 文件即可开始使用。

因为组件是基于element-ui二次封装，老项目里面已经引用了element-ui，也可以只引用组件样式，达到风格快速统一！

```html
<!-- 引入样式 -->
<link rel="stylesheet" href="https://unpkg.com/element-gui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-gui/lib/index.js"></script>

<!-- 或者 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/element-gui/lib/theme-chalk/index.css">
<script src="https://cdn.jsdelivr.net/npm/element-gui/lib/index.js"></script>
```

## 快速上手

### 引入 Element

你可以引入整个 Element，或是根据需要仅引入部分组件。我们先介绍如何引入完整的 Element。

#### 完整引入

在 main.js 中写入以下内容：

```javascript
import Vue from 'vue';
import ElementUI from 'element-gui';
import 'element-gui/lib/theme-chalk/index.css';
import App from './App.vue';

Vue.use(ElementUI);

new Vue({
  el: '#app',
  render: h => h(App)
});
```

以上代码便完成了 Element 的引入。需要注意的是，样式文件需要单独引入。

#### 定制样式

如需修改，请使用饿了么提供的[自定义主题工具](https://github.com/ElementUI/element-theme)。

Element 默认提供一套主题，CSS 命名采用 BEM 的风格，方便使用者覆盖样式。我们提供了四种方法，可以进行不同程度的样式自定义。

##### 仅替换主题色

如果仅希望更换 Element 的主题色，推荐使用[在线主题生成工具](https://elementui.github.io/theme-chalk-preview)。Element 默认的主题色是鲜艳、友好的蓝色。通过替换主题色，能够让 Element 的视觉更加符合具体项目的定位。

使用上述工具，可以很方便地实时预览主题色改变之后的视觉，同时它还可以基于新的主题色生成完整的样式文件包，供直接下载使用（关于如何使用下载的主题包，请参考本节「引入自定义主题」和「搭配插件按需引入组件主题」部分）。

##### 在项目中改变 SCSS 变量

Element 的 theme-chalk 使用 SCSS 编写，如果你的项目也使用了 SCSS，那么可以直接在项目中改变 Element 的样式变量。新建一个样式文件，例如 `element-variables.scss`，写入以下内容：

```CSS
/* 改变主题色变量 */
$--color-primary: teal;

/* 改变 icon 字体路径变量，必需 */
$--font-path: '~element-gui/lib/theme-chalk/fonts';

@import "~element-gui/packages/theme-chalk/src/index";
```

之后，在项目的入口文件中，直接引入以上样式文件即可（无需引入 Element 编译好的 CSS 文件）：

```JS
import Vue from 'vue'
import Element from 'element-gui'
import './element-variables.scss'

Vue.use(Element)
```

常用颜色变量：
```CSS
$--color-primary: #1890ff !default;
$--color-success: #66bf16 !default;
$--color-warning: #e6ad00 !default;
$--color-danger: #ff4b53 !default;
$--color-info: #999999 !default;
$--color-text-primary: #555555 !default;
$--color-text-regular: #555555 !default;
$--color-text-secondary: #555555 !default;
$--color-text-placeholder: #999999 !default;
$--border-color-base: #d2d2d2 !default;
$--border-color-light: #d2d2d2 !default;
$--border-color-lighter: #d2d2d2 !default;
$--border-color-extra-light: #d2d2d2 !default;
$--font-color-disabled-base: #777 !default;
$--icon-color: #999999 !default;
```

需要注意的是，覆盖字体路径变量是必需的，将其赋值为 Element 中 icon 图标所在的相对路径即可。

#### 按需引入

借助 [babel-plugin-component](https://github.com/QingWei-Li/babel-plugin-component)，我们可以只引入需要的组件，以达到减小项目体积的目的。

首先，安装 babel-plugin-component：

```bash
npm install babel-plugin-component -D
```

然后，将 .babelrc 修改为：

```json
{
  "presets": [["es2015", { "modules": false }]],
  "plugins": [
    [
      "component",
      {
        "libraryName": "element-gui",
        "styleLibraryName": "theme-chalk"
      }
    ]
  ]
}
```

接下来，如果你只希望引入部分组件，比如 Button 和 Select，那么需要在 main.js 中写入以下内容：

```javascript
import Vue from 'vue';
import { Button, Select } from 'element-gui';
import App from './App.vue';

Vue.component(Button.name, Button);
Vue.component(Select.name, Select);
/* 或写为
 * Vue.use(Button)
 * Vue.use(Select)
 */

new Vue({
  el: '#app',
  render: h => h(App)
});
```

完整组件列表和引入方式（完整组件列表以 [components.json](https://github.com/ElemeFE/element/blob/master/components.json) 为准）

```javascript
import Vue from 'vue';
import {
  Affix,
  Pagination,
  Dialog,
  Autocomplete,
  Dropdown,
  DropdownMenu,
  DropdownItem,
  Menu,
  Submenu,
  MenuItem,
  MenuItemGroup,
  Input,
  InputNumber,
  Radio,
  RadioGroup,
  RadioButton,
  Checkbox,
  CheckboxButton,
  CheckboxGroup,
  Switch,
  Select,
  Option,
  OptionGroup,
  Button,
  ButtonGroup,
  Table,
  TableColumn,
  DatePicker,
  TimeSelect,
  TimePicker,
  Popover,
  Popconfirm,
  Tooltip,
  Breadcrumb,
  BreadcrumbItem,
  Form,
  FormItem,
  Tabs,
  TabPane,
  Tag,
  Tree,
  TreeSelect,
  Alert,
  Slider,
  Icon,
  Row,
  Col,
  Upload,
  Progress,
  Spinner,
  Badge,
  Card,
  Rate,
  Steps,
  Step,
  Carousel,
  CarouselItem,
  Collapse,
  CollapseItem,
  Cascader,
  ColorPicker,
  Transfer,
  Container,
  Header,
  Aside,
  Main,
  Footer,
  Timeline,
  TimelineItem,
  Link,
  Divider,
  Image,
  Calendar,
  CalendarPro,
  Backtop,
  PageHeader,
  CascaderPanel,
  Loading,
  MessageBox,
  Message,
  Notification,
  LoadingBar
} from 'element-gui';

Vue.use(Affix);
Vue.use(Pagination);
Vue.use(Dialog);
Vue.use(Autocomplete);
Vue.use(Dropdown);
Vue.use(DropdownMenu);
Vue.use(DropdownItem);
Vue.use(Menu);
Vue.use(Submenu);
Vue.use(MenuItem);
Vue.use(MenuItemGroup);
Vue.use(Input);
Vue.use(InputNumber);
Vue.use(Radio);
Vue.use(RadioGroup);
Vue.use(RadioButton);
Vue.use(Checkbox);
Vue.use(CheckboxButton);
Vue.use(CheckboxGroup);
Vue.use(Switch);
Vue.use(Select);
Vue.use(TreeSelect);
Vue.use(Option);
Vue.use(OptionGroup);
Vue.use(Button);
Vue.use(ButtonGroup);
Vue.use(Table);
Vue.use(TableColumn);
Vue.use(DatePicker);
Vue.use(TimeSelect);
Vue.use(TimePicker);
Vue.use(Popover);
Vue.use(Popconfirm);
Vue.use(Tooltip);
Vue.use(Breadcrumb);
Vue.use(BreadcrumbItem);
Vue.use(Form);
Vue.use(FormItem);
Vue.use(Tabs);
Vue.use(TabPane);
Vue.use(Tag);
Vue.use(Tree);
Vue.use(Alert);
Vue.use(Slider);
Vue.use(Icon);
Vue.use(Row);
Vue.use(Col);
Vue.use(Upload);
Vue.use(Progress);
Vue.use(Spinner);
Vue.use(Badge);
Vue.use(Card);
Vue.use(Rate);
Vue.use(Steps);
Vue.use(Step);
Vue.use(Carousel);
Vue.use(CarouselItem);
Vue.use(Collapse);
Vue.use(CollapseItem);
Vue.use(Cascader);
Vue.use(ColorPicker);
Vue.use(Transfer);
Vue.use(Container);
Vue.use(Header);
Vue.use(Aside);
Vue.use(Main);
Vue.use(Footer);
Vue.use(Timeline);
Vue.use(TimelineItem);
Vue.use(Link);
Vue.use(Divider);
Vue.use(Image);
Vue.use(Calendar);
Vue.use(CalendarPro);
Vue.use(Backtop);
Vue.use(PageHeader);
Vue.use(CascaderPanel);
Vue.use(LoadingBar);

Vue.use(Loading.directive);

Vue.prototype.$loading = Loading.service;
Vue.prototype.$msgbox = MessageBox;
Vue.prototype.$alert = MessageBox.alert;
Vue.prototype.$confirm = MessageBox.confirm;
Vue.prototype.$prompt = MessageBox.prompt;
Vue.prototype.$notify = Notification;
Vue.prototype.$message = Message;
Vue.prototype.$loadingbar = LoadingBar;
```

### 全局配置

在引入 Element 时，可以传入一个全局配置对象。该对象目前支持 `size` 、`zIndex` 、`duration` 字段。`size` 用于改变组件的默认尺寸，`zIndex` 设置弹框的初始 z-index（默认值：2000）。`duration`设置消息提示和通知的显示时间。按照引入 Element 的方式，具体操作如下：

完整引入 Element：

```js
import Vue from 'vue';
import Element from 'element-gui';
Vue.use(Element, { size: 'small', zIndex: 3000 , duration: 5000 });
```

按需引入 Element：

```js
import Vue from 'vue';
import { Button } from 'element-gui';

Vue.prototype.$ELEMENT = { size: 'small', zIndex: 3000 , duration: 5000 };
Vue.use(Button);
```

按照以上设置，项目中所有拥有 `size` 属性的组件的默认尺寸均为 'small'，弹框的初始 z-index 为 3000，消息提示持续时间为5秒。

### 开始使用

至此，一个基于 Vue 和 Element 的开发环境已经搭建完毕，现在就可以编写代码了。各个组件的使用方法请参阅它们各自的文档。

## 感谢

组件基于 `element-ui` 做了二次封装，感谢饿了么前端团队开源！

## 版权

[MIT](LICENSE)
