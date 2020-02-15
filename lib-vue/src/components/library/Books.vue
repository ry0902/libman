<template>
  <div>
    <el-row style="height: 840px;">
      <search-bar @onSearch="searchResult" @onSubmit="loadBooks()" ref="searchBar" class="searchBtn"></search-bar>
        <el-card v-for="item in books.slice((currentPage-1)*pagesize,currentPage*pagesize)"
                 :key="item.id"
                 style="width: 135px;margin-bottom: 20px;height: 270px;float: left;margin-right: 15px" class="book"
                 bodyStyle="padding:10px" shadow="hover"
                 @onSubmit="loadBooks()">
          <div class="cover" @click="editBook(item)">
            <img :src="item.cover" alt="封面">
          </div>
          <div class="info">
            <div class="title">
              <a href="">{{item.title}}</a>
            </div>
            <i class="el-icon-delete" @click="deleteBook(item.id)"></i>
          </div>
          <div class="author">{{item.author}}</div>
          <div @click="getBookDetail(item)">
            <borrow-book style="float:left"></borrow-book>
          </div>
          <el-tooltip effect="dark" 
                      placement="top-start"
                      >
                <p slot="content" style="font-size: 14px;margin-bottom: 6px;">{{item.title}}</p>
                <p slot="content" style="font-size: 13px;margin-bottom: 6px">
                  <span>{{item.author}}</span> /
                  <span>{{item.date}}</span> /
                  <span>{{item.press}}</span>
                </p>
                <p slot="content" style="width: 300px" class="abstract">{{item.abs}}</p>
                <p slot="content" style="font-size: 14px;margin-bottom: 6px;">余量 : {{item.cnt}}</p>
                <p slot="content" style="font-size: 14px;margin-bottom: 6px;">赔付价格 : {{item.price}} 元 / 本</p>
                <el-button type="success" round size="small" style="margin-left:3px">详情</el-button>
          </el-tooltip>
        </el-card>
      <edit-form @onSubmit="loadBooks()" ref="edit"></edit-form>
      <borrow-book style="float:left" ref="borrowbook" class="borrowBook"></borrow-book>
    </el-row>
    <el-row style="margin-top:120px">
      <el-pagination
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-size="pagesize"
        :total="books.length">
      </el-pagination>
    </el-row>
  </div>
</template>

<script>
  import EditForm from './EditForm'
  import SearchBar from './SearchBar'
  import BorrowBook from './BorrowBook'
  export default {
    name: 'Books',
    components: {EditForm, SearchBar, BorrowBook},
    data () {
      return {
        books: [],
        currentPage: 1,
        pagesize: 17,
        dialogFormVisible: false,
        formLabelWidth: '120px'
      }
    },
    mounted() {
      this.loadBooks()
      this.$refs.searchBar.placeholderString = "通过书名或作者搜索..."
    },
    methods: {
      loadBooks () {
        let _this = this
        this.$axios.get('/books').then(resp => {
          if (resp && resp.status === 200) {
            _this.books = resp.data
          }
        })
      },
      handleCurrentChange(currentPage) {
        this.currentPage = currentPage
      },
      searchResult () {
        let _this = this
        this.$axios
          .post('/search', {
            keywords: this.$refs.searchBar.keywords
          }).then(resp => {
          if (resp && resp.status === 200) {
            _this.books = resp.data
          }
        })
      },
      deleteBook (id) {
        this.$confirm('此操作将永久删除该书籍, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$axios
              .post('/delete', {id: id}).then(resp => {
              if (resp && resp.status === 200) {
                this.loadBooks()
              }
            })
          }
        ).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          })
        })
      },
      editBook (item) {
        this.$refs.edit.dialogFormVisible = true
        this.$refs.edit.form = {
          id: item.id,
          cover: item.cover,
          title: item.title,
          author: item.author,
          date: item.date,
          press: item.press,
          abs: item.abs,
          category: {
            id: item.category.id.toString(),
            name: item.category.name
          },
          cnt: item.cnt,
          price: item.price
        }
      },
      getBookDetail(item) {
        this.$refs.borrowbook.dialogFormVisible = true
        this.$refs.borrowbook.book = {
          id: item.id,
          cover: item.cover,
          title: item.title,
          author: item.author,
          date: item.date,
          press: item.press,
          abs: item.abs,
          category: {
            id: item.category.id.toString(),
            name: item.category.name
          },
          cnt: item.cnt,
          price: item.price
        }
      }
    }
  }
</script>
<style scoped>

  .cover {
    width: 115px;
    height: 172px;
    margin-bottom: 7px;
    overflow: hidden;
    cursor: pointer;
  }

  img {
    width: 115px;
    height: 172px;
    /*margin: 0 auto;*/
  }

  .title {
    font-size: 14px;
    text-align: left;
  }

  .author {
    color: #333;
    width: 102px;
    font-size: 13px;
    margin-bottom: 6px;
    text-align: left;
  }

  .abstract {
    display: block;
    line-height: 17px;
  }

  .el-icon-delete {
    cursor: pointer;
    float: right;
  }

  .el-icon-more {
    cursor: pointer;
    float: right;
    margin-top:-10px;
  }

  .switch {
    display: flex;
    position: absolute;
    left: 780px;
    top: 25px;
  }

  a {
    text-decoration: none;
  }

  a:link, a:visited, a:focus {
    color: #3377aa;
  }

  .borrowBook{
    position: absolute;
    margin-left: -1000px;
  }
</style>

