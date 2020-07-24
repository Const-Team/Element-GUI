<script>
  export default {
    created() {
      
    },
    mounted() {
    },
    methods: {
      
    },
    data() {
      return {
        primary:["#E7F3FF","#B9DDFF","#71BBFF","#46A6FF","#2E9BFF","#1890FF","#0084FF","#0A73D3","#0765BB","#00519B"],
        success:["#EFF8E7","#D1EBB9","#94D857","#83D13E","#74C829","#66BF16","#60AC1B","#589E19","#52911A","#3C7F01"],
        warning:["#FCF6E5","#F7E6B2","#F8D475","#F9C440","#F2BF30","#E6AD00","#D49F16","#C38F0A","#B28102","#986604"],
        danger:["#FFEDED","#FFC9CB","#FF9EA2","#FF8287","#FF646B","#FF4B53","#ED3941","#E02D35","#CC2931","#B41921"],
        info:["#EFEFEF","#E5E5E5","#D9D9D9","#D2D2D2","#B1B1B1","#999999","#777777","#666666","#555555","#3D3E3F"],
        color1:[
          {
            title:"品牌色",
            color:"#1890FF"
          },
          {
            title:"选中背景色",
            color:"#E7F3FF"
          },
          {
            title:"悬停色",
            color:"#46A6FF"
          },
          {
            title:"点击色",
            color:"#0084FF"
          },
        ],
        color2:[
          {
            title:"表单只读背景色",
            color:"#EFEFEF"
          },
          {
            title:"表头背景色",
            color:"#E5E5E5"
          },
          {
            title:"分割线色,边框线色",
            color:"#D2D2D2"
          },
          {
            title:"提示文字颜色",
            color:"#999999"
          },
          {
            title:"表单只读文字色",
            color:"#777777"
          },
          {
            title:"默认文字颜色",
            color:"#555555"
          },
        ],
        color3:[
          {
            title:"链接/说明色",
            color:"#1890FF"
          },
          {
            title:"成功色",
            color:"#66BF16"
          },
          {
            title:"警告色",
            color:"#E6AD00"
          },
          {
            title:"失败色",
            color:"#FF4B53"
          },
        ],
      }
    },
    watch: {
      
    },
  }
</script>

## Color 色彩

任何色彩都有其自身的用途、信息传达目的和载体，把颜色的使用分为“功能性”和“审美性”。

* 功能性：颜色的使用在传递信息过程中符合清晰、准确的目的，这个里面包含颜色本身的数值属性，对比度、明度、色相等问题，传达是否清晰、无障碍。
* 审美性：颜色依托于历史、文化、社会审美趋势等，应关注色彩的整体应用和载体问题。

### 色库表

政务产品的色板由 10 个由浅至深的色彩单元格组成，我们为部分色彩格定义了默认使用场景，用户在进行色彩配色时只需根据关键词选择一条色板即可得到一套完整的系统配色方案。在理论上，在政务产品设计中的色彩都应取自这份色板。注：定制项目以对方企业VI视觉识别系统及产品性质决定，辅助色参照政务产品色库表。

<div class="demo-color">
  <div class="color-describe">专业、信任、科技</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in primary" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

<div class="demo-color">
  <div class="color-describe">成功、通过、安全</div>
    <div class="color-box">
      <div class="color-item" v-for="(item, key) in success" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

<div class="demo-color">
  <div class="color-describe">提示、注意</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in warning" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

<div class="demo-color">
  <div class="color-describe">警告、热情</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in danger" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

<div class="demo-color">
  <div class="color-describe">中性、平稳、正式</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in info" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

### 品牌色的应用
<el-row :gutter="20">
  <el-col :span="18">
  <p>品牌色是体现产品特性和传播理念最直观的视觉元素之一。在色彩选取时，需先了解品牌色在界面中的使用场景及选色范围。以政务产品网页组件的默认样式为例，品牌色主要体现在关键行动点及操作状态、重要信息高亮等场景。 <br/>注：图形插画和 logo 可以不必遵循色板，但需保持相近的色系。</p>
  </el-col>
  <el-col :span="6">
  <div class="demo-color">
    <div class="color-block" :style="{ background: item.color }" v-for="(item,i) in color1">{{item.title}}</div>
  </div>
  </el-col>
</el-row>

### 中性色的应用

<el-row :gutter="20">
  <el-col :span="18">
  <p>灰色（Gray）作为中性色在政务产品web端设计中被大量使用到，它的使用有利于关键内容的衬托和功能的引导。这类色彩主要体现在导航框架、表格标题、背景底色、描边、或次级操作等等。</p>
  </el-col>
  <el-col :span="6">
  <div class="demo-color">
    <div class="color-block" :style="{ background: item.color }" v-for="(item,i) in color2">{{item.title}}</div>
  </div>
  </el-col>
</el-row>




### 功能色的应用

<el-row :gutter="20">
  <el-col :span="18">
  <p>在界面设计中，比较稳定的色彩除了中性色外还有具备特定含义的功能色，这类色彩起到传递功能信息、代表某种状态等作用。主要应用于消息通知、反馈提醒、表单校验这类场景中的成功、出错、失败、提醒、链接等状态。</p>
  </el-col>
  <el-col :span="6">
  <div class="demo-color">
    <div class="color-block" :style="{ background: item.color }" v-for="(item,i) in color3">{{item.title}}</div>
  </div>
  </el-col>
</el-row>