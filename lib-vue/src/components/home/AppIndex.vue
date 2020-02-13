<template>
    <div>
        <side-menu id="side-menu"></side-menu>
        <div class="home">
            <div id="header-div">
              <div style="height: 150px"></div>
              <carousel></carousel>
              <quick-nav style="float: right;margin-top:-450px;margin-right:480px"></quick-nav>
            </div>
            <update-card id="update-card"></update-card>
            <slogan id="slogan"></slogan>
            <about id="about"></about>
        </div>
    </div>
</template>

<script>
import SideMenu from './SideMenu'
import Carousel from './Carousel'
import QuickNav from './QuickNav'
import UpdateCard from './UpdateCard'
import Slogan from './Slogan'
import About from '../common/About'
export default {
    name: "AppIndex",
    components: {
        SideMenu,
        Carousel,
        QuickNav,
        UpdateCard,
        Slogan,
        About
    }
}
</script>

<style scoped>
.home {
    width: 990px;
    margin-left: auto;
    margin-right: auto;
    margin-top: -20px;
}
#side-menu {
    position: fixed;
    margin-left: 50%;
    left: -710px;
    top: 100px;
}
#header-div {
    margin-top: 40px;
    padding-bottom: 20px;
    padding-left: 5px;
    background-color: #fff;
}
</style>