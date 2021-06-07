<template>
  <div class="right-nav" v-if="anchors">
    <ul>
      <li :id="item" v-for="(item, i) in anchors" :key="'item' + i" class="right-nav-link" :class="active === item ? 'primary' : 'default'">
        <div class="line"></div>
        <em :title="item" class="link" @click="handleAnchorClick(item)">{{ item }}</em>
      </li>
    </ul>
  </div>
</template>

<script>
import ElScrollbar from 'element-gui/packages/scrollbar';
import ElLink from 'element-gui/packages/link';
import ResizeObserver from 'resize-observer-polyfill';
export default {
  components: {
    ElScrollbar,
    ElLink
  },
  mounted() {
    if (!Array.from) {
      Array.from = function(el) {
        return Array.apply(this, el);
      };
    };
    this.$nextTick(() => {
      const map = this.map;
      this.scrollContainer = document.querySelector(
        '.el-scrollbar.page-component__scroll>.el-scrollbar__wrap'
      );
      const content = document.querySelector('.element-doc');
      if (!content) return;
      const h3 = content.querySelectorAll('h3');
      this.anchors = Array.from(h3).map((item) => {
        const text = item.childNodes[1].textContent.trim();
        map.set(text, item.offsetTop);
        return text;
      });
      let mapValues = Array.from(map.values()).reverse();
      let mapKeys = Array.from(map.keys()).reverse();
      this.resizeObserver = new ResizeObserver(() => {
        Array.from(h3).forEach((item) => {
          const text = item.childNodes[1].textContent.trim();
          map.set(text, item.offsetTop);
        });
        mapValues = Array.from(map.values()).reverse();
        mapKeys = Array.from(map.keys()).reverse();
      });
      this.resizeObserver.observe(this.scrollContainer.childNodes[0]);
      let cachedIndex = -1;
      let that = this;
      this.scrollContainer.addEventListener('scroll', () => {
        const index = mapValues.findIndex(
          (item) => that.scrollContainer.scrollTop > item - 75
        );
        if (cachedIndex !== index && index !== -1) {
          that.active = mapKeys[index];
          cachedIndex = index;
          if (document.getElementById(that.active)) {
            document.getElementById(that.active).focus();
            document.getElementById(that.active).scrollIntoView(true);
          }
        }
      });
    });
  },
  data() {
    return {
      scrollContainer: null,
      anchors: [],
      active: '',
      resizeObserver: null,
      /* global Map*/
      map: new Map()
    };
  },
  methods: {
    handleAnchorClick(anchor) {
      this.scrollContainer.scrollTop = this.map.get(anchor) - 10;
      this.active = anchor;
    }
  }
};
</script>

<style lang="scss">
.right-nav {
  position: fixed;
  right: 10px;
  top: 70px;
  width: 210px;
  margin-left: 10px;
  height: calc(100% - 140px);
  overflow: hidden;
  ul {
    margin: 0;
    padding: 0;
    width: calc(100% + 17px);
    height: 100%;
    overflow-y: scroll;
    .right-nav-link:last-child{
      .line{
        border-left-color: transparent;
      }
    }
  }
  .right-nav-link {
    position: relative;
    list-style: none;
    line-height: 26px;
    .link:hover{
      color: #46a6ff
    }
    &.primary{
      .line{
        &::before{
          background-color: #46a6ff;
        }
      }
      .link{
        color: #46a6ff;
      }
    }
    .line{
      position: absolute;
      top: 13px;
      left: 4px;
      height: 100%;
      border-left: 1px solid #d2d2d2;
      &::before{
        content: '';
        position: absolute;
        left: -4px;
        top: -4px;
        background-color: #d2d2d2;
        width: 7px;
        height: 7px;
        border-radius: 50%;
      }
    }
    .link {
      display: inline-block;
      width: 190px;
      font-style: normal;
      margin-left: 15px;
      font-size: 12px;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
      cursor: pointer;
    }
  }
}
@media (max-width: 1490px) {
  .right-nav {
    display: none;
  }
  .page-component .page-component__content {
    padding-right: 20px !important;
  }
}
</style>