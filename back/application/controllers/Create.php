<?php
header('Content-Type: application/json;charset=utf-8');
header('Access-Control-Allow-Origin:*'); // *代表允许任何网址请求
header('Access-Control-Allow-Methods:POST,GET,OPTIONS,DELETE'); // 允许请求的类型
header('Access-Control-Allow-Credentials: true'); // 设置是否允许发送 cookies
header('Access-Control-Allow-Headers: Content-Type,Content-Length,Accept-Encoding,X-Requested-with, Origin'); // 设置允许自定义请求头的字段
class Create extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        // 加载数据模型
        $this->load->model('dbmodels');
    }
    // 插入数据
    public function set()
    {
        $arr = array(
            'module' => trim($_POST["module"]),
            "type" => trim($_POST["type"]),
            "fun" => trim($_POST["fun"]),
            "keyCode" => trim($_POST["keyCode"]),
            "val" => trim($_POST["val"]),
            "detail" => trim($_POST["detail"]),
            "cond" => trim($_POST["cond"]),
            "effectTime" => trim($_POST["effectTime"]),
            "demo" => trim($_POST["demo"]),
            "startTime" => trim($_POST["startTime"]),
            "endTime" => trim($_POST["endTime"]),
            "state" => trim($_POST["state"]),
        );
        $this->dbmodels->create($arr);
        echo 0;
    }

}
