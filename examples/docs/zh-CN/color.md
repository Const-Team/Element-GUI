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
      }
    },
    watch: {
      
    },
  }
</script>

## Color 色彩

为了避免视觉传达差异，使用一套特定的调色板来规定颜色，为你所搭建的产品提供一致的外观视觉感受。

### 主色

主要品牌颜色是鲜艳、友好的蓝色。

<div class="demo-color">
  <div class="color-describe">专业、信任、科技</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in primary" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>

### 辅助色

除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。

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



### 中性色

中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。

<div class="demo-color">
  <div class="color-describe">中性、平稳、正式</div>
    <div class="color-box">
    <div class="color-item" v-for="(item, key) in info" :key="key" :style="{ background: item }">{{item}}</div>
  </div>
</div>
