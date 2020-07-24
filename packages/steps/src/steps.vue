<template>
  <div
    class="el-steps"
    :class="[
       !simple && 'el-steps--' + direction,
       simple && 'el-steps--simple',
       simple && average && 'is-average',
       button && 'el-steps--button'
     ]">
      <slot></slot>
  </div>
</template>

<script>
import Migrating from 'element-gui/src/mixins/migrating';

export default {
  name: 'ElSteps',

  mixins: [Migrating],

  props: {
    space: [Number, String],
    active: Number,
    direction: {
      type: String,
      default: 'horizontal'
    },
    alignCenter: Boolean,
    simple: Boolean,
    average: Boolean,
    button: Boolean,
    finishStatus: {
      type: String,
      default: 'finish'
    },
    processStatus: {
      type: String,
      default: 'process'
    }
  },

  data() {
    return {
      steps: [],
      stepOffset: 0
    };
  },

  methods: {
    getMigratingConfig() {
      return {
        props: {
          'center': 'center is removed.'
        }
      };
    }
  },

  watch: {
    active(newVal, oldVal) {
      this.$emit('change', newVal, oldVal);
    },

    steps(steps) {
      steps.forEach((child, index) => {
        child.index = index;
      });
    }
  }
};
</script>
