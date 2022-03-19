<template>
  <div class="detail">
    <nav-header :i="-1"></nav-header>
    <div class="main">
      <h-list
        :list="list"
        :activeId="id"
        :total="listtotal"
        :limit="limit"
        @updatePageSize="updatePageSize"
        @detail="listClick"
      ></h-list>
      <div class="content">
        <div class="title">
          <div class="prompt">配置详情> {{ detail.keyCode }}</div>
          <div class="option">
            <el-button type="primary" size="medium" @click="update"
              >修改</el-button
            >
            <el-button
              type="primary"
              size="medium"
              @click="dialogVisible = true"
              >删除</el-button
            >
            <el-button type="primary" size="medium" @click="$router.go(-1)"
              >返回</el-button
            >
          </div>
        </div>
        <div class="detail">
          <div class="item">
            <span>模块：</span>
            <div class="define">{{ detail.module }}</div>
          </div>
          <div class="item">
            <span>类型：</span>
            <div class="define">{{ detail.type }}</div>
          </div>
          <div class="item">
            <span>功能说明：</span>
            <div class="define">{{ detail.fun }}</div>
          </div>
          <div class="item">
            <span>关键字：</span>
            <div class="define">{{ detail.keyCode }}</div>
          </div>
          <div class="item">
            <span>值：</span>
            <div class="define">{{ detail.val }}</div>
          </div>
          <div class="item">
            <span>详细说明：</span>
            <div class="define">{{ detail.detail }}</div>
          </div>
          <div class="item">
            <span>生效条件：</span>
            <div class="define">{{ detail.cond }}</div>
          </div>
          <div class="item">
            <span>生效时机：</span>
            <div class="define">{{ detail.effectTime }}</div>
          </div>
          <div class="item">
            <span>例子：</span>
            <div class="define">{{ detail.demo }}</div>
          </div>
          <div class="item">
            <span>起始版本日期：</span>
            <div class="define">{{ detail.startTime }}</div>
          </div>
          <div class="item">
            <span>终止版本日期：</span>
            <div class="define">{{ detail.endTime }}</div>
          </div>
          <div class="item">
            <span>状态：</span>
            <div class="define">{{ detail.state }}</div>
          </div>
        </div>
      </div>
    </div>

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
import qs from "qs";
import navHeader from "../components/nav-header.vue";
import hList from "../components/h-list.vue";
export default {
  name: "Detail",
  components: {
    navHeader,
    hList,
  },
  data() {
    return {
      id: this.$route.query.id,
      detail: {},
      list: [],
      dialogVisible: false,
      // 数据总条条数
      listtotal: 0,
      // 限制显示多少条
      limit: 15,
      pageSize: 1,
    };
  },
  mounted() {
    this.getDetail()
    this.getList();
  },
  watch: {
    id() {
       this.getDetail();
    }
  },
  methods: {
    // 获取详情
    getDetail() {
      this.$axios
        .post(
          "/detail/getDetail",
          qs.stringify({
            id: this.id,
          })
        )
        .then((res) => {
          this.detail = res.detail[0];
        });
    },
    // 获取列表
    getList() {
       this.$axios.post("/detail/getList", qs.stringify({
         offset: (this.pageSize -1) * this.limit,
         limit: this.limit,
       })).then(res => {
         this.list = res.list;
         this.listtotal = res.count;
       })
    },
    // 更新
    update() {
      sessionStorage.setItem("updateDetail", JSON.stringify(this.detail));
      this.$router.push({
        path: "/create",
      });
    },
    // 删除
    del() {
      this.dialogVisible = false;
      this.$axios
        .post(
          "/detail/del",
          qs.stringify({
            id: this.id,
          })
        )
        .then((res) => {
          if (res == 0) {
            this.$message({
              message: "删除成功",
              type: "success",
            });
            // 刷新
            this.refresh();
          }
        });
    },
    // 更新页面
    updatePageSize(newPage) {
        this.pageSize = newPage;
        this.getList();
    },
    // h-list 点击事件
    listClick(id) {
       this.id = id;
    },
    refresh() {
       this.pageSize = 1;
       this.getList();
       this.$router.push({
         path: "/detail",
         query: {
           id: this.list[0].id
         }
       })
    },
  },
};
</script>
<style scoped>
.main {
  padding: 20px;
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
}

.main .content {
  flex: 1;
  margin-left: 30px;
}
.main .content .title {
  display: flex;
  justify-content: space-between;
  padding-bottom: 12px;
  border-bottom: 1px solid rgb(214, 214, 214);
}
.main .content .title .prompt {
  font-size: 16px;
  line-height: 20px;
  padding-top: 12px;
}
.main .content .detail {
  padding-left: 20px;
}
.main .content .detail .item {
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
  font-size: 14px;
}
.main .content .detail .item span {
  display: block;
  width: 120px;
  height: 24px;
  line-height: 24px;
  text-align: right;
}
.main .content .detail .item .define {
  flex: 1;
  line-height: 24px;
  /* width: 600px; */
  text-align: justify;
}
</style>
