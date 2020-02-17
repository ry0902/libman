<template>
<div>
    <search-bar class="searchBar" ref="searchBar" @onSearch="searchClick"></search-bar>
    <el-button type="success" size="small" icon="el-icon-folder-opened" style="position:absolute;right:490px;top:89px" @click="list">全部</el-button>
    <div class="table">
        <el-table
            :data="tableData"
            height="610"
            border
            style="width: 1150px">
            <el-table-column
            prop="btime"
            label="借书日期"
            width="150">
            </el-table-column>
            <el-table-column
            prop="borrower.name"
            label="姓名"
            width="150">
            </el-table-column>
            <el-table-column
            prop="borrower.tele"
            label="联系方式"
            width="170">
            </el-table-column>
            <el-table-column
            prop="book.title2"
            label="书籍"
            width="210">
            </el-table-column>
            <el-table-column
            prop="book.author"
            label="作者"
            width="210">
            </el-table-column>
            <el-table-column
            prop="etime"
            label="还书日期"
            width="150">
            </el-table-column>
            <el-table-column
            label="操作"
            width="120">
            <template slot-scope="scope">
                <el-button type="text" @click="editRow(scope.$index)">编辑</el-button>
                <el-button type="text" @click="deleteRow(scope.$index)">删除</el-button>
            </template>
            </el-table-column>
    </el-table>
    <el-dialog
        title="修改信息"
        :visible.sync="dialogFormVisible"
        >
        <el-form style="text-align: left">
            <el-form-item label="书名" :label-width="formLabelWidth">
            <el-input autocomplete="off" :placeholder="book.title" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="作者" :label-width="formLabelWidth">
            <el-input autocomplete="off" :placeholder="book.author" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="姓名" :label-width="formLabelWidth">
            <el-input v-model="borrower.name" autocomplete="off" placeholder="借书人姓名"></el-input>
            </el-form-item>
            <el-form-item label="电话" :label-width="formLabelWidth">
            <el-input v-model="borrower.tele" autocomplete="off" placeholder="借书人联系方式"></el-input>
            </el-form-item>
            <el-form-item>
            <div>
                <span style="margin-left:80px;">时间</span>
                <el-date-picker
                v-model="btime"
                type="date"
                placeholder="选择日期"
                value-format="yyyy-MM-dd"
                style="margin-left:10px;">
                </el-date-picker>
                <span>--</span>
                <el-date-picker
                v-model="etime"
                align="right"
                type="date"
                value-format="yyyy-MM-dd"
                placeholder="选择日期">
                </el-date-picker>
            </div>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="onSubmit()">确 定</el-button>
        </div>
        </el-dialog>
    </div>
</div>
</template>

<script>
import SearchBar from '../library/SearchBar'
export default {
    name: "BorrowManage",
    data() {
      return {     
        tableData: [],
        dialogFormVisible: false,
        formLabelWidth: '120px',
        borrowerBookId: '',
        btime: '',   
        etime: '',
        book: {
          id: '',
          title: '',
          author: '',
          date: '',
          press: '',
          cover: '',
          abs: '',
          category: {
            id: '',
            name: ''
          },
          cnt: '',
          price: ''
        },
        borrower:{
          name: '',
          tele: ''
        }
      }
    },
    components:{SearchBar},
    mounted(){
        this.list()
        this.$refs.searchBar.placeholderString = "通过人名/书名/日期搜索"
    },
    methods: {
        list() {
            let _this = this
            this.$axios.get('/bookBorrower').then(resp => {
                if(resp && resp.status === 200){
                    // console.log(resp.data)
                    _this.tableData = resp.data
                    for(let i = 0; i < this.tableData.length; i ++){
                        this.tableData[i].book.title2 = "《" + this.tableData[i].book.title + "》"
                    }
                    // console.log(this.tableData)
                }
            })
        },
        deleteRow(index){
            this.$confirm('此操作将永久删除该书籍, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                // console.log(this.tableData[index])
                this.$axios.post('/deleteBookBorrower',this.tableData[index])
                this.tableData.splice(index, 1)
            }).catch(() => {
                 this.$message({
                 type: 'info',
                 message: '已取消删除'
                })
            })
        },
        editRow(index){
            this.dialogFormVisible = true
            this.borrowerBookId = this.tableData[index].id
            this.book = this.tableData[index].book
            this.borrower = this.tableData[index].borrower
            this.btime = this.tableData[index].btime
            this.etime = this.tableData[index].etime
        },
        onSubmit(){
            this.$axios.post('/bookBorrowerUpdate', {
                id: this.borrowerBookId,
                book: this.book,
                borrower: this.borrower,
                btime: this.btime,
                etime: this.etime
            }).then(resp => {
                if(resp && resp.status === 200){
                    this.dialogFormVisible = false
                    this.$emit('onSubmit')
                    this.$message({
                    type: 'success',
                    message: '提交成功'
                    })
                }
                this.reload()
            })
        },
        searchClick(){
            let _this = this
            this.$axios.post('/findRow',{
                keywords: this.$refs.searchBar.keywords
            }).then(resp => {
                if(resp && resp.status === 200){
                    _this.tableData = resp.data
                    for(let i = 0; i < this.tableData.length; i ++){
                        this.tableData[i].book.title2 = "《" + this.tableData[i].book.title + "》"
                    }
                    // console.log(this.tableData)
                }
            })
        }
    }
}
</script>

<style scoped>
.searchBar{
    position: absolute;
    /* margin-top: 100px; */
    margin-top: -50px;
    left: 400px;
}

.table{
    margin-left: 210px;
    margin-top: 70px;
}
</style>