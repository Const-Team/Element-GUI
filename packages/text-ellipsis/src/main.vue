<template>
  <div class="el-text-ellipsis">
    <slot name="before" class="el-text-ellipsis-before"></slot>
    <el-tooltip popper-class="text-ellipsis-tooltip" :disabled="hideTooltip" :effect="effect" :max-width="toolTipWidth" :placement="placement" :content="text">
      <span :style="textStyle" :class="textClass" :content="text">
        <span class="el-text-ellipsis-limit-text" :key="keyIndex">{{text}}</span>
        <span class="el-text-ellipsis-more">{{more?more:'…'}}</span>
      </span>
    </el-tooltip>
    <slot name="after" class="el-text-ellipsis-after"></slot>
  </div>
</template>
<script>
import ElTooltip from 'element-gui/packages/tooltip';
export default {
  name: 'ElTextEllipsis',
  components: {
    ElTooltip
  },
  props: {
    text: String,
    height: Number,
    isLimit: {
      type: Boolean,
      default: true
    },
    hideTooltip: {
      type: Boolean,
      default: true
    },
    effect: {
      type: String,
      default: 'dark'
    },
    placement: {
      type: String,
      default: 'top'
    },
    toolTipWidth: {
      type: Number,
      default: 200
    },
    textStyle: [String, Object, Array],
    textClass: [String, Object, Array],
    more: String
  },
  data() {
    return {
      keyIndex: 0,
      isHide: false
    };
  },
  watch: {
    isLimit() {
      this.init();
    },
    text() {
      this.init();
    },
    height() {
      this.init();
    }
  },
  mounted() {
    this.init();
  },
  methods: {
    init() {
      this.keyIndex += 1;
      let more = this.$el.querySelector('.el-text-ellipsis-more');
      more.style.display = 'none';
      if (this.isLimit) {
        this.limitShow();
      }
    },
    limitShow() {
      this.$nextTick(() => {
        let textDom = this.$el.querySelector('.el-text-ellipsis-limit-text');
        let title = this.$el;
        let more = this.$el.querySelector('.el-text-ellipsis-more');
        let n = 1000;
        if (textDom) {
          if (title.offsetHeight > this.height) {
            more.style.display = 'inline-block';
            let text = this.text;
            while (title.offsetHeight > this.height && n > 0) {
              if (title.offsetHeight > this.height * 2) {
                textDom.innerText = text = text.substring(0,Math.floor(text.length / 2));
              } else {
                textDom.innerText = text = text.substring(0, text.length - 1);
              }
              n--;
            }
          }
        }
      });
    }
  }
};
</script>