<template>
  <div style="margin-bottom: 30px;display: flex;margin-left:150px">
    <el-input
      @keyup.enter.native="searchClick"
      :placeholder= placeholderString
      prefix-icon="el-icon-search"
      size="small"
      style="width: 400px;margin-right: 10px"
      v-model="keywords">
    </el-input>
    <el-button size="small" type="primary" icon="el-icon-search" @click="searchClick">搜索</el-button>
  </div>
</template>

<script>
  export default {
    name: 'SearchBar',
    data () {
      return {
        keywords: '',
        books: [],
        cardLoading: [],
        placeholderString: ''
      }
    },
    methods: {
      searchClick () {
        this.$emit('onSearch')
      }
    }
  }
</script>

<style scoped>

</style>

