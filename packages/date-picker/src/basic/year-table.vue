<template>
  <table @click="handleYearTableClick" class="el-year-table" @mousemove="handleMouseMove">
    <tbody>
    <tr>
      <td class="available" :class="getCellStyle(startYear + 0)">
        <div><span class="cell">{{ startYear }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 1)">
        <div><span class="cell">{{ startYear + 1 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 2)">
        <div><span class="cell">{{ startYear + 2 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 3)">
        <div><span class="cell">{{ startYear + 3 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 4)">
        <div><span class="cell">{{ startYear + 4 }}</span></div>
      </td>
    </tr>
    <tr>
      <td class="available" :class="getCellStyle(startYear + 5)">
        <div><span class="cell">{{ startYear + 5 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 6)">
        <div><span class="cell">{{ startYear + 6 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 7)">
        <div><span class="cell">{{ startYear + 7 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 8)">
        <div><span class="cell">{{ startYear + 8 }}</span></div>
      </td>
      <td class="available" :class="getCellStyle(startYear + 9)">
        <div><span class="cell">{{ startYear + 9 }}</span></div>
      </td>
      <td></td>
      <td></td>
    </tr>
    </tbody>
  </table>
</template>

<script type="text/babel">
  import { hasClass } from 'element-gui/src/utils/dom';
  import { isDate, range, nextDate, getDayCountOfYear, parseDate } from 'element-gui/src/utils/date-util';
  import { arrayFindIndex, coerceTruthyValueToArray } from 'element-gui/src/utils/util';

  const datesInYear = year => {
    const numOfDays = getDayCountOfYear(year);
    const firstDay = new Date(year, 0, 1);
    return range(numOfDays).map(n => nextDate(firstDay, n));
  };

  export default {
    props: {
      defaultValue: {
        validator(val) {
          // null or valid Date Object
          return val === null || (val instanceof Date && isDate(val));
        }
      },
      disabledDate: {},
      cellClassName: {},
      date: {},
      value: {},
      year: {},
      minDate: {},
      maxDate: {},
      selectionMode: {
        default: 'year'
      },
      rangeState: {
        default() {
          return {
            endDate: null,
            selecting: false
          };
        }
      }
    },

    computed: {
      startYear() {
        return Math.floor(this.date.getFullYear() / 10) * 10;
      }
    },

    methods: {
      getCellStyle(year) {
        const style = {};
        const today = new Date();

        style.disabled = typeof this.disabledDate === 'function'
          ? datesInYear(year).every(this.disabledDate)
          : false;
        style.today = today.getFullYear() === year;
        style.default = this.defaultValue && this.defaultValue.getFullYear() === year;
        if (this.selectionMode === 'range') {
          let minYear = this.minDate;
          let maxYear = this.rangeState.endDate ? this.rangeState.endDate : this.maxDate;
          [minYear, maxYear] = [Math.min(minYear, maxYear), Math.max(minYear, maxYear)];
          style['start-date'] = year === minYear;
          style['end-date'] = minYear && year === maxYear;
          style['in-range'] = minYear && year >= minYear && year <= maxYear;
        } else {
          style.current = arrayFindIndex(coerceTruthyValueToArray(this.value), date => date.getFullYear() === year) >= 0;
        }
        let yearDate = parseDate(year + '', 'yyyy');
        let classes = typeof this.cellClassName === 'function' && this.cellClassName(yearDate);
        if (classes && typeof classes === 'string') {
          classes.split(' ').forEach(className => {
            style[className] = true;
          });
        }
        return style;
      },

      nextTenYear() {
        this.$emit('pick', Number(this.year) + 10, false);
      },

      prevTenYear() {
        this.$emit('pick', Number(this.year) - 10, false);
      },

      handleYearTableClick(event) {
        let target = event.target;
        if (target.tagName === 'SPAN') {
          target = target.parentNode.parentNode;
        }
        if (target.tagName === 'DIV') {
          target = target.parentNode;
        }
        if (target.tagName !== 'TD') return;
        if (hasClass(target, 'disabled')) return;
        /* istanbul ignore if  */
        const year = Number(target.textContent || target.innerText);
        if (this.selectionMode === 'range') {
          if (!this.rangeState.selecting) {
            this.$emit('pick', {minDate: year, maxDate: null});
            this.rangeState.selecting = true;
            this.rangeState.endDate = null;
          } else {
            this.rangeState.selecting = false;
            if (year >= this.minDate) {
              this.$emit('pick', {minDate: this.minDate, maxDate: year});
            } else {
              this.$emit('pick', {minDate: year, maxDate: this.minDate});
            }
          }
        } else {
          this.$emit('pick', year);
        }
      },

      handleMouseMove(event) {
        let target = event.target;
        if (!this.rangeState.selecting) return;
        if (target.tagName === 'SPAN') {
          target = target.parentNode.parentNode;
        }
        if (target.tagName === 'DIV') {
          target = target.parentNode;
        }
        if (target.tagName !== 'TD') return;
        const row = target.parentNode.rowIndex;
        const column = target.cellIndex;
        if (hasClass(target.parentNode, 'disabled')) return;
        if (row !== this.lastRow || column !== this.lastColumn) {
          this.$emit('changerange', {
            minDate: this.minDate,
            maxDate: this.maxDate,
            rangeState: {
              selecting: true,
              endDate: Number(target.textContent || target.innerText)
            },
            el: target
          });
        }
      }
    }
  };
</script>
