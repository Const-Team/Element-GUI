<template>
  <form class="el-form" :class="[
    labelPosition ? 'el-form--label-' + labelPosition : '',
    { 'el-form--inline': inline }
  ]">
    <template v-if="grid">
      <el-row :gutter="gutter">
        <slot></slot>
      </el-row>
    </template>
    <template v-else>
      <slot></slot>
    </template>
  </form>
</template>
<script>
import objectAssign from 'element-gui/src/utils/merge';
import ElRow from 'element-gui/packages/row';
export default {
  name: 'ElForm',

  componentName: 'ElForm',

  provide() {
    return {
      elForm: this,
      // 把label所有宽度传递到item里面
      labelWidthArr: this.potentialLabelWidthArr,
      gridStatus: this.gridObj
    };
  },

  props: {
    model: Object,
    rules: Object,
    labelPosition: String,
    labelWidth: String,
    labelMaxWidth: String,
    labelSuffix: {
      type: String,
      default: ''
    },
    inline: Boolean,
    grid: {
      type: Boolean,
      default: false
    },
    gutter: {
      type: Number,
      default: 20
    },
    inlineMessage: Boolean,
    blockMessage: Boolean,
    statusIcon: Boolean,
    showMessage: {
      type: Boolean,
      default: true
    },
    size: String,
    disabled: Boolean,
    validateOnRuleChange: {
      type: Boolean,
      default: true
    },
    hideRequiredAsterisk: {
      type: Boolean,
      default: false
    }
  },
  watch: {
    rules() {
      // remove then add event listeners on form-item after form rules change
      this.fields.forEach(field => {
        field.removeValidateEvents();
        field.addValidateEvents();
      });

      if (this.validateOnRuleChange) {
        this.validate(() => {});
      }
    },
    grid: {
      handler (value) {
        this.gridObj.status = value; // 可以监听到gridStatus的改变
      },
      immediate: true,
      deep: true
    }
  },
  computed: {
    autoLabelWidth() {
      if (!this.potentialLabelWidthArr.length) return 0;
      let max;
      // 判断是否设置了label最大宽度
      if (this.labelMaxWidth) {
        // 如果设置了label最大宽度，把label所有的宽度和max宽度对比，如果宽度超过max则使用max否则使用label宽度
        max =
          Math.max(...this.potentialLabelWidthArr) >=
          parseInt(this.labelMaxWidth, 10)
            ? parseInt(this.labelMaxWidth, 10)
            : Math.max(...this.potentialLabelWidthArr);
      } else {
        max = Math.max(...this.potentialLabelWidthArr);
      }
      return max ? `${max}px` : '';
    }
  },
  data() {
    return {
      fields: [],
      potentialLabelWidthArr: [], // use this array to calculate auto width
      // 响应式监听grid状态
      gridObj: {
        status: null
      }
    };
  },
  created() {
    this.$on('el.form.addField', field => {
      if (field) {
        this.fields.push(field);
      }
    });
    /* istanbul ignore next */
    this.$on('el.form.removeField', field => {
      if (field.prop) {
        this.fields.splice(this.fields.indexOf(field), 1);
      }
    });
  },
  methods: {
    resetFields() {
      if (!this.model) {
        console.warn(
          '[Element Warn][Form]model is required for resetFields to work.'
        );
        return;
      }
      this.fields.forEach(field => {
        field.resetField();
      });
    },
    clearValidate(props = []) {
      const fields = props.length
        ? typeof props === 'string'
          ? this.fields.filter(field => props === field.prop)
          : this.fields.filter(field => props.indexOf(field.prop) > -1)
        : this.fields;
      fields.forEach(field => {
        field.clearValidate();
      });
    },
    validate(callback) {
      if (!this.model) {
        console.warn(
          '[Element Warn][Form]model is required for validate to work!'
        );
        return;
      }

      let promise;
      // if no callback, return promise
      if (typeof callback !== 'function' && window.Promise) {
        promise = new window.Promise((resolve, reject) => {
          callback = function(valid) {
            valid ? resolve(valid) : reject(valid);
          };
        });
      }

      let valid = true;
      let count = 0;
      // 如果需要验证的fields为空，调用验证时立刻返回callback
      if (this.fields.length === 0 && callback) {
        callback(true);
      }
      let invalidFields = {};
      this.fields.forEach(field => {
        field.validate('', (message, field) => {
          if (message) {
            valid = false;
          }
          invalidFields = objectAssign({}, invalidFields, field);
          if (
            typeof callback === 'function' &&
            ++count === this.fields.length
          ) {
            callback(valid, invalidFields);
          }
        });
      });

      if (promise) {
        return promise;
      }
    },
    validateField(props, cb) {
      props = [].concat(props);
      const fields = this.fields.filter(
        field => props.indexOf(field.prop) !== -1
      );
      if (!fields.length) {
        console.warn('[Element Warn]please pass correct props!');
        return;
      }

      fields.forEach(field => {
        field.validate('', cb);
      });
    },
    getLabelWidthIndex(width) {
      const index = this.potentialLabelWidthArr.indexOf(width);
      // it's impossible
      if (index === -1) {
        throw new Error('[ElementForm]unpected width ', width);
      }
      return index;
    },
    registerLabelWidth(val, oldVal) {
      if (val && oldVal) {
        const index = this.getLabelWidthIndex(oldVal);
        this.potentialLabelWidthArr.splice(index, 1, val);
      } else if (val) {
        this.potentialLabelWidthArr.push(val);
      }
    },
    deregisterLabelWidth(val) {
      const index = this.getLabelWidthIndex(val);
      this.potentialLabelWidthArr.splice(index, 1);
    }
  }
};
</script>
