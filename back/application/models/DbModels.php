<?php
/*
 * @Date: 2022-03-19 09:28:44
 * @Author: 浩
 * @LastEditors: 浩
 * @FilePath: \undefinedc:\Users\Lenovo\Desktop\back\application\controllers\DbModels.php
 */
class DbModels extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        //加载数据模型
        $this->load->database();
    }

    // 获取所有数据
    public function getAllData()
    {
        return $this->db->get("project")->result();
    }

    // 获取特定条件数据
    public function select($arr)
    {
        $this->db->from("project")->where($arr);
        return $this->db->get()->result();
    }

    // 通过 id 查询数据
    public function selectById($id) {
        $this->db->from("project")->where(array("id"=>$id));
        return $this->db->get()->result();
    }

    // 批量删除
    public function batchDelete($arr)
    {
        foreach ($arr as $item) {
            $this->db->where("id", $item);
            $this->db->delete('project');
        }
    }

    // 删除
    public function delete($id)
    {
        $this->db->where("id", $id);
        $this->db->delete('project');
    }

    // 创建
    public function create($arr) {
        $this->db->insert('project', $arr);
    }

    // 更新数据
    public function update($arr, $id)
    {
        $this->db->where("id", $id);
        $this->db->update('project', $arr);
    }

    // 获取分页数据
    public function getoffsetList()
    {
        $limit = $_POST['limit'];
        $offset = $_POST['offset'];
        $res['count'] = $this->db->count_all_results('project');
        $this->db->limit($limit)->offset($offset);
        $res['list'] = $this->db->get('project')->result_array();
        return $res;
    }
}
