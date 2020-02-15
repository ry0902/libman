<template>
  <div>
    <el-button type="primary" round size="small">借书</el-button>
    <el-dialog
      title="借书信息登记"
      :visible.sync="dialogFormVisible"
      @close="clear"
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
        <el-button type="primary" @click="onSubmit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
    name: "BorrowBook",
    inject: ['reload'],
    data(){
      return {
        dialogFormVisible: false,
        formLabelWidth: '120px',
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
    methods:{
      onSubmit() {
        if(this.book.cnt > 0){
          this.$axios.post('/bookBorrower',{
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
            this.reload()
          }
        })
      }
      else {
        this.$message({
              type: 'error',
              message: '书籍已无余量'
            })
      }
      },
      clear(){
        this.book = {
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
        }
        this.borrower = {
          name: '',
          tele: ''
        },
        this.btime = '',
        this.etime = ''
      }
    }
}
</script>

<style scoped>

</style>