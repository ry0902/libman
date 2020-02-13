module.exports = {
    publicPath: './',
    productionSourceMap: false,
    //为了让后端能够访问到前端的资源，需要配置跨域支持。
    devServer: {
        proxy: {
            '/api':{
                target:'http://localhost:8443', 
                changeOrigin:true,
                pathRewrite:{
                   '^/api': '/'
                }
            }
        }
    }
}