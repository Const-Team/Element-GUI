import { once, on } from 'element-gui/src/utils/dom';

export default {
  bind(el, binding, vnode) {
    const DELAY = 300;
    const INTERVAL = 100;
    let intervalTimer = null;
    let delayTimer = null;
    const handler = () => vnode.context[binding.expression].apply();
    const clear = () => {
      clearInterval(intervalTimer);
      clearTimeout(delayTimer);
      intervalTimer = null;
      delayTimer = null;
    };

    on(el, 'mousedown', (e) => {
      if (e.button !== 0) return;
      once(document, 'mouseup', clear);
      clearInterval(intervalTimer);

      if (delayTimer) {
        clearTimeout(delayTimer);
      }

      delayTimer = setTimeout(() => {
        intervalTimer = setInterval(handler, INTERVAL);
        delayTimer = null;
      }, DELAY);
    });
  }
};
