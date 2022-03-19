<template>
  <div class="aside">
    <ul class="list">
      <li
        v-for="(item, i) in list"
        :key="i"
        :class="[item.id == activeId ? 'active' : '']"
        @click="$emit('detail', item.id)"
      >
        {{ item.keyCode }}
      </li>
    </ul>
    <!-- 分页器 -->
    <div class="pagination" v-if="paginationShow">
      <el-pagination
        background
        layout="prev, pager, next"
        :page-size="limit"
        :total="total"
        :pager-count="5"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>
  </div>
</template>
<script>
export default {
  name: "h-list",
  props: {
    list: Array,
    activeId: String,
    total: Number,
    limit: Number,
  },
  data() {
    return {
      // 分页器
      paginationShow: true,
    };
  },
  watch: {
      total() {
        if(this.total <= this.limit) {
          this.paginationShow = false;
        }
      }
  },
  methods: {
    handleCurrentChange(newPage) {
       this.$emit("updatePageSize", newPage);
    }
  },
};
</script>
<style scoped>
.list {
  width: 280px;
  height: 525px;
  overflow: auto;
  border: 1px solid rgb(162, 192, 233);
}
.list li {
  font-size: 14px;
  height: 35px;
  line-height: 35px;
  border-bottom: 1px solid rgb(214, 214, 214);
  color: rgb(68, 164, 213);
  padding-left: 6px;
  box-sizing: border-box;
}
.list li:hover {
  background-color: rgb(255, 218, 141);
  cursor: pointer;
}
.list li.active {
  background-color: rgb(255, 218, 141);
}
.pagination {
  width: 280px;
  margin: auto;
  text-align: center;
}
</style>
