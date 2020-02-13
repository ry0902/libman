<template>
  <div>
    <el-button type="primary" round size="small">借书</el-button>
    <el-dialog
      title="借书信息登记"
      :visible.sync="dialogFormVisible"
      >
      <el-form style="text-align: left">
        <el-form-item label="书名" :label-width="formLabelWidth">
          <el-input autocomplete="off" placeholder="" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="作者" :label-width="formLabelWidth">
          <el-input autocomplete="off" placeholder="" :disabled="true"></el-input>
        </el-form-item>
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input autocomplete="off" placeholder="借书人姓名"></el-input>
        </el-form-item>
        <el-form-item label="电话" :label-width="formLabelWidth">
          <el-input autocomplete="off" placeholder="借书人联系方式"></el-input>
        </el-form-item>
        <el-form-item>
          <div>
            <span style="margin-left:80px;">时间</span>
            <el-date-picker
              v-model="value1"
              type="date"
              placeholder="选择日期"
              style="margin-left:10px;">
            </el-date-picker>
            <span>--</span>
            <el-date-picker
              v-model="value2"
              align="right"
              type="date"
              placeholder="选择日期">
            </el-date-picker>
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
    name: "BorrowBook",
    data(){
      return {
        dialogFormVisible: false,
        formLabelWidth: '120px',
        value1: '',   
        value2: '',
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
      }
    },
    methods:{
    }
}
</script>

<style scoped>

</style>