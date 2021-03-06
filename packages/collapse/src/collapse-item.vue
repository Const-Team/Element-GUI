<template>
  <div class="el-collapse-item"
    :class="{'is-active': isActive, 'is-disabled': disabled }">
    <div
      role="tab"
      :aria-expanded="isActive"
      :aria-controls="`el-collapse-content-${id}`"
      :aria-describedby ="`el-collapse-content-${id}`"
    >
      <div
        class="el-collapse-item__header"
        @click="handleHeaderClick"
        role="button"
        :id="`el-collapse-head-${id}`"
        :tabindex="disabled ? undefined : 0"
        @keyup.space.enter.stop="handleEnterClick"
        :class="{
          'is-active': isActive
        }"
      >
        <slot name="title">{{title}}</slot>
        <i
          @click.stop="handleIconClick"
          class="el-collapse-item__arrow el-icon-arrow-right"
          :class="{'is-active': isActive}">
        </i>
      </div>
    </div>
    <el-collapse-transition>
      <div
        class="el-collapse-item__wrap"
        v-if="(!lazy || loaded) || isActive"
        v-show="isActive"
        role="tabpanel"
        :aria-hidden="!isActive"
        :aria-labelledby="`el-collapse-head-${id}`"
        :id="`el-collapse-content-${id}`"
      >
        <div class="el-collapse-item__content">
          <slot></slot>
        </div>
      </div>
    </el-collapse-transition>
  </div>
</template>
<script>
  import ElCollapseTransition from 'element-gui/src/transitions/collapse-transition';
  import Emitter from 'element-gui/src/mixins/emitter';
  import { generateId } from 'element-gui/src/utils/util';

  export default {
    name: 'ElCollapseItem',

    componentName: 'ElCollapseItem',

    mixins: [Emitter],

    components: { ElCollapseTransition },

    data() {
      return {
        contentWrapStyle: {
          height: 'auto',
          display: 'block'
        },
        contentHeight: 0,
        isClick: false,
        loaded: false,
        id: generateId()
      };
    },

    inject: ['collapse'],

    props: {
      title: String,
      trigger: String,
      name: {
        type: [String, Number],
        default() {
          return this._uid;
        }
      },
      disabled: Boolean,
      lazy: Boolean
    },

    computed: {
      triggerTarget() {
        return this.trigger || (this.collapse || {}).trigger;
      },
      isActive() {
        const active = this.collapse.activeNames.indexOf(this.name) > -1;
        if (active) {
          this.loaded = true;
        };
        return active;
      }
    },

    methods: {
      handleHeaderClick() {
        if (this.disabled || this.triggerTarget === 'icon') return;
        this.dispatch('ElCollapse', 'item-click', this);
        this.isClick = true;
      },
      handleEnterClick() {
        this.dispatch('ElCollapse', 'item-click', this);
      },
      handleIconClick() {
        if (this.disabled) return;
        this.dispatch('ElCollapse', 'item-click', this);
        this.isClick = true;
      }
    }
  };
</script>
