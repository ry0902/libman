<template>
<div>
  <el-menu
    class="categories"
    default-active="0"
    @select="handleSelect"
    active-text-color="red">
    <el-menu-item index="0">
      <i class="el-icon-menu"></i>
      <span slot="title">全部</span>
    </el-menu-item>
    <el-menu-item v-for="item in category" :key="item.id" :index="item.id.toString()">
      <i class="el-icon-menu"></i>
      <span slot="title">{{item.name}}</span>
    </el-menu-item>
  </el-menu>
</div>
</template>

<script>
  export default {
    name: 'SideMenu',
    data () {
      return {
        cid: '',
        category: []
      }
    },
    mounted() {
      this.getCategory()
    },
    methods: {
      handleSelect (key, keyPath) {
        this.cid = key
        this.$emit('indexSelect')
      },
      getCategory() {
        let _this = this
        this.$axios.get('/category').then(resp => {
          if(resp && resp.status === 200){
            _this.category = resp.data
          }
        })
      }
    }
  }
</script>

<style scoped>
  .categories {
    position: fixed;
    margin-left: 48%;
    left: -600px;
    top: 152px;
    width: 150px;
  }
</style>

