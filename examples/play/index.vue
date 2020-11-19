<template>
  <div>
    <br>
    <el-button  :plain="false" :round="false" :circle="false" :disabled="false" :loading="false" nativeType="button">
      默认按钮
    </el-button>
    <el-input  class="el-width200" placeholder="请输入" :clearable="false" :readonly="false" :disabled="false" :showWordLimit="false" v-model="model_2atnyb6j2lh">
    </el-input>
    <el-button-group>
      <el-button  :plain="false" :round="false" :circle="false" :disabled="false" :loading="false" nativeType="button">
        默认按钮
      </el-button>
      <el-button  :plain="false" :round="false" :circle="false" :disabled="false" :loading="false" nativeType="button">
        默认按钮
      </el-button>
    </el-button-group>
    <el-radio-group  :disabled="false" textColor="#ffffff" fill="#1890FF" v-model="model_g9g16kn88q">
      <el-radio-button label="备选项1" :disabled="false">
      </el-radio-button>
      <el-radio-button label="备选项2" :disabled="false">
      </el-radio-button>
      <el-radio-button label="备选项3" :disabled="false">
      </el-radio-button>
    </el-radio-group>
    <el-checkbox-group  :disabled="false" textColor="#ffffff" fill="#1890FF" v-model="model_1e70rbovoa">
      <el-checkbox-button label="备选项1" :disabled="false">
      </el-checkbox-button>
      <el-checkbox-button label="备选项2" :disabled="false">
      </el-checkbox-button>
      <el-checkbox-button label="备选项3" :disabled="false">
      </el-checkbox-button>
    </el-checkbox-group>
    <el-input-number  class="el-width140" :disabled="false" :controls="true" :stepStrictly="false" v-model="model_2f96dgh1xfr">
    </el-input-number>
    <el-select  placeholder="请选择" class="el-width200" :disabled="false" :filterable="false" :allowCreate="false" :popperAppendToBody="true" :multiple="false" :collapseTags="false" :collapseTexts="false" :clearable="false" icon="el-icon-arrow-up" v-model="model_t298xsqh6e">
      <el-option label="选项1" value="1" :disabled="false">
      </el-option>
      <el-option label="选项2" value="2" :disabled="false">
      </el-option>
    </el-select>
    <el-tree-select  placeholder="请选择" class="el-width200" :disabled="false" :filterable="false" :multiple="false" :clearable="false" :defaultExpandAll="false" :expandOnClickNode="false" :collapseTags="false" :showCheckbox="false" :checkStrictly="false" showCheckedStrategy="child" v-model="model_114x7qkypm6" :data="data_114x7qkypm6">
    </el-tree-select>
    <el-cascader  placeholder="请选择" class="el-width200" :disabled="false" :clearable="false" :filterable="false" :showAllLevels="true" optionMaxWidth="300px" separator="/" :collapseTags="false" v-model="model_eajug9l8gg" :options="options_eajug9l8gg" :props="props_eajug9l8gg">
    </el-cascader>
    <el-time-select  placeholder="选择时间" class="el-width200" align="left" :readonly="false" :disabled="false" :clearable="true" prefixIcon="el-icon-time" clearIcon="el-icon-circle-close" v-model="model_hcfqhhmnqo" :pickerOptions="pickerOptions_hcfqhhmnqo">
    </el-time-select>
    <el-time-picker  class="el-width200" align="left" :isRange="true" valueFormat="HH:mm:ss" placeholder="选择时间" rangeSeparator="-" :readonly="false" :disabled="false" :clearable="true" :arrowControl="false" prefixIcon="el-icon-time" clearIcon="el-icon-circle-close" v-model="model_1spftzb3ywn" :pickerOptions="pickerOptions_1spftzb3ywn">
    </el-time-picker>
    <el-date-picker  placeholder="选择时间" class="el-width200" align="left" rangeSeparator="-" :readonly="false" :disabled="false" :editable="true" :clearable="true" :unlinkPanels="false" prefixIcon="el-icon-date" clearIcon="el-icon-circle-close" type="date" format="yyyy-MM-dd" valueFormat="yyyy-MM-dd" v-model="model_b8nyf1k0xe">
    </el-date-picker>
    <el-color-picker  v-model="color1" :append-to-body="false"></el-color-picker>
  </div>

</template>
<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 组件名称 from '组件路径';
export default {
  //接收传入数据
  props: [],
  //引入混淆js
  mixins: [],
  //import引入的组件需要注入到对象中才能使用
  components: {},
  data() {
    //这里存放数据
    return {
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: '',
      },
      model_2atnyb6j2lh: '',
      model_g9g16kn88q: '',
      model_1e70rbovoa: [],
      model_2f96dgh1xfr: 1,
      model_t298xsqh6e: '',
      model_114x7qkypm6: '',
      data_114x7qkypm6: [
        {
          label: '一级 1',
          value: '1',
          children: [
            {
              label: '二级 1-1',
              value: '1-1',
              children: [
                {
                  label:
                    '特别长的文字特别长的文字特别长的文字特别长的文字特别长的文字特别长的文字',
                  value: '1-1-1',
                },
              ],
            },
          ],
        },
        {
          label: '一级 2',
          value: '2',
          children: [
            {
              label: '二级 2-1',
              value: '2-1',
              children: [{ label: '三级 2-1-1', value: '2-1-1' }],
            },
            {
              label: '二级 2-2',
              value: '2-2',
              children: [{ label: '三级 2-2-1', value: '2-2-1' }],
            },
          ],
        },
        {
          label: '一级 3',
          value: '3',
          children: [
            {
              label: '二级 3-1',
              value: '3-1',
              children: [{ label: '三级 3-1-1', value: '3-1-1' }],
            },
            {
              label: '二级 3-2',
              value: '3-2',
              children: [{ label: '三级 3-2-1', value: '3-2-1' }],
            },
          ],
        },
      ],
      model_eajug9l8gg: '',
      options_eajug9l8gg: [
        {
          label: '一级 1',
          value: '1',
          children: [
            {
              label: '二级 1-1',
              value: '1-1',
              children: [
                {
                  label:
                    '特别长的文字特别长的文字特别长的文字特别长的文字特别长的文字特别长的文字',
                  value: '1-1-1',
                },
              ],
            },
          ],
        },
        {
          label: '一级 2',
          value: '2',
          children: [
            {
              label: '二级 2-1',
              value: '2-1',
              children: [{ label: '三级 2-1-1', value: '2-1-1' }],
            },
            {
              label: '二级 2-2',
              value: '2-2',
              children: [{ label: '三级 2-2-1', value: '2-2-1' }],
            },
          ],
        },
        {
          label: '一级 3',
          value: '3',
          children: [
            {
              label: '二级 3-1',
              value: '3-1',
              children: [{ label: '三级 3-1-1', value: '3-1-1' }],
            },
            {
              label: '二级 3-2',
              value: '3-2',
              children: [{ label: '三级 3-2-1', value: '3-2-1' }],
            },
          ],
        },
      ],
      props_eajug9l8gg: { expandTrigger: 'hover', multiple: true },
      model_hcfqhhmnqo: '',
      pickerOptions_hcfqhhmnqo: { start: '08:30', step: '00:15', end: '18:30' },
      model_1spftzb3ywn: '',
      pickerOptions_1spftzb3ywn: {
        selectableRange: ['09:30:00 - 12:00:00', '14:30:00 - 18:30:00'],
      },
      model_b8nyf1k0xe: '',
      color1: '#1890FF',
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {},
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {},
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {},
  //生命周期 - 创建之前
  beforeCreate() {},
  //生命周期 - 挂载之前
  beforeMount() {},
  //生命周期 - 更新之前
  beforeUpdate() {},
  //生命周期 - 更新之后
  updated() {},
  //生命周期 - 销毁之前
  beforeDestroy() {},
  //生命周期 - 销毁完成
  destroyed() {},
  //如果页面有keep-alive缓存功能，这个函数会触发
  activated() {},
};
</script>
<style lang="scss" scoped>
</style>