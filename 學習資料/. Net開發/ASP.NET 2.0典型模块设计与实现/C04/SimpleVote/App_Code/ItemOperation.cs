using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
/// <summary>
/// 投票项目的操作类
/// </summary>
public class ItemOperation
{
    private const string PARM_ITEM_NAME = "@ItemName";
    private const string PARM_ITEM_ID = "@ItemID";
    private const string SQL_INSERT_VOTE = "INSERT INTO VoteItem  values(@ItemName,0)";
    private const string SQL_DELETE_VOTE = "DELETE FROM VoteItem WHERE ItemID=@ItemID";

    private const string SQL_UPDATE_VOTE = "UPDATE VoteItem  set itemcount=itemcount +1 WHERE ItemID=@ItemID";
    private const string SQL_SELECT_COUNT = "SELECT SUM(itemcount) FROM VoteItem";


	public ItemOperation()
	{	}
    /// <summary>
    /// 添加投票项目
    /// </summary>
    /// <param name="votename">投票项目的名称</param>
    public void AddVote(string votename)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_NAME, SqlDbType.NVarChar, 30);
        // 设置参数的值
        parm.Value = votename;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_INSERT_VOTE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 删除投票项目
    /// </summary>
    /// <param name="voteID">投票项目的ID</param>
    public void DelVote(int voteID)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = voteID;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);
        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_DELETE_VOTE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 更新项目被投次数
    /// </summary>
    /// <param name="voteID">投票项目的ID</param>
    public void UpdateVote(int voteID)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = voteID;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);
        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_UPDATE_VOTE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 获取总投票数量
    /// </summary>
    /// <returns>总投票数</returns>
    public int GetVoteCount()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_COUNT,null);
        return int.Parse(obj.ToString());
    }
}