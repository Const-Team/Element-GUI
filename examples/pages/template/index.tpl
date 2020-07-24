<style lang="scss" scope>
.banner {
  position: relative;
  text-align: center;
  .banner-desc {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 2;
    text-align: left;
    .wrap {
      width: 1200px;
      margin: 230px auto;
    }
    h2 {
      color: #fff;
      font-size: 36px;
      margin-bottom: 20px;
    }

    h3 {
      width: 360px;
      color: #fff;
      font-size: 16px;
      line-height: 36px;
      font-weight: normal;
    }
  }
}
.cards {
  margin: 50px auto 110px;
  width: 1140px;

  .container {
    padding: 0;
    margin: 0 -11px;
    width: auto;
    &::before,
    &::after {
      display: table;
      content: "";
    }
    &::after {
      clear: both;
    }
  }

  li {
    width: 33.33%;
    padding: 0 19px;
    box-sizing: border-box;
    float: left;
    list-style: none;
  }
}
.card {
  height: 430px;
  width: 100%;
  background: #ffffff;
  border: 1px solid #eaeefb;
  border-radius: 5px;
  box-sizing: border-box;
  text-align: center;
  position: relative;
  transition: all 0.3s ease-in-out;
  bottom: 0;

  img {
    margin: 66px auto 60px;
  }
  h3 {
    margin: 0;
    font-size: 18px;
    color: #1f2f3d;
    font-weight: normal;
  }
  p {
    font-size: 14px;
    color: #99a9bf;
    padding: 0 25px;
    line-height: 20px;
  }
  a {
    height: 53px;
    line-height: 52px;
    font-size: 14px;
    color: #1890FF;
    text-align: center;
    border: 0;
    border-top: 1px solid #eaeefb;
    padding: 0;
    cursor: pointer;
    width: 100%;
    position: absolute;
    bottom: 0;
    left: 0;
    background-color: #fff;
    border-radius: 0 0 5px 5px;
    transition: all 0.3s;
    text-decoration: none;
    display: block;

    &:hover {
      color: #fff;
      background: #1890FF;
    }
  }
  &:hover {
    bottom: 6px;
    box-shadow: 0 6px 18px 0 rgba(232, 237, 250, 0.5);
  }
}
@media (max-width: 1140px) {
  .cards {
    width: 100%;
    .container {
      width: 100%;
      margin: 0;
    }
  }
  .banner .container {
    width: 100%;
    box-sizing: border-box;
  }
  .banner img {
    right: 0;
  }
}

@media (max-width: 1000px) {
  .banner .container {
    img {
      display: none;
    }
  }
  .jumbotron {
    display: none;
  }
}

@media (max-width: 768px) {
  .cards {
    li {
      width: 80%;
      margin: 0 auto 20px;
      float: none;
    }
    .card {
      height: auto;
      padding-bottom: 54px;
    }
  }
  .banner-stars {
    display: none;
  }
  .banner-desc {
    #line2 {
      display: none;
    }
    h2 {
      font-size: 32px;
    }
    p {
      width: auto;
    }
  }
}
.theme-intro-b {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: 200;
  .intro-banner {
    position: absolute;
  }
  img {
    width: 300px;
  }
  .title {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    color: #fff;
    text-align: center;
    font-weight: bold;
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    p {
      padding: 0;
      margin: 10px 0;
    }
  }
}
.theme-intro-a {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: 200;
  .mask {
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    background: #000;
    opacity: 0.5;
  }
  .intro-banner {
    top: 50%;
    left: 50%;
    position: fixed;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    box-sizing: border-box;
    text-align: center;
    z-index: 100;
    img {
      width: 100%;
    }
    .intro-text {
      position: absolute;
      top: 50%;
      left: 0;
      right: 0;
      p {
        padding: 0;
        margin: 0;
        font-size: 48px;
        font-weight: bold;
        color: #fff;
      }
    }
  }
}
</style>
<template>
  <div>
    <div class="banner">
      <el-carousel trigger="click" height="600px">
        <el-carousel-item class="banner-item" style="background: #71AFDE;">
          <img src="~examples/assets/images/banner1.png" alt />
          <div class="banner-desc">
            <div class="wrap">
              <h2>指南</h2>
              <h3>了解设计指南，帮助产品设计人员搭建逻辑清晰、结构合理且高效易用的产品。</h3>
            </div>
          </div>
        </el-carousel-item>
        <el-carousel-item class="banner-item" style="background: #66BFC7;">
          <img src="~examples/assets/images/banner2.png" alt />
          <div class="banner-desc">
            <div class="wrap">
              <h2>组件</h2>
              <h3>使用组件 Demo 快速体验交互细节；使用前端框架封装的代码帮助工程师快速开发。</h3>
            </div>
          </div>
        </el-carousel-item>
        <el-carousel-item class="banner-item" style="background: #EAA475;">
          <img src="~examples/assets/images/banner3.png" alt />
          <div class="banner-desc">
            <div class="wrap">
              <h2>资源</h2>
              <h3>下载相关资源，用其快速搭建页面原型或高保真视觉稿，提升产品设计效率。</h3>
            </div>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="cards">
      <ul class="container">
        <li>
          <div class="card">
            <img src="~examples/assets/images/guide.png" alt />
            <h3>指南</h3>
            <p>了解设计指南，帮助产品设计人员搭建逻辑清晰、结构合理且高效易用的产品。</p>
            <router-link active-class="active" to="/guide/g_preface" exact>查看详情</router-link>
          </div>
        </li>
        <li>
          <div class="card">
            <img src="~examples/assets/images/component.png" alt />
            <h3>组件</h3>
            <p>使用组件 Demo 快速体验交互细节；使用前端框架封装的代码帮助工程师快速开发。</p>
            <router-link active-class="active" to="/component/installation" exact>查看详情</router-link>
          </div>
        </li>
        <li>
          <div class="card">
            <img src="~examples/assets/images/resource.png" alt />
            <h3>资源</h3>
            <p>下载相关资源，用其快速搭建页面原型或高保真视觉稿，提升产品设计效率。</p>
            <router-link active-class="active" to="/resource" exact>查看详情</router-link>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
// import throttle from "throttle-debounce/throttle";

export default {
  created() {},
  methods: {
    hideIntroB() {
      this.showIntroB = false;
    },
    hideIntroA() {
      this.showIntroA = false;
      this.showIntroB = true;
    }
  },
  data() {
    return {
      lang: this.$route.meta.lang,
      mainImgOffset: 0,
      showIntroA: false,
      showIntroB: false,
      introBY: 0,
      introBX: 0
    };
  },
  mounted() {
    this.showIntroA = false;
    document.body.classList.add('is-home');
  },
  destroyed() {
    document.body.classList.remove('is-home');
  }
};
</script>