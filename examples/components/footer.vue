<template>
  <footer class="footer">
    <p>© 1998-{{new Date().getFullYear()}}  <a href="https://www.glodon.com/">Glodon E-government UED</a></p>
  </footer>
</template>

<style lang="scss">
  .footer {
    border-top:1px solid #eaeefb; 
    width: 100%;
    text-align: center;
    padding: 40px 0;
    box-sizing: border-box;
  }
</style>

<script type="text/babel">
  import compoLang from '../i18n/component.json';
  import Element from 'main/index.js';
  const { version } = Element;

  export default {
    data() {
      return {
        version
      };
    }
  };
</script>
