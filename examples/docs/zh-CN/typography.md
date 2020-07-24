<script>
  import bus from '../../bus';
  import { ACTION_USER_CONFIG_UPDATE } from '../../components/theme/constant.js';
  const varMap = [
    '$--font-size-extra-large',
    '$--font-size-large',
    '$--font-size-medium',
    '$--font-size-base',
    '$--font-size-small',
    '$--font-size-extra-small'
  ];
  const original = {
    'font_size_extra_large': '20px',
    'font_size_large': '18px',
    'font_size_medium': '16px',
    'font_size_base': '14px',
    'font_size_small': '13px',
    'font_size_extra_small': '12px'
  }
  export default {
    created() {
      bus.$on(ACTION_USER_CONFIG_UPDATE, this.setGlobal);
    },
    mounted() {
      this.setGlobal();
    },
    methods: {
      tintColor(color, tint) {
        return tintColor(color, tint);
      },
      setGlobal() {
        if (window.userThemeConfig) {
          this.global = window.userThemeConfig.global;
        }
      }
    },
    data() {
      return {
        font_size_large: '16px',
        font_size_medium: '14px',
        font_size_small: '12px',
      }
    },
    watch: {
      
    },
  }
</script>

## Typography 字体

政务产品视觉规范字体的使用与所运行的系统。

### 字体
<div class="demo-term-box">
<el-row :gutter="20" style="margin-bottom:80px">
  <el-col :span="12">
    <img src="../../assets/images/typography/编组.png" alt="">
  </el-col>
  <el-col :span="12">
    <img src="../../assets/images/typography/编组 2.png" alt="">
  </el-col>
</el-row>

<el-row :gutter="20">
  <el-col :span="12">
    <img src="../../assets/images/typography/编组 3.png" alt="">
  </el-col>
  <el-col :span="12">
    <img src="../../assets/images/typography/编组 4.png" alt="">
  </el-col>
</el-row>
</div>

### 字号

<table class="demo-typo-size">
  <tbody>
  <tr
    >
      <td>样式</td>
      <td>字号</td>
      <td class="color-dark-light">行距</td>
      <td class="color-dark-light">场景</td>
    </tr>
    <tr
    :style="{ fontSize: font_size_large }"
    >
      <td>永</td>
      <td class="color-dark-light">{{font_size_large}}</td>
      <td>24px</td>
      <td>顶部导航文字，弹窗头部标题</td>
    </tr>
    <tr
    :style="{ fontSize: font_size_medium }"
    >
      <td>永</td>
      <td class="color-dark-light">{{font_size_medium}}</td>
      <td>21px</td>
      <td>用于大部分文字，如主表单内容、按钮文字、链接</td>
    </tr>
    <tr
    :style="{ fontSize: font_size_small }"
    >
      <td>永</td>
      <td class="color-dark-light">{{font_size_small}}</td>
      <td>18px</td>
      <td>用于提示文字</td>
    </tr>
  </tbody>
</table>

### Font-family 代码

```css
font-family: "Helvetica Neue",Helvetica,"PingFang SC","Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif;
```