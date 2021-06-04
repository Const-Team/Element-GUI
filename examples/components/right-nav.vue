<template>
  <div class="right-nav" v-if="anchors">
    <ul>
      <li v-for="item in anchors" :key="item" class="right-nav-link">
        <el-link :id="item" :title="item" class="link" :type="active === item ? 'primary' : 'default'" @click="handleAnchorClick(item)">
          {{ item }}
        </el-link>
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
    this.$nextTick(() => {
      const map = this.map;
      this.scrollContainer = document.querySelector(
        '.el-scrollbar.page-component__scroll>.el-scrollbar__wrap'
      );
      const content = document.querySelector('.content.element-doc.content');
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
          document.getElementById(that.active) &&
            document.getElementById(that.active).focus();
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
  beforeUnmount() {
    this.resizeObserver.disconnect();
  },
  methods: {
    handleAnchorClick(anchor) {
      this.scrollContainer.scrollTop = this.map.get(anchor);
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
  ul{
    margin: 0;
    padding: 0;
    width: calc(100% + 17px);
    height: calc(100% + 17px);
    overflow: scroll;
  }
  .right-nav-link {
    margin: 3px 0;
    list-style: none;
    .link {
      ::v-deep span {
        font-size: 12px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }
    }
  }
}
@media (max-width: 1490px) {
  .right-nav {
    display: none;
  }
}
</style>