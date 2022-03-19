<template>
  <div class="index">
    <nav-header :i="1"></nav-header>
      <div class="option">
        <h-search @search="search" :modules="modules"></h-search>
        <div class="delete">
          <el-button type="primary" @click="openDialog">批量删除</el-button>
        </div>
      </div>
      <h-table :tableData="tableData" ref="hSearch"></h-table>
    <el-dialog title="提示" :visible.sync="dialogVisible" width="30%">
      <span>您确定要删除该数据吗？</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="del()">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>
<script>
import navHeader from "../components/nav-header.vue";
import hSearch from "../components/h-search.vue";
import HTable from "../components/h-table.vue";
import qs from "qs";
export default {
  name: "Index",
  components: {
    navHeader,
    hSearch,
    HTable,
  },
  data() {
    return {
      tableData: [],
      modules: [],
      dialogVisible: false,
      multipleSelection: [],
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    getData() {
      this.$axios.post("/home/getTableData").then((res) => {
        this.tableData = res.project;
        this.modules = [...new Set(this.tableData.map((item) => item.module))];
      });
    },
    search(data) {
      this.$axios.post("/home/search", qs.stringify(data)).then((res) => {
        this.tableData = res.project;
      });
    },
    openDialog() {
      this.multipleSelection = this.$refs.hSearch.multipleSelection;
      if (this.multipleSelection.length == 0) {
        this.$message({
          message: "您没有选中你要删除的数据",
          type: "warning",
        });
      } else {
        this.dialogVisible = true;
      }
    },
    del() {
      let arr = this.multipleSelection.map((item) => item.id);
      this.$axios.post("/home/del", qs.stringify(arr)).then((res) => {
        this.dialogVisible = false;
        if (res == 0) {
          this.$message({
            message: "删除成功",
            type: "success",
          });
          this.getData();
        }
      });
    },
  },
};
</script>
<style scoped>
.option {
  padding: 6px 15px 0px 15px;
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
  background-color: #fff;
  height: 50px;
  margin-top: auto;
  margin-bottom: auto;
  position: sticky;
  top: 40px;
  left: 0;
  z-index: 100;
}
.el-main {
  padding: 0;
}
</style>
