## 前端代码规范 

### 一、目的

提升代码质量，提高阅读性、复用性，加强团队合作能力，提升项目效率。 此文档会根据团队习惯不定期更新，会从更多的优秀开源项目中，汲取更优的编码方案，逐步提升个人及团队能力。 

### 二、适用范围

前端开发人员。 

### 三、基本原则 

#### 1.文件及资源命名 

资源文件命名全部使用小写字母加中横线`-`方式。在某些对大小写字母敏感的操作系统中，当文件通过工具压 缩混淆后，或者人为修改过后，大小写不同而导致引用文件不同的错误，很难被发现。 如`js`文件压缩后的`min`、或 CDN 混淆后的前缀等，使用点分割`.`。 

```
// 可以这样 
mine.js 
my-script.js 
my-camel-case-name.css 
i-love-underscores.html 
thousand-and-one-scripts.js 
my-fifile.min.css 

// 别这样 
MyScript.js 
myCamelCaseName.css 
i_love_underscores.html 
1001-scripts.js 
my-fifile-min.css 
```

#### 2.缩进 

使用4个空格表示一个缩进。 
```
var name = 'Glodon';
function getName () { 
    var age = 10;
    console.log(name);
}
```

#### 3.注释

**A.** 多行注释：一般应用在对文件头或者功能模块注释，在各文件或模块开头部分按以下格式编写。
```json
/**
 * 文件名或者模块名
 * test.js
 * 文件名称或模块的描述说明
 * @version 版本
 * Created by Glodon on 2019.9.23
 * Modifified by Glodon on 2019.9.23
 * @param 参数说明
 * @return 返回的值说明
 */
```

**B.** 单行注释：请在复杂逻辑或关键逻辑节点进行标注，注意缩进与代码保持一致。 
```
function doSomething () {
    if (arguments[0] === true) {
        comeHere(); // 执行xxx
    } else {
        goThere(); //否则xxx
    }
}
```

#### 4.关注点分离 

这里的关注点主要指的是：页面（`HTML` 结构）、外观（`CSS`）和行为（`JavaScript`），严格地保证三者分离。 

#### 5.关于引号 

不论`html`、`js`、`css`，请一律使用单引号`''`。 

#### 6.关于空格

**A.** 等号两边各留一个空格。
```
var name = 'Glodon';
var obj = { 
    age: 18 
};
```

**B.** 函数名后面留一个空格。
```
function getName () { 

}
```

**C.** 多个参数时，逗号后面留一个空格。
```
function getName (params1, params2, params3) { 

}
```

#### 7.语句结尾 

不要依赖于`ASI`机制，不要省略分号，请这样写： 
```
var name = 'Glodon'; 
function getName () {
    console.log(name);
};
getName();
```

基于`ASI`，这样也合法，但请不要这样写：
```
var nameBad = 'Glodon' 
function getName () {
    console.log(nameBad)
}
getName();
```

`ASI`会自动寻找应当使用分号，但是没有使用的位置，并自动插入分号。大部分情景会正确插入，但请看如下示例：
```
//原始代码
function getName () { 
    return
    {
        name: 'Glodon'
    }
}
console.log(getName()); 

//分析器会把它解析成 
function getName () { 
    return;
    {
        name: 'Glodon'
    };
}
console.log(getName()); 
```

原本应该返回对象，但是插入分号后，此函数返回值就变为了`undefined`。 

#### 8.变量命名规则 ：变量名采用**驼峰式**，由小写字母开始，后续每个单词首字母大写 

```
var count = 10,
myName = 'Dio Zhu',
tag = true;
function getMyName () {
    return myName;
}
```

#### 9.常量命名规则：请以**全部大写**的形式，多个单词之间用下划线。 

```
var MAX_COUNT = 10, 
URL = 'http://www.test.com'; 
```

#### 10.语句和表达式 

**A.** 单行逻辑不要省略花括号 
```
// 可以这样 
function doSomething () { 
    if (arguments[0] === true) { 
        console.log(arguments[0]); 
    }
}

// 别这样 
function doSomething () { 
    // 尽管合法 
    if (arguments[0] === true) console.log(arguments[0]); 
    // 尽管合法 
    if (arguments[0] === true) 
    console.log(arguments[0]); 
    // 尽管合法 
    if (arguments[0] === true) { console.log(arguments[0]); } 
}
```

**B.** `for`循环：请在循环外定义变量；变量声明遵循表达式放在首位，变量放在末尾的顺序； 循环中条件的判断请放在首位，避免每次循环时重新计算的损耗；
```
var arr = [1, 2, 3, 4, 5], // 赋值请放在靠前的位置 
i, len; // 其他变量声明可以放在行尾 

// 把len提前,避免循环时的重复计算 
for (i = 0, len = arr.length; i < len; i++) { 
    console.log(i); 
}
```

**C.** 简单条件判断尽量使用三元运算符
```
var a = true, num;
if (a) {
    num = 100;
} else {
    num = 0;
}
//可以写成这样
num = a ? 100 : 0;
```

#### 11.变量、函数和运算符 

**A.** 尽可能少使用全局变量，合理使用闭包，避免内存泄漏；  
**B.** 多个变量声明时尽量使用单`var`语句；  
**C.** 推荐严格模式`use strict`，但请用于函数中，不推荐在全局使用；  
**D.** 除非刻意利用隐式转换的情况下可以使用`==`、`!=`，其他情况用严格比较条件 `===`、`!==`。

#### 12.HTML及CSS部分 

**A.** 类名尽量见名知意，为多个单词时，使用小写字母加中划线`-`连接单词间，方便`less`，`scss`样式书写；  
**B.** 自定义属性要以`data-`开头；  
**C.** 尽量少使用`id`定义样式，不仅是因为复用性，使用`id`后会影响选择器的权重；  
**D.** `td`要在`tr`里面，`li`要在`ul/ol`里面，`ul/ol`的直接子元素只能是`li`，`tr`的直接子元素都应该是`td`、`th`；  
**E.** 行内元素里面不可使用块级元素；  
**F.** 少用`!important`；  
**G.** CSS书写规则：

* 非引入第三方组件禁止使用行内样式；
* 非预处理语言或公共样式要求`CSS`样式与`DOM`结构完全解耦的方式书写样式。
```
<!-- 推荐格式 -->
<div class="a">
  <span class="b"></span>
</div>

.a{
  width:10px;
}
.b{
  display:inline-block;
}

<!-- 不推荐格式 -->
<div>
  <span></span>
</div>

div{
 width:10px;
}
div span{
  display:inline-block;
}
```

* 预处理语言（`less`、`sass`、`scss`）独立页面样式要求层级递进方式书写，避免干扰其他样式。
```
<!-- 推荐格式 -->
<div class="main">
  <div class="main-left"></div>
  <div class="main-right"></div>
</div>

.main {
    color: red;
    font-size: 12px;
    &-left {
        font-size: 16px;
    }
    &-right {
        color: green;
    }
}
```
* `CSS`选择器嵌套最好不要超过**3**层
```
.main ul li a {
    color: red;
}

// 可以写成
.main li a {
    color: red;
}

// 或者
.main a {
    color: red;
}

// 或者
.main .a-style {
    color: red;
}
```

* 常用命名

| 模块名称 | 命名 |
| -------- | ---- |
|容器：|`container`  |
|页头：|`header`  |
|内容：|`content/container`  |
|页面主体：|`main`  |
|页尾：|`footer`  |
|导航：|`nav`  |
|侧栏：|`sidebar`  |
|栏目：|`column`  |
|页面外围控制整体布局宽度：|`wrapper`  |
|左右中：|`left right center`  |
|标志：|`logo`  |
|广告：|`banner`  |
|登陆：|`login`  |
|登录条：|`loginbar`  |
|注册：|`regsiter`  |
|搜索：|`search`  |
|功能区：|`shop`  |
|标题：|`title`  |
|加入：|`joinus`  |
|状态：|`status`  |
|按钮：|`btn`  |
|滚动：|`scroll`  |
|标签页：|`tab`  |
|文章列表：|`list`  |
|提示信息：|`msg`  |
|当前的：|`current`  |
|小技巧：|`tips`  |
|图标：|`icon`  |
|注释：|`note`  |
|指南：|`guild`  |
|服务：|`service`  |
|热点：|`hot`  |
|新闻：|`news`  |
|下载：|`download`  |
|投票：|`vote`  |
|合作伙伴：|`partner`  |
|友情链接：|`link`  |
|导航：|`nav`  |
|主导航：|`mainbav`  |
|子导航：|`subnav`  |
|顶导航：|`topnav`  |
|边导航：|`sidebar`  |
|左导航：|`leftsidebar`  |
|右导航：|`rightsidebar`  |
|菜单：|`menu`  |
|子菜单：|`submenu`  |
|标题：|`title`  |
|摘要：|`summary`  |

#### 13.VUE部分 

**A.** 代码格式化设置（`文件-首选项-设置-settings.json`），不生效请安装对应插件。

```json
{
    // 调整窗口的缩放级别。原始大小是 0，每次递增(例如 1)或递减(例如 -1)表示放大或缩小 20%。也可以输入小数以便以更精细的粒度调整缩放级别。
    "window.zoomLevel": 0,
    // 指定工作台中使用的颜色主题。
    "workbench.colorTheme": "Monokai",
    // 窗口失去焦点自动保存
    "files.autoSave": "off",
    // 如果设置为 "true"，将不再显示扩展建议的通知。
    "extensions.ignoreRecommendations": true,
    // 如果设置成 true，关于新的版本消息将不再显示
    // 控制是否将打开的编辑器显示为预览。
    "workbench.editor.enablePreview": false,
    //代码缩进风格4个字符
    "editor.tabSize": 4,
    "editor.fontSize": 18,
    // 控制编辑器是否应在键入后自动设置行的格式
    "editor.formatOnType": false,
    // 保存时取消自动格式化
    "editor.formatOnSave": false,
    // 编辑粘贴取消自动格式化
    "editor.formatOnPaste": false,
    // 控制编辑器中呈现空白字符的方式为“边界”，不会在单词之间呈现单空格。
    "editor.renderWhitespace": "boundary",
    // 控制光标动画样式
    "editor.cursorBlinking": "smooth",
    // 控制是否将代码段与其他建议一起显示以及它们的排序方式。
    "editor.snippetSuggestions": "top",
    // 配置语言的文件关联
    "files.associations": {
        "*.vue": "vue"
    },
    //打开或关闭自动保存
    "eslint.autoFixOnSave": false,
    "eslint.options": {
        "extensions": [
            ".js",
            ".vue"
        ]
    },
    //设置Eslint需要验证的语言
    "eslint.validate": [
        "javascript",
        "javascriptreact",
        {
            "language": "html",
            "autoFix": true
        },
        {
            "language": "vue",
            "autoFix": true
        }
    ],
    //配置 glob 模式以在搜索中排除文件和文件夹。
    "search.exclude": {
        "**/node_modules": true,
        "**/bower_components": true,
        "**/dist": true
    },
    // 为指定的语法定义配置文件或使用带有特定规则的配置文件。
    "emmet.syntaxProfiles": {
        "javascript": "jsx",
        "vue": "html",
        "vue-html": "html"
    },
    //默认格式化js插件
    "vetur.format.defaultFormatter.js": "vscode-typescript",
    //默认格式化html插件
    "vetur.format.defaultFormatter.html": "prettyhtml",
    //vetur格式化时初始化script缩进
    "vetur.format.scriptInitialIndent": true,
    //vetur格式化时初始化style缩进
    "vetur.format.styleInitialIndent": true,
    //vetur格式化时初始化style缩进
    "vetur.format.options.tabSize": 4,
    //vetur格式化时初始化html配置
    "vetur.format.defaultFormatterOptions": {
        "js-beautify-html": {
            //设置html属性是否换行
            "wrap_attributes": "auto"
        },
        // "prettyhtml": {
        //     "printWidth": 120,
        //     "singleQuote": false,
        //     "wrapAttributes": false,
        //     "sortAttributes": false
        // }
    },
    //每列显示内容长多，超出时控制编辑器列的换行。
    "editor.wordWrap": "wordWrapColumn",
    "editor.wordWrapColumn": 130,
    "editor.suggestSelection": "first",
    "workbench.startupEditor": "newUntitledFile",
    "vsicons.dontShowNewVersionMessage": true,
}
```
推荐插件：
* [VS Code 的中文（简体）语言包](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-zh-hans)  
* [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)  
* [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)  
* [Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)

**B.** 规定代码书写顺序如下：

```json
<template>
    <div></div>
</template>

<script>
    //这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
    //例如：import 组件名称 from '组件路径';
    export default {
        //接收传入数据
        props: [], 
        //引入混淆js
        mixins: [], 
        //import引入的组件需要注入到对象中才能使用
        components: {},
        data () {
            //这里存放数据
            return {};
        },
        //监听属性 类似于data概念
        computed: {},
        //监控data中的数据变化
        watch: {},
        //方法集合
        methods: {},
        //生命周期 - 创建完成（可以访问当前this实例）
        created () {},
        //生命周期 - 挂载完成（可以访问DOM元素）
        mounted () {},
        //生命周期 - 创建之前
        beforeCreate () {},
        //生命周期 - 挂载之前
        beforeMount () {},
        //生命周期 - 更新之前
        beforeUpdate () {},
        //生命周期 - 更新之后
        updated () {},
        //生命周期 - 销毁之前
        beforeDestroy () {},
        //生命周期 - 销毁完成
        destroyed () {},
        //如果页面有keep-alive缓存功能，这个函数会触发
        activated () {},
    }
</script>

<style lang='scss'>
    //@import '';
</style>
```

**C.** 利用用户代码片段生成模板（`文件-首选项-用户代码片段-vue.json`）

```
    "alog": {
        "prefix": "alog",
        "body": [
            "console.log('$1');"
        ],
        "description": "Log output to console"
    },
    "avue": {
        "prefix": "avue",
        "body": [
            "<template>",
            "<div>$5</div>",
            "</template>",
            "",
            "<script>",
            "//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）",
            "//例如：import 《组件名称》 from '《组件路径》';",
            "export default {",
            "//引入组件",
            "props: [",
            "",
            "],",
            "//引入混淆",
            "mixins: [",
            "",
            "],",
            "//import引入的组件需要注入到对象中才能使用",
            "components: {",
            "",
            "},",
            "data() {",
            "//这里存放数据",
            "return {",
            "",
            "};",
            "},",
            "//监听属性 类似于data概念",
            "computed: {",
            "",
            "},",
            "//监控data中的数据变化",
            "watch: {",
            "",
            "},",
            "//方法集合",
            "methods: {",
            "",
            "},",
            "//生命周期 - 创建完成（可以访问当前this实例）",
            "created() {",
            "",
            "},",
            "//生命周期 - 挂载完成（可以访问DOM元素）",
            "mounted() {",
            "",
            "},",
            "//生命周期 - 创建之前",
            "beforeCreate() {",
            "",
            "},",
            "//生命周期 - 挂载之前",
            "beforeMount() {",
            "",
            "},",
            "//生命周期 - 更新之前",
            "beforeUpdate() {",
            "",
            "},",
            "//生命周期 - 更新之后",
            "updated() {",
            "",
            "},",
            "//生命周期 - 销毁之前",
            "beforeDestroy() {",
            "",
            "},",
            "//生命周期 - 销毁完成",
            "destroyed() {",
            "",
            "},",
            "//如果页面有keep-alive缓存功能，这个函数会触发",
            "activated() {",
            "",
            "},",
            "}",
            "</script>",
            "",
            "<style lang='scss'>",
            "//@import '$3';",
            "</style>"
        ],
        "description": "Log output to vue-templete"
    }
```

**D.** 设置`eslint`代码检查（推荐，不强制）
```json
// https://eslint.org/docs/user-guide/configuring
module.exports = {
    root: true,
    parserOptions: {
        parser: 'babel-eslint'
    },
    env: {
        browser: true,
    },
    extends: [
        // https://github.com/vuejs/eslint-plugin-vue#priority-a-essential-error-prevention
        // consider switching to `plugin:vue/strongly-recommended` or `plugin:vue/recommended` for stricter rules.
        'plugin:vue/essential',
        // https://github.com/standard/standard/blob/master/docs/RULES-en.md
        // '@vue/standard'
        //   'standard'
    ],
    // required to lint *.vue files
    plugins: [
        'vue'
    ],
    // add your custom rules here
    rules: {
        'no-console': process.env.NODE_ENV === 'production' ? 2 : 0, //测试环境关掉console报错
        'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0, //测试环境关掉debugger报错
        "no-undef": 0, //不允许未声明的变量
        "no-unused-vars": [0, { "vars": "all", "args": "none" }], //不允许有声明后未使用的变量或者参数
        "no-tabs": 0, //允许tabs
        "no-mixed-spaces-and-tabs": [0, "smart-tabs"], //允许混用tab和空格
        "indent": [0, 4], //缩进风格
        "camelcase": [0, { "properties": "never" }], //强制驼峰命名规则
        "space-before-function-paren": [0, { "anonymous": "always", "named": "never" }], //函数定义时括号前的空格
        "arrow-parens": 0, //箭头函数用小括号括起来
        "semi": [0, "always"], //语句强制分号结尾
        "no-extra-parens": 2, //禁止非必要的括号
        "no-extra-semi": 2, //禁止多余的冒号
        "quotes": [2, "single"], //引号类型为单引号
        "space-after-keywords": [0, "always"], //关键字后面是否要空一格
        'generator-star-spacing': 0, // 生成器函数*的前后空格
        "eol-last": 0, //文件以单一的换行符结束
        "no-multiple-empty-lines": [0, { "max": 100 }],
    }
}
```

**E.** 语法规则

* 使用`let\const`代替`var`声明变量；
* 使用箭头函数代替`function`；
* 使用`export`方式导出模块，`import  from` 方式导入模块；
* 使用`class`定义构造函数，使用 `class extends`方式继承；
* 推荐使用解构赋值，字符串模板，`async await`，`promise`，新的数组及对象方法等`ES6`、`ES7`新语法；

```jsx
// es6继承
class Animal {
    //构造函数，里面写上对象的属性
    constructor (props) {
        this.name = props.name || 'Unknown';
    };
    //方法写在后面
    eat () {//父类共有的方法
        console.log(this.name + " will eat pests.");
    };
}
//class继承
class Bird extends Animal {
    //构造函数
    constructor (props, myAttribute) {//props是继承过来的属性，myAttribute是自己的属性
    //调用实现父类的构造函数
        super(props)//相当于获得父类的this指向
        this.type = props.type || "Unknown";//父类的属性，也可写在父类中
        this.attr = myAttribute;//自己的私有属性
    };
    fly () {//自己私有的方法
        console.log(this.name + " are friendly to people.");
    };
    myattr () {//自己私有的方法
        console.log(this.type+'---'+this.attr);
    };
}
//通过new实例化
var myBird = new Bird({
    name: '小燕子',
    type: 'Egg animal'//卵生动物
},'Bird class');
myBird.eat();
myBird.fly();
myBird.myattr();
```