<template>
  <div class="search">
    <el-form :inline="true" :model="search" class="demo-form-inline">
      <el-form-item label="模块">
        <el-select v-model="search.module">
           <el-option label="全部" value="全部" selected></el-option>
          <el-option :label="item" :value="item" v-for="(item, index) in modules" :key="index"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="类型">
        <el-select v-model="search.type">
          <el-option label="全部" value="全部" selected></el-option>
          <el-option label="功能" value="功能"></el-option>
          <el-option label="调试" value="调试"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="关键字">
        <el-input v-model="search.keyCode" placeholder="Some Text"></el-input>
      </el-form-item>

      <el-form-item label="描述">
        <el-input v-model="search.des" placeholder="Some Text"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button @click="onSubmit">搜索</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
export default {
  name: "h-search",
  props: {
    modules: Array,
  },
  data() {
    return {
      // 搜索信息
      search: {
        module: "全部",
        keyCode: "",
        type: "全部",
        des: "",
      },
    };
  },

  methods: {
    // 搜索
    onSubmit() {
      this.$emit("search", this.search);
    },
  },
};
</script>
<style scoped>
.el-select {
  width: 100px;
}
</style>
