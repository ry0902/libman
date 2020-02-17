<template>
    <div class="quick-nav">
        <img src="../../assets/img/icon/icon2.png" alt="" class="monster">
        <img src="../../assets/img/icon/icon5.png" alt="" class="readme">
        <img src="../../assets/img/icon/icon6.png" alt="" class="logo">
        <img src="../../assets/img/icon/icon7.png" alt="" class="spark">
        <div class="lang">
            <span>L.B.</span>
        </div>
    </div>
</template>

<script>
export default {
    name: "QuickNav"
}
</script>

<style scoped>
.quick-nav {
    width: 303px;
    height: 318px;
    background-color: transparent;
}
.monster {
    width: 280px;
    height: 260px;
}
.readme {
    width: 300px;
    height: 285px;
    position: absolute;
    margin-left: 50%;
    top: 300px;
    left: 230px;
}
.spark {
    position: absolute;
    margin-left: 55%;
    left: 20px;
    top: 120px;
}
.logo {
    width: 170px;
    position: absolute;
    margin-left: 50%;
    top: 90px;
    left: 280px;
}

.lang {
    position: absolute;
    right: 400px;
    top: 155px;
}

.lang span {
    font-size: 30px;
    color: white;
}
</style>