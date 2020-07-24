import CalendarPro from './src/Index';

/* istanbul ignore next */
CalendarPro.install = function(Vue) {
  Vue.component(CalendarPro.name, CalendarPro);
};

export default CalendarPro;
