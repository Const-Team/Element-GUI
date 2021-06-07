<style lang="scss">
  .page-changelog {
    details {
      padding: 0;
      padding-bottom: 10px;
      margin: 10px 0;
      position: relative;
      color: #5e6d82;
      border-bottom: 1px solid #ddd;

      summary{
        position: relative;
      }

      span {
        font-size: 20px;
        color: #333;
        font-weight: bold;
      }

      em {
        float: right;
        font-style: normal;
        font-size: 16px;
        color: #666;
      }

      h4 {
        margin: 0;
        font-size: 18px;
        padding-left: 30px;
        padding-top: 10px;
        font-weight: bold;
      }

      ul {
        margin: 10px 0;
        padding: 0 30px 15px 50px;

        ul {
          padding: 0;
          padding-top: 5px;
          padding-left: 27px;

          li {
            padding-left: 0;
            color: #555;
            word-break: normal;
          }
        }
      }

    }
  }
</style>
<template>
  <div class="page-changelog">
    <change-log ref="changeLog"></change-log>
  </div>
</template>
<script>
  import ChangeLog from '../../../CHANGELOG.<%= 2 >.md';

  export default {
    components: {
      ChangeLog
    }
  };
</script>
