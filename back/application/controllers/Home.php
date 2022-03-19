<?php
header('Content-Type: application/json;charset=utf-8');
header('Access-Control-Allow-Origin:*'); // *代表允许任何网址请求
header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE'); // 允许请求的类型
header('Access-Control-Allow-Credentials: true'); // 设置是否允许发送 cookies
header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin'); // 设置允许自定义请求头的字段

error_reporting(E_ALL & ~E_NOTICE);

class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        // 加载数据模型
        $this->load->model('dbmodels');
    }
    // 获取表格数据
    public function getTableData()
    {
        $res['project'] = $this->dbmodels->getAllData();
        echo json_encode($res);
    }
    // 搜索
    public function search()
    {
        // 获取请求参数
        $arr = $this->getP();
        if ($arr['count'] != 0) {
            $res['project'] = $this->dbmodels->select($arr['parameter']);
        } else {
            $res['project'] = $this->dbmodels->getAllData();
        }
        echo json_encode($res);
    }
    // 批量删除
    public function del()
    {
        $this->dbmodels->batchDelete($_POST);
        echo 0;
    }
    // 获取请求参数
    protected function getP()
    {

        $module = $_POST['module'];
        $type = $_POST['type'];
        $keyCode = $_POST['keyCode'];
        $fun = $_POST['des'];
        // 参数处理
        if ($module != "全部") {
            $arr['module'] = $module;
        }
        if ($type != "全部") {
            $arr['type'] = $type;
        }
        if ($keyCode) {
            $arr['keyCode'] = $keyCode;
        }
        if ($fun) {
            $arr['fun like'] = "%" . $fun . "%";
        }
        return array(
            "count" => count($arr),
            "parameter" => $arr,
        );
    }
}
