<template>
  <div>
    <el-button size="small" type="success" icon="el-icon-edit" @click="dialogFormVisible = true">编辑分类</el-button>
    <el-dialog
      title="编辑"
      :visible.sync="dialogFormVisible"
      @close="clear"
      width="40%"
      :modal-append-to-body="false">
      <el-tabs type="card" v-model="activeName">
        <el-tab-pane label="增加" name="first">
          <el-form v-model="category" style="text-align: left" ref="dataForm">
            <el-form-item label="分类" :label-width="formLabelWidth" prop="name">
              <el-input v-model="category.name" autocomplete="off" style="width:350px;"></el-input>
            </el-form-item>
          </el-form>
          <div class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="onSubmit">确 定</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="修改" name="second">
          <el-form v-model="category" style="text-align: left" ref="dataForm">
            <el-form-item label="分类" :label-width="formLabelWidth" prop="name">
              <el-select v-model="category.id" placeholder="请选择分类">
                <el-option v-for="item in categories" 
                        :key="item.id" 
                        :label="item.name" 
                        :value="item.id.toString()">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="修改" :label-width="formLabelWidth">
              <el-input v-model="category.name" autocomplete="off" style="width:350px;"></el-input>
            </el-form-item>
          </el-form>
          <div class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="onSubmit">确 定</el-button>
          </div>
        </el-tab-pane>
        <el-tab-pane label="删除" name="third">
          <el-form v-model="category" style="text-align: left" ref="dataForm">
            <el-form-item label="类别" :label-width="formLabelWidth" prop="name">
              <el-select v-model="category.id" placeholder="请选择分类">
                <el-option v-for="item in categories" 
                        :key="item.id" 
                        :label="item.name" 
                        :value="item.id.toString()">
                </el-option>
              </el-select>
            </el-form-item>
          </el-form>
          <div class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="deleteCate">确 定</el-button>
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-dialog>
  </div>
</template>

<script>
export default {
    name: 'CategoryEdit',
    data() {
        return {
            dialogFormVisible: false,
            category: {
              id: '',
              name: ''
            },
            categories: [],
            formLabelWidth: '60px',
            activeName: 'first'
        }
    },
    mounted() {
      this.getCategory()
    },
    methods: {
        clear() {
            this.category = {
                id: '',
                name: ''
            }
        },
        onSubmit() {
            this.$axios
              .post('/category', {
                  id: this.category.id,
                  name: this.category.name
              }).then(resp => {
                  if (resp && resp.status === 200) {
                    this.dialogFormVisible = false
                    this.$emit('onSubmit')
                  }
              })
        },
        getCategory() {
        let _this = this
        this.$axios.get('/category').then(resp => {
          if(resp && resp.status === 200){
            _this.categories = resp.data
          }
        })
      },
      deleteCate() {
        let _this = this
        this.$confirm('此操作将永久删除该分类, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
            this.$axios
              .post('/deleteCate', {id: this.category.id}).then(resp => {
              if (resp && resp.status === 200) {
                _this.dialogFormVisible = false
                _this.getCategory()
                this.$emit('deleteCate')
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
    }
  }
</script>

<style scoped>
.dialog-footer {
  margin-left:400px;
}
</style>


