<template>
    <div>
        <el-card class="box-card">
            <div style="font-size: 40px; color: azure;white-space: nowrap">Talk is nothing, show you my code.</div>
            <a href="https://github.com/Antabot/White-Jotter" target="_blank">
                <img src="../../assets/img/icon/icon6.png" alt="" class="git-link">
            </a>
            <a href="http://blog.poorange.cn/" target="_blank">
                <img src="../../assets/img/icon/kunkun.jpg" alt="" class="csdn-link">
            </a>
        </el-card>
    </div>
</template>

<script>
export default {
    name: ""
}
</script>

<style scoped>
.box-card {
    width: 100%;
    height: 150px;
    background-color: black;
    text-align: center;
    margin-top: 5px;
}
.git-link {
    width: 60px;
}
.csdn-link {
    width: 46px;
    margin-bottom: 5px;
    margin-left: 15px;
    border-radius: 25px;
}

</style>