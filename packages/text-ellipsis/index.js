import TextEellipsis from './src/main';

/* istanbul ignore next */
TextEellipsis.install = function(Vue) {
  Vue.component(TextEellipsis.name, TextEellipsis);
};

export default TextEellipsis;
