import ElResult from './src/index.vue';

/* istanbul ignore next */
ElResult.install = function(Vue) {
  Vue.component(ElResult.name, ElResult);
};

export default ElResult;
