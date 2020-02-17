<template>
  <el-container>
    <el-aside style="width: 200px;margin-top: 20px">
      <switch></switch>
      <SideMenu @indexSelect="listByCategory" ref="sideMenu"></SideMenu>
    </el-aside>
    <el-main>
      <category-add class="addBtn" @onSubmit="updateCategory" @deleteCate="updateCategory" ref="categoryAdd"></category-add>
      <books class="books-area" ref="booksArea"></books>
    </el-main>
  </el-container>
</template>

<script>
  import SideMenu from './SideMenu'
  import Books from './Books'
  import CategoryAdd from './CategoryAdd'
  export default {
    name: 'AppLibrary',
    components: {Books, SideMenu, CategoryAdd},
    methods: {
      listByCategory () {
        let _this = this
        let cid = this.$refs.sideMenu.cid
        let url = 'categories/' + cid + '/books'
        this.$axios.get(url).then(resp => {
          if (resp && resp.status === 200) {
            _this.$refs.booksArea.books = resp.data
          }
        })
      },
      updateCategory() {
        this.$refs.sideMenu.getCategory()
        this.$refs.booksArea.$refs.edit.getCategory()
        this.$refs.categoryAdd.getCategory()
      }
    }
  }
</script>

<style scoped>
  .books-area {
    width: 990px;
    margin-left: auto;
    margin-right: auto;
  }

  .addBtn {
    margin-left: 51%;
    position: absolute;
    z-index: 1000;
  }
</style>

