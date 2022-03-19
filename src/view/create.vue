<template>
  <div class="create">
    <nav-header :i="state == 0 ? 2 : -3" @updateState="state = 0"></nav-header>
    <div class="info">
      <div class="title">配置详情</div>
      <el-form ref="ruleForm" :model="form" label-width="140px" :rules="rules">
        <el-form-item label="模块：" prop="module">
          <el-input v-model.trim="form.module"></el-input>
        </el-form-item>

        <el-form-item label="类型：">
          <el-select v-model.trim="form.type">
            <el-option label="功能" value="功能"></el-option>
            <el-option label="调试" value="调试"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="功能说明：">
          <el-input v-model.trim="form.fun"></el-input>
        </el-form-item>

        <el-form-item label="关键字：" prop="keyCode">
          <el-input v-model.trim="form.keyCode"></el-input>
        </el-form-item>

        <el-form-item label="值：">
          <el-input type="textarea" v-model.trim="form.val" autosize></el-input>
        </el-form-item>

        <el-form-item label="详细说明：">
          <el-input
            type="textarea"
            v-model.trim="form.detail"
            autosize
          ></el-input>
        </el-form-item>

        <el-form-item label="生效条件：">
          <el-input type="textarea" v-model.trim="form.cond" autosize></el-input>
        </el-form-item>

        <el-form-item label="生效时机：">
          <el-input v-model.trim="form.effectTime"></el-input>
        </el-form-item>

        <el-form-item label="例子：">
          <el-input type="textarea" v-model.trim="form.demo" autosize></el-input>
        </el-form-item>

        <el-form-item label="起始版本日期：">
          <el-date-picker
            type="date"
            v-model="form.startTime"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>

        <el-form-item label="终止版本日期：">
          <el-date-picker
            type="date"
            v-model="form.endTime"
            style="width: 100%"
          ></el-date-picker>
        </el-form-item>

        <el-form-item label="状态：">
          <el-select v-model="form.state">
            <el-option label="有效" value="有效"></el-option>
            <el-option label="失效" value="失效"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="onSubmit()">保存</el-button>
          <el-button @click="reset()">取消</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>
import navHeader from "../components/nav-header.vue";
import qs from "qs";
export default {
  name: "Create",
  components: {
    navHeader,
  },
  data() {
    return {
      form: {
        id: "",
        module: "",
        type: "功能",
        fun: "",
        keyCode: "",
        val: "",
        detail: "",
        cond: "",
        effectTime: "",
        demo: "",
        startTime: "",
        endTime: "",
        state: "有效",
      },
      rules: {
        module: [{ required: true, message: "该数据项必填" }],
        keyCode: [{ required: true, message: "该数据项必填" }],
      },
      state: -1, // 0 为创建， 1 为更新
    };
  },
  watch: {
    state() {
      if (this.state == 0) {
        this.form = {
          id: "",
          module: "",
          type: "功能",
          fun: "",
          keyCode: "",
          val: "",
          detail: "",
          cond: "",
          effectTime: "",
          demo: "",
          startTime: "",
          endTime: "",
          state: "有效",
        };
        this.$nextTick(() => {
          this.$refs['ruleForm'].clearValidate();
        })
      }
    },
  },
  beforeRouteEnter(to, from, next) {
    let form = JSON.parse(sessionStorage.getItem("updateDetail"));
    if (from.path == "/detail" && form) {
      sessionStorage.setItem("state", "1");
    } else {
      sessionStorage.setItem("state", "0");
    }
    next();
  },
  created() {
    this.state = sessionStorage.getItem("state");
    sessionStorage.removeItem("state");
    if (this.state == 1) {
      this.form = JSON.parse(sessionStorage.getItem("updateDetail"));
      sessionStorage.removeItem("updateDetail");
    }
  },
  methods: {
    onSubmit() {
      this.$refs["ruleForm"].validate((valid) => {
        console.log(valid);
        if (valid) {
          if (this.state == 0) {
            this.createData();
          } else if (this.state == 1) {
            this.updateData();
          }
        } else {
          return false;
        }
      });
    },
    updateData() {
      this.$axios.post("/detail/upd", qs.stringify(this.form)).then((res) => {
        if (res == 0) {
          this.$router.push({
            path: "/detail",
            query: {
              id: this.form.id,
            },
          });
        } else {
          this.$message.error("更新失败");
        }
      });
    },
    createData() {
      this.$axios.post("/create/set", qs.stringify(this.form)).then((res) => {
        if (res == 0) {
          this.$router.push({
            path: "/index",
          });
        } else {
          this.$message.error("创建失败");
        }
      });
    },
    reset() {
      this.$refs["ruleForm"].resetFields();
    },
  },
};
</script>
<style scoped>
.create .info {
  width: 930px;
  height: 600px;
  margin: auto;
}
.create .info .title {
  display: block;
  padding: 12px;
  border-bottom: 1px solid #333;
  margin-bottom: 12px;
}
.el-select {
  width: 100px;
}
.el-button:first-child {
  margin-left: 630px;
}
</style>
