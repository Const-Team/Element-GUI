## Calendar 日历

显示日期

### 基本

:::demo 设置 `value` 来指定当前显示的月份。如果 `value` 未指定，则显示当月。`value` 支持 `v-model` 双向绑定。
```html
<el-calendar v-model="value">
</el-calendar>

<script>
  export default {
    data() {
      return {
        value: new Date()
      }
    }
  }
</script>
```
:::

### Custom Header

:::demo 通过设置名为 `header` 的 `scoped slot` ，自定义日历标题中显示的内容。在 `header` 中可以得到 `dateText` 、`toPrev` 、`tototoday` 、`toNextMonth` 。有关详细信息，请参阅下面的API文档。
```html
<el-calendar>
  <!-- Use 2.5 slot syntax. If you use Vue 2.6, please use new slot syntax-->
  <template
    slot="header"
    slot-scope="{dateText, toPrevMonth, toToday, toNextMonth, pickDay}">
    <div style="
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: space-between;">
      <el-button
        size="mini"
        @click="toPrevMonth">
        上个月
      </el-button>
      <p>
        {{ dateText }}
        <el-button
          size="mini"
          @click="toToday">
          今天
        </el-button>
        <el-button
          size="mini"
          @click="pickDay('1985-02-24')"
          >
          1985-02-24
        </el-button>
      </p>
      <el-button
        size="mini"
        @click="toNextMonth">
        下个月
      </el-button>
    </div>
  </template>

</el-calendar>
<style>
  .custom-header {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
</style>
```
:::

### 自定义内容

:::demo 通过设置名为 `dateCell` 的 `scoped-slot` 来自定义日历单元格中显示的内容。在 `scoped-slot` 可以获取到 date（当前单元格的日期）, data（包括 type，isSelected，day 属性）。详情解释参考下方的 API 文档。
```html
<el-calendar>
  <!-- 这里使用的是 2.5 slot 语法，对于新项目请使用 2.6 slot 语法-->
  <template
    slot="dateCell"
    slot-scope="{date, data}">
    <p :class="data.isSelected ? 'is-selected' : ''">
      {{ data.day.split('-').slice(1).join('-') }} {{ data.isSelected ? '✔️' : ''}}
    </p>
  </template>
</el-calendar>
<style>
  .is-selected {
    color: #1989FA;
  }
</style>
```
:::

### 自定义范围

:::demo 设置 `range` 属性指定日历的显示范围。开始时间必须是周起始日，结束时间必须是周结束日，且时间跨度不能超过两个月。
```html
<el-calendar :range="['2019-03-04', '2019-03-24']">
</el-calendar>
```
:::

### Attributes
| 参数             | 说明          | 类型      | 可选值        | 默认值  |
|-----------------|-------------- |---------- |------------ |-------- |
| value / v-model | 绑定值         | Date/string/number | —  | —      |
| range           | 时间范围，包括开始时间与结束时间。开始时间必须是周一，结束时间必须是周日，且时间跨度不能超过两个月。 | Array     | —           | —      |
| first-day-of-week | 周起始日	    | Number    | 1 到 7      |  1     |


### header Scoped Slot Parameters
| Attribute       | Description   | Type      | Accepted Values       | Default  |
|-----------------|-------------- |---------- |---------------------- |--------- |
| dateText        | 日期文本      | String   | — | — |
| toPrevMonth     | 上个月  | Function | — | — |
| toNextMonth     | 下个月      | Function | — | — |
| toToday         | 当天           | Function | — | — |
| pickDay         | 跳转到目标日期     | Function | 'yyyy-MMM-dd' | — |

### dateCell scoped slot 参数
| 参数             | 说明          | 类型      | 可选值        | 默认值  |
|-----------------|-------------- |---------- |------------ |-------- |
| date            | 单元格代表的日期 | Date      | —           | —      |
| data            | { type, isSelected, day}，`type` 表示该日期的所属月份，可选值有 prev-month，current-month，next-month；`isSelected` 标明该日期是否被选中；`day` 是格式化的日期，格式为 yyyy-MM-dd    | Object      | —           | —      |
