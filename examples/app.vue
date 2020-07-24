<template>
  <div
    id="app"
    :class="[
      { 'is-component': isComponent },
      { 'is-home': isHome },
      { 'is-guide': isGuide },
      { 'is-resource': isResource }
    ]"
  >
    <main-header v-if="lang !== 'play'"></main-header>
    <div class="main-cnt">
      <router-view></router-view>
    </div>
    <main-footer v-if="isHome || isResource"></main-footer>
  </div>
</template>

<script>
import { use } from 'main/locale';
import zhLocale from 'main/locale/lang/zh-CN';
import enLocale from 'main/locale/lang/en';
import esLocale from 'main/locale/lang/es';
import frLocale from 'main/locale/lang/fr';

const lang = 'zh-CN';
const localize = lang => {
  switch (lang) {
    case 'zh-CN':
      use(zhLocale);
      break;
    case 'es':
      use(esLocale);
      break;
    case 'fr-FR':
      use(frLocale);
      break;
    default:
      use(enLocale);
  }
};
localize(lang);

export default {
  name: 'app',

  computed: {
    lang() {
      'zh-CN';
    },
    isComponent() {
      return /^component-/.test(this.$route.name || '');
    },
    isGuide() {
      return /^guide-/.test(this.$route.name || '');
    },
    isResource() {
      return /^resource/.test(this.$route.name || '');
    },
    isHome() {
      if (this.$route.name === 'home') {
        return this.$route.name;
      } else {
        return false;
      }
    }
  },

  watch: {
    // lang(val) {
    //   if (val === 'zh-CN') {
    //     this.suggestJump();
    //   }
    //   localize(val);
    // }
  },

  methods: {
  },

  mounted() {
    // localize(this.lang);
    // if (this.lang === 'zh-CN') {
    //   this.suggestJump();
    // }
  }
};
</script>
