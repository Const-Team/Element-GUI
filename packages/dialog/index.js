import directive from './src/directive.js';
import ElDialog from './src/component';

/* istanbul ignore next */
ElDialog.install = function(Vue) {
  Vue.use(directive);
  Vue.component(ElDialog.name, ElDialog);
};

export default ElDialog;
