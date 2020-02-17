<template>
  <el-card class="card-carousel">
    <el-carousel :interval="4000" arrow="always">
      <el-carousel-item v-for="(item,index) in items" :key="index">
        <a :href = item.link target="_blank">
            <img :src= item.img  alt="" class="carousel_img">
        </a>
        <h3>{{ item.title }}</h3>
      </el-carousel-item>
  </el-carousel>
  </el-card>
</template>

<script>
export default {
    name: "Carousel",
    data() {
      return {
        items: [{
          title: 'How2J.cn - Java 全栈学习网站',
          img: require('../../../static/img/carousel/how2j.png'),
          link: 'http://how2j.cn?p=50613'},
        {
          title: 'Vue.js - 渐进式 JavaScript 框架',
          img: require('../../../static/img/carousel/vue.png'),
          link: 'https://cn.vuejs.org/'
        },
        {
          title: 'element-ui - 网站快速成型工具',
          img: require('../../../static/img/carousel/element.png'),
          link: 'http://element-cn.eleme.io/#/zh-CN'
        }]
      }
    }
}
</script>

<style scoped>
.el-carousel__item h3 {
    color: black;
    font-size: 15px;
    bottom: 43px;
    float: left;
    position: relative;
  }

.card-carousel {
    margin-left: 20px;
    width: 680px;
    height: 320px;
}

.el-carousel__item:nth-child(2n) {
    background: black;
  }

.el-carousel__item:nth-child(2n+1) {
    background: black;
}

.carousel_img {
    height: 100%;
    width: 100%;
    text-align: center;
}
</style>