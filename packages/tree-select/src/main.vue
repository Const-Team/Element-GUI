<template>
  <div
    class="el-tree-select"
    @click.stop="toggleTree"
    :class="[selectSize ? 'el-tree-select--' + selectSize : '']"
    v-clickoutside="handleClose">
    <div
      class="el-tree-select__tags"
      :style="{ 'max-width': inputWidth - 32 + 'px' }"
      ref="tags"
      v-if="multiple">
      <span class="el-select-tree__tags-wrapper" v-if="collapseTags">
        <transition-group @after-leave="resetInputHeight">
          <el-tag
            v-for="item in selected.slice(0, collapseTagsMaxNum)"
            :key="item.value"
            :closable="!selectDisabled"
            :size="collapseTagSize"
            type="info"
            disable-transitions
            :style="{ 'max-width': inputWidth - 32 + 'px' }"
            @close.stop="deleteTag(item)">
            <span class="el-tree-select__tags-text" :style="{ 'max-width': inputWidth - 74 + 'px' }">{{ item.label }}</span>
          </el-tag>
        </transition-group>
        <el-tag
          v-if="selected.length > collapseTagsMaxNum"
          :closable="false"
          :size="collapseTagSize"
          class="tag-num"
          type="info"
          disable-transitions>
          <el-tooltip popper-class="tree-select-tooltip" :max-width="inputWidth - 20" :effect="tooltipEffect" :content="selectedTitle" placement="top">
            <span>+ {{ selected.length - collapseTagsMaxNum }}</span>
          </el-tooltip>
        </el-tag>
      </span>
      <span class="el-select-tree__tags-wrapper" v-else>
        <transition-group class="el-select-tree__tags-wrapper" @after-leave="resetInputHeight">
          <el-tag
            v-for="item in selected"
            :key="item.value"
            :closable="!selectDisabled"
            :size="collapseTagSize"
            type="info"
            disable-transitions
            :style="{ 'max-width': inputWidth - 32 + 'px' }"
            @close.stop="deleteTag(item)">
            <span class="el-tree-select__tags-text" :style="{ 'max-width': inputWidth - 74 + 'px' }">{{ item.label }}</span>
          </el-tag>
        </transition-group>
      </span>
      
      <input
        v-if="filterable"
        type="text"
        class="el-tree-select__input"
        :disabled="selectDisabled"
        :autocomplete="false"
        @click.stop
        @focus="handleFocus"
        @keydown.esc.stop.prevent="visible = false"
        @keydown.delete="deletePrevTag"
        v-model="query"
        @input="e => handleQueryChange(e.target.value)"
        :style="{ width: inputLength + 'px'}"
        ref="input">
    </div>
    <el-input
      ref="reference"
      type="text"
      v-model="selectedLabel"
      :disabled="selectDisabled"
      :readonly="readonly"
      :validate-event="false"
      :size="selectSize"
      :class="{ 'is-focus': visible }"
      :placeholder="currentPlaceholder"
      @focus="handleFocus"
      @keyup.native="onInputChange"
      @mouseenter.native="inputHovering = true"
      @mouseleave.native="inputHovering = false">
      <template slot="prefix" v-if="$slots.prefix">
        <slot name="prefix"></slot>
      </template>
      <i slot="suffix"
       :class="suffixIconClass"
       @click="handleIconClick"></i>
    </el-input>
    <transition name="el-zoom-in-top">
      <div
        v-show="visible"
        ref="popper"
        :style="{minWidth: inputWidth + 'px',maxWidth: optionMaxWidth}"
        class="el-tree-select-dropdown el-popper">
        <el-scrollbar
          wrap-class="el-tree-select-dropdown__wrap"
          view-class="el-tree-select-dropdown__list"
          ref="scrollbar">
        <el-tree
          ref="tree"
          :data="data"
          :lazy="lazy"
          :load="load"
          :check-on-click-node="checkOnClickNode"
          :props="props"
          default-expand-all
          node-key="value"
          :show-checkbox="showCheckbox"
          :expand-on-click-node="false"
          :check-strictly="checkStrictly"
          :filter-node-method="filterNodeMethod"
          :default-checked-keys="checkedKeys"
          @check="handleCheck"
          @node-click="handleNodeClick">
        </el-tree>
        </el-scrollbar>
      </div>
    </transition>
  </div>
</template>

<script>
import ElInput from 'element-gui/packages/input';
import ElTree from 'element-gui/packages/tree';
import Clickoutside from 'element-gui/src/utils/clickoutside';
import Popper from 'element-gui/src/utils/vue-popper';
import { valueEquals } from 'element-gui/src/utils/util';
import { addResizeListener, removeResizeListener } from 'element-gui/src/utils/resize-event';
import emitter from 'element-gui/src/mixins/emitter';
import { t } from 'element-gui/src/locale';

// todo: 等 vue-popper 合并后，这里还需要做出调整
const popperMixin = {
  props: {
    placement: {
      type: String,
      default: 'bottom-start'
    },
    appendToBody: Popper.props.appendToBody,
    arrowOffset: Popper.props.arrowOffset,
    offset: Popper.props.offset,
    boundariesPadding: Popper.props.boundariesPadding,
    popperOptions: Popper.props.popperOptions,
    visibleArrow: {
      type: Boolean,
      default: true
    }
  },
  methods: Popper.methods,
  data: Popper.data,
  beforeDestroy: Popper.beforeDestroy
};

const sizeMap = {
  'medium': 32,
  'small': 30,
  'mini': 28
};

export default {
  name: 'ElTreeSelect',

  mixins: [popperMixin, emitter],

  provide() {
    return {
      elTreeSelect: this
    };
  },

  inject: {
    elForm: {
      default: ''
    },

    elFormItem: {
      default: ''
    }
  },

  props: {
    data: {
      type: Array,
      required: true
    },
    value: {
      required: true,
      type: [String, Number, Array]
    },
    multiple: Boolean,
    disabled: Boolean,
    clearable: Boolean,
    size: {
      type: String,
      validator(val) {
        return ['medium', 'small', 'mini'].indexOf(val) > -1;
      }
    },
    props: Object,
    placeholder: {
      type: String,
      default() {
        return t('el.treeSelect.placeholder');
      }
    },
    lazy: Boolean,
    load: Function,
    showCheckbox: Boolean,
    checkStrictly: {
      type: Boolean,
      default: false
    },
    filterable: Boolean,
    filterMethod: Function,
    // emptyText: String,
    showCheckedStrategy: {
      type: String,
      default: 'child',
      validator(val) {
        return ['parent', 'child'].indexOf(val) > -1;
      }
    },
    collapseTags: Boolean,
    collapseTagsMaxNum: {
      type: Number,
      default: 1
    },
    tooltipEffect: {
      type: String,
      default: 'dark'
    },
    optionMaxWidth: {
      type: String
    }
  },

  components: {
    ElInput,
    ElTree
  },

  directives: { Clickoutside },

  data() {
    return {
      query: '',
      selectedLabel: '',
      inputLength: 20,
      visible: false,
      inputWidth: 0,
      inputHovering: false,
      treeVisibleOnFocus: false,
      selected: this.multiple ? [] : {},
      checkOnClickNode: false,
      selectedTitle: ''
    };
  },

  computed: {
    suffixIconClass() {
      let classes = ['el-tree-select__caret', 'el-input__icon'];
      const criteria = this.clearable &&
          !this.selectDisabled &&
          this.inputHovering &&
          !this.multiple &&
          this.value !== undefined &&
          this.value !== null &&
          this.value !== '';
      if (criteria) {
        classes = [...classes, 'el-icon-circle-close', 'is-show-close'];
      } else {
        classes.push('el-icon-arrow-down');
        if (this.visible) {
          classes.push('is-reverse');
        }
      }
      return classes;
    },
    selectDisabled() {
      return this.disabled || (this.elForm || {}).disabled;
    },
    selectSize() {
      return this.size || (this.elFormItem || {}).elFormItemSize || (this.$ELEMENT || {}).size;
    },
    collapseTagSize() {
      return ['small', 'mini'].indexOf(this.selectSize) > -1
        ? 'mini'
        : 'small';
    },
    readonly() {
      const isIE = !this.$isServer && !isNaN(Number(document.documentMode));
      return !this.filterable || this.multiple || !isIE && !this.visible;
    },
    checkedKeys() {
      if (this.multiple && this.showCheckbox) {
        return this.value || [];
      } else {
        return [];
      }
    },
    currentPlaceholder() {
      if (!this.value || (Array.isArray(this.value) && this.value.length === 0)) {
        return this.placeholder;
      } else {
        return '';
      }
    }
  },

  watch: {
    visible(val) {
      if (val) {
        this.updatePopper();
        if (this.multiple && this.filterable) {
          this.$refs.input.focus();
        }
        this.$emit('focus', this);
        if (!this.multiple && this.filterable) {
          this.broadcast('ElInput', 'inputSelect');
        }
      } else {
        this.destroyPopper();
        if (this.$refs.input) {
          this.$refs.input.blur();
        }
        this.$emit('blur', this);
        this.query = '';
        this.selectedLabel = '';
        if (!this.multiple) {
          this.selectedLabel = this.selected.label || '';
          if (this.filterable) this.query = this.selectedLabel;
        }
        if (this.filterable) {
          setTimeout(() => {
            this.handleQueryChange('');
          }, 100);
        }
      }
    },
    value(val, oldVal) {
      if (this.multiple) {
        this.resetInputHeight();
      } else {
        if (oldVal) {
          this.$refs.tree.getNode(oldVal).isSelect = false;
        };
        if (val) {
          this.$refs.tree.getNode(val).isSelect = true;
        };
      };
      this.setSelected();
      if (!valueEquals(val, oldVal)) {
        this.dispatch('ElFormItem', 'el.form.change', val);
      };
    }
  },

  methods: {
    handleFocus(event) {
      this.treeVisibleOnFocus = true;
      this.visible = true;
      // this.$emit('focus', event);
    },
    handleClose() {
      this.visible = false;
    },
    toggleTree() {
      if (!this.selectDisabled) {
        if (this.treeVisibleOnFocus) {
          this.treeVisibleOnFocus = false;
        } else {
          this.visible = !this.visible;
        }
      }
    },
    handleIconClick(event) {
      if (this.suffixIconClass.indexOf('el-icon-circle-close') > -1) {
        event.stopPropagation();
        this.visible = false;
        this.$emit('input', '');
        this.emitChange('');
        this.$emit('clear');
        this.selected = {};
        this.selectedLabel = '';
      }
    },
    emitChange(val) {
      if (!valueEquals(this.value, val)) {
        this.$emit('change', val);
      }
    },
    handleQueryChange(val) {
      this.$refs.tree.filter(val);
    },
    handleNodeClick(data, node, tree) {
      if (this.showCheckbox) return;
      let value = node.data.value;
      let child = node.childNodes;
      if (child.length == 0) {
        if (this.multiple) {
          const valueCopy = this.value.slice();
          const index = this.getValueIndex(valueCopy, value);
          if (index > -1) {
            this.$refs.tree.getNode(valueCopy[index]).isSelect = false;
            valueCopy.splice(index, 1);
          } else {
            valueCopy.push(value);
            this.$refs.tree.getNode(value).isSelect = true;
          }
          if (this.$refs.input) {
            this.$refs.input.focus();
          }
          this.$emit('input', valueCopy);
          this.emitChange(valueCopy);
        } else {
          if (value === this.value) {
            value = '';
          }
          this.$emit('input', value);
          this.emitChange(value);
          this.visible = false;
        }
      } else {
        return ;
      }
    },
    handleCheck(data, info) {
      const { checkedNodes } = info;
      let nodes = [];
      switch (this.showCheckedStrategy) {
        case 'parent':
          nodes = this.getTreeCheckedParentNodes();
          break;
        case 'child':
          nodes = checkedNodes.filter(({ children }) => !(children && children.length));
          break;
        default:
          nodes = checkedNodes;
          break;
      }
      const values = nodes.map(({ value }) => value);
      if (this.filterable) this.$refs.input.focus();
      this.$emit('input', values);
      this.emitChange(values);
    },
    getTreeCheckedParentNodes() {
      const checkedNodes = [];
      const traverse = (node) => {
        const childNodes = node.root ? node.root.childNodes : node.childNodes;
        childNodes.forEach(child => {
          if (child.checked && !child.isLeaf) {
            checkedNodes.push({
              label: child.data.label,
              value: child.data.value
            });
          } else {
            traverse(child);
          }
        });
      };
      traverse(this.$refs.tree.store);
      return checkedNodes;
    },
    getNodeData(value) {
      let node = null;
      if (Array.isArray(this.data)) {
        const traverse = (arr) => {
          for (let i = 0; i < arr.length; i++) {
            const child = arr[i];
            if (child.value === value) {
              node = {
                label: child.label,
                value: child.value
              };
              break;
            } else if (child.children && child.children.length > 0) {
              traverse(child.children);
            }
          }
        };
        traverse(this.data);
      }
      return node;
    },
    onInputChange() {
      if (this.filterable && this.query !== this.selectedLabel) {
        this.query = this.selectedLabel;
        this.handleQueryChange(this.query);
      }
    },
    filterNodeMethod(value, data) {
      if (!value) return true;
      this.$nextTick(this.updatePopper);
      if (typeof this.filterMethod === 'function') {
        return this.filterMethod(value, data);
      } else {
        return data.label.indexOf(value) !== -1;
      }
    },
    resetInputHeight() {
      this.$nextTick(() => {
        if (!this.$refs.reference) return;
        const inputEl = this.$refs.reference.$refs.input;
        const tags = this.$refs.tags;
        let height = sizeMap[this.selectSize] || 34;
        if (this.selected.length !== 0) {
          height = Math.max((tags.clientHeight + (tags.clientHeight > height ? 6 : 0)), height);
        }
        inputEl.style.height = `${height}px`;
        if (this.visible) {
          this.updatePopper();
        }
      });
    },
    getValueIndex(arr = [], value) {
      let index = -1;
      arr.some((item, i) => {
        if (item === value) {
          index = i;
          return true;
        } else {
          return false;
        }
      });
      return index;
    },
    deletePrevTag(e) {
      if (e.target.value.length <= 0) {
        this.selected.splice(-1, 1);
        const values = this.selected.map(({ value }) => value);
        this.$emit('input', values);
        this.$refs.tree.setCheckedKeys(values);
        this.emitChange(values);
      }
    },
    deleteTag(item) {
      this.selected = this.selected.filter(selectItem => selectItem !== item);
      const values = this.selected.map(({ value }) => value);
      this.$emit('input', values);
      this.$refs.tree.getNode(item.value).isSelect = false;
      this.$refs.tree.setCheckedKeys(values);
      this.emitChange(values);
    },
    resetInputWidth() {
      this.inputWidth = this.$refs.reference.$el.getBoundingClientRect().width;
    },
    handleResize() {
      this.resetInputWidth();
      if (this.multiple) {
        this.resetInputHeight();
      };
    },
    setSelected() {
      if (this.multiple) {
        const result = [];
        let title = [];
        if (Array.isArray(this.value)) {
          this.value.forEach(value => {
            const node = this.getNodeData(value);
            if (node) {
              result.push(node);
              title.push(node.label);
            }
          });
        }
        this.selected = result;
        this.selectedTitle = title.join('，');
        this.$nextTick(this.resetInputHeight);
      } else {
        const node = this.getNodeData(this.value);
        if (node) {
          this.selected = node;
          this.selectedLabel = node.label;
          if (this.filterable) this.query = this.selectedLabel;
        }
      }
    },
    // 初始化高亮选中
    treeSelect() {
      let select = this.selected;
      if (this.multiple && select.length > 0) {
        for (let i = 0; i < select.length; i++) {
          this.$refs.tree.getNode(select[i].value).isSelect = true;
        }
      }
      if (!this.multiple && select.value) {
        this.$refs.tree.getNode(select.value).isSelect = true;
      }
    },
    // 获取两个数组不同
    getArrDifference(arr1, arr2) {
      return arr1.concat(arr2).filter(function(v, i, arr) {
        return arr.indexOf(v) === arr.lastIndexOf(v);
      });
    }
  },

  mounted() {
    if (this.multiple && this.showCheckbox) {
      this.checkOnClickNode = true;
    };
    if (this.checkStrictly) {
      this.showCheckedStrategy = 'all';
    };
    this.referenceElm = this.$refs.reference.$el;
    this.popperElm = this.$refs.popper;
    this.inputWidth = this.$refs.reference.$el.getBoundingClientRect().width;
    addResizeListener(this.$el, this.handleResize);
    this.setSelected();
    this.treeSelect();
  },

  beforeDestroy() {
    removeResizeListener(this.$el, this.handleResize);
  }
};
</script>
