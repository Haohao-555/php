<template>
  <div class="nav-header" height=40>
      <div class="title item">
        <a>客户端配置管理系统</a>
      </div>
      <div :class="['exh', 'item', i == 1 ? 'active' : '']" @click="toIndex">
        <a>配置总览</a>
      </div>
      <div :class="['new', 'item', i == 2 ? 'active' : '']" @click="toCreate">
        <a>新建</a>
      </div>
  </div>
</template>
<script>
export default {
  name: "nav-header",
  props: {
    i: Number,
  },
  data() {
    return {};
  },
  methods: {
    toIndex() {
      if (this.$route.path != "/index") {
        this.$router.push({
          path: "/index",
        });
      }
    },
    toCreate() {
      let path = this.$route.path;
      if(this.i == -3) {
        this.$emit("updateState");
      }
      if (path != "/create") {
        this.$router.push({
          path: "/create",
        });
      }
    },
  },
};
</script>
<style>
a {
  color: #ffffff !important;
  line-height: 40px;
  font-size: 16px;
}

a:hover {
  color: #ffffff;
  text-decoration: none;
  cursor: pointer;
}

.nav-header {
  width: 100%;
  padding: 0 0 0 12px;
  box-sizing: border-box;
  height: 40px;
  background-color: rgba(77, 68, 152);
  /* display: flex; */
  position: sticky;
  top: 0;
  left: 0;
  z-index: 100;
}

.nav-header .item {
  padding: 0px 12px;
  float: left;
}

.nav-header .active {
  background-color: rgba(181, 5, 5);
}

.nav-header .exh a {
  font-size: 14px;
}

.nav-header .new a {
  font-size: 14px;
}
</style>
