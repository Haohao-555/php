import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../view/home";
import Detail from "../view/detail";
import Create from "../view/create";

Vue.use(VueRouter);
const routes = [{
    path: "/",
    redirect: "index",
}, {
    path: "/index",
    name: "index",
    component: Home
}, {
    path: "/create",
    name: "create",
    component: Create
}, {
    path: "/detail",
    name: "detail",
    component: Detail,
}];
const router = new VueRouter({
    mode: "history",
    routes,
})
export default router;
