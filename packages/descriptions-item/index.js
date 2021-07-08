import DescriptionsItem from '../descriptions/src/description-item.js';

/* istanbul ignore next */
DescriptionsItem.install = function install(Vue) {
  Vue.component(DescriptionsItem.name, DescriptionsItem);
};

export default DescriptionsItem;
