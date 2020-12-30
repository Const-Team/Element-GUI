<template>
  <div class="el-transfer-panel" :style="{ width }">
    <p class="el-transfer-panel__header">
      <el-checkbox
        v-model="allChecked"
        @change="handleAllCheckedChange"
        :indeterminate="isIndeterminate">
        {{ title }}
        <span>{{ checkedSummary }}</span>
      </el-checkbox>
    </p>
    
    <div :class="['el-transfer-panel__body', hasFooter ? 'is-with-footer' : '']">
      <div class="el-transfer-panel__filter" v-if="filterable">
        <el-input
          v-model="query"
          size="small"
          :placeholder="placeholder"
          @mouseenter.native="inputHover = true"
          @mouseleave.native="inputHover = false">
          <i slot="suffix"
            :class="['el-input__icon', 'el-icon-' + inputIcon]"
            @click="clearQuery"
          ></i>
        </el-input>
      </div>
      <el-scrollbar @doScroll="doScroll" :noresize="true" :class="{ 'is-filterable': filterable }" wrap-class="el-transfer-panel__wrap" view-class="el-transfer-panel__list" ref="componentScrollBar">
        <el-checkbox-group
          v-model="checked"
          ref="listWrapper"
          v-show="!hasNoMatch && data.length > 0"
          >
          <el-checkbox
            class="el-transfer-panel__item"
            :label="item[keyProp]"
            :disabled="item[disabledProp]"
            :key="item[keyProp]"
            v-for="item in renderData">
            <option-content :option="item"></option-content>
          </el-checkbox>
        </el-checkbox-group>
      </el-scrollbar>
      <p
        class="el-transfer-panel__empty"
        v-show="hasNoMatch">{{ t('el.transfer.noMatch') }}</p>
      <p
        class="el-transfer-panel__empty"
        v-show="data.length === 0 && !hasNoMatch">{{ t('el.transfer.noData') }}</p>
    </div>
    <p class="el-transfer-panel__footer" v-if="hasFooter">
      <slot></slot>
    </p>
  </div>
</template>

<script>
  import ElCheckboxGroup from 'element-gui/packages/checkbox-group';
  import ElCheckbox from 'element-gui/packages/checkbox';
  import ElInput from 'element-gui/packages/input';
  import Locale from 'element-gui/src/mixins/locale';

  export default {
    mixins: [Locale],

    name: 'ElTransferPanel',

    componentName: 'ElTransferPanel',

    components: {
      ElCheckboxGroup,
      ElCheckbox,
      ElInput,
      OptionContent: {
        props: {
          option: Object
        },
        render(h) {
          const getParent = vm => {
            if (vm.$options.componentName === 'ElTransferPanel') {
              return vm;
            } else if (vm.$parent) {
              return getParent(vm.$parent);
            } else {
              return vm;
            }
          };
          const panel = getParent(this);
          const transfer = panel.$parent || panel;
          return panel.renderContent
            ? panel.renderContent(h, this.option)
            : transfer.$scopedSlots.default
              ? transfer.$scopedSlots.default({ option: this.option })
              : <span>{ this.option[panel.labelProp] || this.option[panel.keyProp] }</span>;
        }
      }
    },

    props: {
      data: {
        type: Array,
        default() {
          return [];
        }
      },
      renderContent: Function,
      placeholder: String,
      title: String,
      width: String,
      filterable: Boolean,
      format: Object,
      filterMethod: Function,
      defaultChecked: Array,
      props: Object,
      lazy: Number
    },

    data() {
      return {
        checked: [],
        allChecked: false,
        query: '',
        inputHover: false,
        checkChangeByUser: true,
        renderData: [],
        lazyPage: 1,
        lazyLoaded: false
      };
    },

    watch: {
      filteredData: {
        immediate: true,
        handler(val) {
          this.loadRenderData(1);
        }
      },
      checked(val, oldVal) {
        this.updateAllChecked();
        if (this.checkChangeByUser) {
          const movedKeys = val.concat(oldVal)
            .filter(v => val.indexOf(v) === -1 || oldVal.indexOf(v) === -1);
          this.$emit('checked-change', val, movedKeys);
        } else {
          this.$emit('checked-change', val);
          this.checkChangeByUser = true;
        }
      },

      data() {
        const checked = [];
        const filteredDataKeys = this.filteredData.map(item => item[this.keyProp]);
        this.checked.forEach(item => {
          if (filteredDataKeys.indexOf(item) > -1) {
            checked.push(item);
          }
        });
        this.checkChangeByUser = false;
        this.checked = checked;
      },

      checkableData() {
        this.updateAllChecked();
      },

      defaultChecked: {
        immediate: true,
        handler(val, oldVal) {
          if (oldVal && val.length === oldVal.length &&
            val.every(item => oldVal.indexOf(item) > -1)) return;
          const checked = [];
          const checkableDataKeys = this.checkableData.map(item => item[this.keyProp]);
          val.forEach(item => {
            if (checkableDataKeys.indexOf(item) > -1) {
              checked.push(item);
            }
          });
          this.checkChangeByUser = false;
          this.checked = checked;
        }
      }
    },

    computed: {
      filteredData() {
        this.updateScrollBar();
        return this.data.filter(item => {
          if (typeof this.filterMethod === 'function') {
            return this.filterMethod(this.query, item);
          } else {
            const label = item[this.labelProp] || item[this.keyProp].toString();
            return label.toLowerCase().indexOf(this.query.toLowerCase()) > -1;
          }
        });
      },

      checkableData() {
        return this.filteredData.filter(item => !item[this.disabledProp]);
      },

      checkedSummary() {
        const checkedLength = this.checked.length;
        const dataLength = this.data.length;
        const { noChecked, hasChecked } = this.format;
        if (noChecked && hasChecked) {
          return checkedLength > 0
            ? hasChecked.replace(/\${checked}/g, checkedLength).replace(/\${total}/g, dataLength)
            : noChecked.replace(/\${total}/g, dataLength);
        } else {
          return `${ checkedLength }/${ dataLength }`;
        }
      },

      isIndeterminate() {
        const checkedLength = this.checked.length;
        return checkedLength > 0 && checkedLength < this.checkableData.length;
      },

      hasNoMatch() {
        return this.query.length > 0 && this.filteredData.length === 0;
      },

      inputIcon() {
        return this.query.length > 0 && this.inputHover
          ? 'circle-close'
          : 'search';
      },

      labelProp() {
        return this.props.label || 'label';
      },

      keyProp() {
        return this.props.key || 'key';
      },

      disabledProp() {
        return this.props.disabled || 'disabled';
      },

      hasFooter() {
        return !!this.$slots.default;
      }
    },

    methods: {
      updateAllChecked() {
        const checkableDataKeys = this.checkableData.map(item => item[this.keyProp]);
        this.allChecked = checkableDataKeys.length > 0 &&
          checkableDataKeys.every(item => this.checked.indexOf(item) > -1);
      },

      handleAllCheckedChange(value) {
        this.checked = value
          ? this.checkableData.map(item => item[this.keyProp])
          : [];
      },

      clearQuery() {
        if (this.inputIcon === 'circle-close') {
          this.query = '';
        }
      },

      loadRenderData(reset) {
        const lazy = Math.max(this.lazy, 0);
        if (lazy) {
          const loadNext = () => {
            let to = lazy * this.lazyPage;
            const from = lazy * (this.lazyPage - 1);
            const len = this.filteredData.length;
            if (to >= len) {
              this.lazyLoaded = true;
              to = len;
            }
            this.renderData.push(...this.filteredData.slice(from, to));
            this.lazyPage++;
          };
          if (reset) {
            this.lazyPage = 1;
            this.renderData = [];
            this.lazyLoaded = false;
            while (!this.lazyLoaded && this.renderData.length < 20) {
              loadNext();
            }
          } else {
            loadNext();
          }
        } else {
          this.renderData = this.filteredData;
        }
      },

      doScroll(e) {
        const target = e.target || e.srcElement;
        if (this.lazy && !this.lazyLoaded) {
          const isApproachBottom = target.scrollTop + target.offsetHeight + 50 >= target.scrollHeight;
          if (isApproachBottom) {
            this.loadRenderData();
            this.updateScrollBar();
          }
        }
      },

      updateScrollBar() {
        this.$nextTick(() => {
          this.$refs.componentScrollBar.update();
        });
      }
    }
  };
</script>
