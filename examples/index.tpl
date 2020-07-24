<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_137970_p1tpzmomxp9cnmi.css">
    <link rel="stylesheet" href="https://lib.baomitu.com/highlight.js/9.15.10/styles/color-brewer.min.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1452621_9iwfwaib39k.css">
    <title>魔方组件</title>
    <meta name="description" content="魔方组件" />
  </head>
  <body>
    <script>
      if (!window.Promise) {
        document.write('<script src="https://lib.baomitu.com/es6-promise/4.1.1/es6-promise.min.js"><\/script><script>ES6Promise.polyfill()<\/script>')
      }
    </script>
    <div id="app"></div>
    <% if (process.env.NODE_ENV === 'production') { %>
      <script src="https://lib.baomitu.com/vue/2.6.11/vue.runtime.min.js"></script>
      <script src="https://lib.baomitu.com/vue-router/3.1.3/vue-router.min.js"></script>
      <script src="https://lib.baomitu.com/highlight.js/9.15.10/highlight.min.js"></script>
    <% } %>
  </body>
</html>
