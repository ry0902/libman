<template>
   <body id="poster">
        <el-form label-position="left" 
             label-width="0px"
             :model="loginForm"
             ref="loginForm"
             class="login-container">
        <h3 class="login_title">系统登录</h3>
        <el-form-item prop="username">
            <el-input type="text" v-model="loginForm.username" autocomplete="off" 
                      placeholder="账号"></el-input>
        </el-form-item>
        <el-form-item prop="password">
            <el-input type="password" v-model="loginForm.password" autocomplete="off" 
                      placeholder="密码"></el-input>
        </el-form-item>
        <el-form-item id="btn">
            <el-button type="primary" style="width: 100%; background: #505458;border: none" @click="login">登录</el-button>
        </el-form-item>
    </el-form>
   </body>
</template>

<script>
export default {
    name: "Login",
    data(){
        return {
            loginForm: {
                username: 'admin',
                password: '123'
            },
            responseReslut: []
        }
    },
    methods: {
        login() {
            let _this = this
            this.$axios
                .post('/login', {
                    username: this.loginForm.username,
                    password: this.loginForm.password
                })
                .then(successResponse => {
                    if(successResponse.data.code === 200) {
                        _this.$store.commit('login', _this.loginForm)
                        let path = this.$route.query.redirect
                        this.$router.replace({path: path === '/' || path === undefined ? '/index' : path})
                    }
                })
                .catch(failResponse =>{
                })
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
            console.log(111)
        }
    }
}
</script>

<style scoped>
#poster {
    background:url("../assets/img/bg/eva.jpg") no-repeat;
    background-position: center;
    height: 100%;
    width: 100%;
    background-size: cover;
    position: fixed;
}
body {
    margin: 0px;
    padding: 0px;
}
.login-container {
    border-radius: 15px;
    background-clip: padding-box;
    margin: 90px auto;
    width: 350px;
    padding: 35px 35px 15px 35px;
    background: #fff;
    border: 1px solid #eaeaea;
    box-shadow: 0 0 25px #cac6c6;
  }
  .login_title {
    margin: 0px auto 40px auto;
    text-align: center;
    color: #505458;
  }
</style>