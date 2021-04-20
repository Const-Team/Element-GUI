<template>
  <div class="el-empty">
    <div class="el-empty__image" :style="imageStyle">
      <img v-if="image" :src="image" ondragstart="return false">
      <slot v-else name="image">
        <img-empty />
      </slot>
    </div>
    <div class="el-empty__description">
      <slot v-if="$slots.description" name="description"></slot>
      <p v-else>{{ description || t('el.table.emptyText') }}</p>
    </div>
    <div v-if="$slots.default" class="el-empty__bottom">
      <slot></slot>
    </div>
  </div>
</template>

<script>
import Locale from 'element-gui/src/mixins/locale';
import ImgEmpty from './img-empty.vue';
export default {
  name: 'ElEmpty',
  mixins: [Locale],
  components: {
    ImgEmpty
  },
  props: {
    image: {
      type: String,
      default: ''
    },
    imageSize: Number,
    description: {
      type: String,
      default: ''
    }
  },
  computed: {
    imageStyle() {
      return { width: this.imageSize ? `${this.imageSize}px` : '' };
    }
  }
};
</script>
