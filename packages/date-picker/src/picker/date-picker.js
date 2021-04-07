import Picker from '../picker';
import DatePanel from '../panel/date';
import DateRangePanel from '../panel/date-range';
import MonthRangePanel from '../panel/month-range';
import YearRangePanel from '../panel/year-range';
import QuarterRangePanel from '../panel/quarter-range.vue';

const getPanel = function(type) {
  if (type === 'daterange' || type === 'datetimerange') {
    return DateRangePanel;
  } else if (type === 'monthrange') {
    return MonthRangePanel;
  } else if (type === 'yearrange') {
    return YearRangePanel;
  } else if (type === 'quarterrange') {
    return QuarterRangePanel;
  }
  return DatePanel;
};

export default {
  mixins: [Picker],

  name: 'ElDatePicker',

  props: {
    type: {
      type: String,
      default: 'date'
    },
    timeArrowControl: Boolean
  },

  watch: {
    type(newType) {
      if (this.picker) {
        this.doDestroy();
        this.unmountPicker();
        this.panel = getPanel(newType);
        this.mountPicker();
      } else {
        this.panel = getPanel(newType);
      };
      this.appended = false;
      this.$nextTick(()=> {
        this.referenceElm = this.$refs.reference.$el || this.$refs.reference;
      });
    }
  },

  created() {
    this.panel = getPanel(this.type);
  }
};
