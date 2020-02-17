<template>
<el-menu 
    :default-active= "$route.path" 
    router 
    mode="horizontal" 
    background-color="white"
    text-color="#222"
    active-text-color="red"
    style="min-width: 1300px"
    >
  <el-menu-item v-for="(item, i) in navList" :key="i" :index="item.name">
      {{item.navItem}}
  </el-menu-item>
  <a href="#nowhere" @click="givMessage" style="color: #222;float: right;padding: 15px;">更多功能</a>
  <i class="el-icon-menu" style="float:right;font-size: 35px;color: #222;padding-top: 9px"></i>
  <span style="position: absolute;padding-top: 13px;right: 43%;font-size: 20px;font-weight: bold">Lib Man - You Deserve It</span>
</el-menu>
</template>

<script>
export default {
    name: "NavMenu",
    data() {
        return{
            navList: [
                {name: '/index', navItem: '首页'},
                // {name: '/jotter', navItem: '笔记本'},
                {name: '/library', navItem: '图书馆'},
                {name: '/borrowManage', navItem: '借阅管理'},
                {name: '/admin', navItem: '中二寄语'}
            ]
        }
    },
    methods: {
        givMessage() {
            this.$message({
                type: 'info',
                message: '没有更多功能了哦！'
            })
        }
    }
}
</script>

<style scoped>
 a{
    text-decoration: none;
  }

  span {
    pointer-events: none;
  }
</style>