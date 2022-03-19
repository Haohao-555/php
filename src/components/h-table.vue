<template>
  <div class="h-table">
    <el-table
      :data="tableData"
      border
      style="width: 100%"
      :header-cell-style="{
        backgroundColor: 'rgb(224, 224, 224)',
        padding: '6px 0px'
      }"
      :cell-style="{ padding: '6px 0px' }"
      @selection-change="handleSelectionChange"
      @row-click="toDetail"
    >
      <el-table-column type="selection" width="40" min-width="2.5%"></el-table-column>

      <el-table-column prop="id" label="序号" width="60" min-width="3.75%">
        <template slot-scope="scope">
          <span>{{ scope.$index + 1}}</span>
        </template>
      </el-table-column>

      <el-table-column
        prop="module"
        label="模块"
        width="180"
        min-width="12.5%"
        sortable
      ></el-table-column>

      <el-table-column prop="type" label="类型" width="80" min-width="5%" sortable>
      </el-table-column>

      <el-table-column
        prop="fun"
        label="功能说明"
        show-overflow-tooltip
        sortable
        min-width="25.625%"
      ></el-table-column>

      <el-table-column prop="keyCode" label="关键字" width="280" min-width="17.5%" sortable>
        <template slot-scope="scope">
             <span style="color: #44a4d5;">{{scope.row.keyCode}}</span>
        </template>
      </el-table-column>

      <el-table-column
        prop="val"
        label="值"
        show-overflow-tooltip
         min-width="25.625%"
        sortable
      ></el-table-column>

      <el-table-column
        prop="time"
        label="生效时间"
        width="120"
        min-width="7.5%"
        show-overflow-tooltip
        sortable
      >
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  name: "h-table",
  props: {
    tableData: Array,
  },
  data() {
    return {
      multipleSelection: [],
    };
  },
  methods: {
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    toDetail(row) {
      this.$router.push({
          path: "/detail",
          query: {id: row.id}
        });
    }
  },
};
</script>
<style scoped>
.h-table {
  padding: 0px 15px;
  box-sizing: border-box;
}
</style>
