<template>
  <div class="footer">
    <div style="border-top:1px #1F1F1F solid;">
      <p class="alt" style="width:100%;color:#999; line-height:0">&copy; 版权所有：橘生淮南则为橘 &nbsp;
        <span>技术支持：</span>
        <a href="###" target="_blank" style="color:#999;">橘生淮南则为橘 & 高秃瓢</a>
      </p>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Footer'
  }
</script>

<style scoped>

  /*通用开始*/

  * {
    margin: 0;
    padding: 0;
    font-family: '微软雅黑', Arial, Helvetica, sans-serif;
  }

  body {
    font-size: 12px;
  }

  div {
    font-size: 12px;
  }

  span {
    font-size: 12px;
  }
  /*通用结束*/

  .footer {
    background: #2b2e33;
    /*background: black;*/
  }

  .footer .alt {
    overflow: hidden;
    padding: 20px 0;
    width: 1160px;
    margin: auto;
  }

  .footer .alt .foot {
    width: 138px;
    float: left;
  }

  .footer .alt .foot p {
    color: #FFF;
    line-height: 28px;
  }

  a{
    text-decoration: none;
  }

  .footer .alt .foot a {
    color: #999;
    display: block;
    line-height: 24px;
  }

  p{
      text-align: center;
  }
</style>
