<template>
  <div id="app">
    <router-view v-if="isRouterAlive"></router-view>
  </div>
</template>

<script>
export default {
  name: 'App',
  provide () {
    return {
      reload: this.reload
    }
  },
  data () {
    return {
      isRouterAlive: true,
       note: {
            backgroundImage: "url(" + require("./assets/img/bg/naruto.jpg") + ")",
            backgroundRepeat: "no-repeat",
            backgroundSize: "25px auto",
            marginTop: "5px",
        }
    }
  },
  methods: {
    reload () {
      this.isRouterAlive = false
      this.$nextTick(function () {
        this.isRouterAlive = true
      })
    }
  }
}
</script>

<style>
#app {
  background-color: #F5F5F5;
}
</style>
