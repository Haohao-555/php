import Vue from 'vue';
import App from './App.vue';
import router from "./router";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import axios from "axios";

axios.defaults.baseURL = 'http://192.168.220.1:80/back'

Vue.prototype.$axios = axios;

Vue.config.productionTip = false;

Vue.use(ElementUI);

axios.interceptors.request.use(function(config) {
    return config;
}, function(error) {
    return Promise.reject(error);
})

axios.interceptors.response.use(function(response) {
    let status = response.status;
    if (status === 200) {
        return Promise.resolve(response.data);
    } else {
        return Promise.reject(response.status);
    }
})
new Vue({
    router,
    render: h => h(App),
}).$mount('#app')


