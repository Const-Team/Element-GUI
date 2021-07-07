<template>
  <div class="el-switch" :class="{ 'is-disabled': switchDisabled, 'is-checked': checked }" role="switch" :aria-checked="checked" :aria-disabled="switchDisabled" @click.prevent="switchValue">
    <input class="el-switch__input" type="checkbox" @change="handleChange" ref="input" :id="id" :name="_elFormItemName" :true-value="activeValue" :false-value="inactiveValue" :disabled="switchDisabled" @keydown.enter="switchValue">
    <span class="el-switch__core" ref="core">
      <span :class="['el-switch__label', checked ? 'is-active' : '']" v-if="activeIconClass || activeText">
        <i :class="[activeIconClass]" v-if="activeIconClass"></i>
        <span :style="{color : this.inactiveTextColor}" v-show="!inactiveIconClass && inactiveText && !checked" :aria-hidden="checked">{{ inactiveText }}</span>
        <span :style="{color : this.activeTextColor}" v-show="!activeIconClass && activeText && checked" :aria-hidden="!checked">{{ activeText }}</span>
      </span>
    </span>

  </div>
</template>
<script>
import emitter from 'element-gui/src/mixins/emitter';
import Focus from 'element-gui/src/mixins/focus';
import Migrating from 'element-gui/src/mixins/migrating';

export default {
  name: 'ElSwitch',
  mixins: [Focus('input'), Migrating, emitter],
  inject: {
    elForm: {
      default: ''
    },
    elFormItem: {
      default: ''
    }
  },
  props: {
    value: {
      type: [Boolean, String, Number],
      default: false
    },
    disabled: Boolean,
    activeIconClass: {
      type: String,
      default: ''
    },
    inactiveIconClass: {
      type: String,
      default: ''
    },
    activeText: String,
    inactiveText: String,
    activeColor: {
      type: String,
      default: ''
    },
    activeTextColor: {
      type: String,
      default: ''
    },
    inactiveColor: {
      type: String,
      default: ''
    },
    inactiveTextColor: {
      type: String,
      default: ''
    },
    activeValue: {
      type: [Boolean, String, Number],
      default: true
    },
    inactiveValue: {
      type: [Boolean, String, Number],
      default: false
    },
    name: String,
    validateEvent: {
      type: Boolean,
      default: true
    },
    id: String
  },
  data() {
    return {};
  },
  created() {
    if (!~[this.activeValue, this.inactiveValue].indexOf(this.value)) {
      this.$emit('input', this.inactiveValue);
    }
  },
  computed: {
    _elFormItemName() {
      return this.elFormItem.prop ? this.elFormItem.prop : this.name;
    },
    checked() {
      return this.value === this.activeValue;
    },
    switchDisabled() {
      return this.disabled || (this.elForm || {}).disabled;
    }
  },
  watch: {
    checked() {
      this.$refs.input.checked = this.checked;
      if (this.activeColor || this.inactiveColor) {
        this.setBackgroundColor();
      }
      if (this.validateEvent) {
        this.dispatch('ElFormItem', 'el.form.change', [this.value]);
      }
    },
    activeColor() {
      if (this.activeColor || this.inactiveColor) {
        this.setBackgroundColor();
      }
    },
    inactiveColor() {
      if (this.activeColor || this.inactiveColor) {
        this.setBackgroundColor();
      }
    }
  },
  methods: {
    handleChange(event) {
      const val = this.checked ? this.inactiveValue : this.activeValue;
      this.$emit('input', val);
      this.$emit('change', val);
      this.$nextTick(() => {
        // set input's checked property
        // in case parent refuses to change component's value
        // delete duplicated logic.
        if (this.$refs.input) {
          this.$refs.input.checked = this.checked;
        }
      });
    },
    setBackgroundColor() {
      let newColor = this.checked ? this.activeColor : this.inactiveColor;
      this.$refs.core.style.borderColor = newColor;
      this.$refs.core.style.backgroundColor = newColor;
    },
    switchValue() {
      !this.switchDisabled && this.handleChange();
    },
    getMigratingConfig() {
      return {
        props: {
          'on-color': 'on-color is renamed to active-color.',
          'off-color': 'off-color is renamed to inactive-color.',
          'on-text': 'on-text is renamed to active-text.',
          'off-text': 'off-text is renamed to inactive-text.',
          'on-value': 'on-value is renamed to active-value.',
          'off-value': 'off-value is renamed to inactive-value.',
          'on-icon-class': 'on-icon-class is renamed to active-icon-class.',
          'off-icon-class': 'off-icon-class is renamed to inactive-icon-class.'
        }
      };
    }
  },
  mounted() {
    /* istanbul ignore if */
    if (this.activeColor || this.inactiveColor) {
      this.setBackgroundColor();
    }
    this.$refs.input.checked = this.checked;
  }
};
</script>
