using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 投票主题的管理
/// </summary>
public class TitleControl
{
    private const string PARM_TITLE_NAME = "@TitleName";
    private const string SQL_INSERT_TITLE = "INSERT INTO VoteTitle  values(@TitleName,'false')";

	public TitleControl()
	{
	}
    public void AddTitle(string titlename)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_TITLE_NAME, SqlDbType.NVarChar, 30);
        // 设置参数的值
        parm.Value = titlename;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_INSERT_TITLE);
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
    private const string PARM_TITLE_ID = "@TitleID";
    private const string SQL_UPDATE_TITLE = "UPDATE VoteTitle  SET IsCurrent ='false'";
    private const string SQL_SET_TITLE = "UPDATE VoteTitle  SET IsCurrent ='true' WHERE TitleID=@TitleID";
    /// <summary>
    /// 设置当前显示的投票主题
    /// </summary>
    /// <param name="titleid"></param>
    public void SetCurrentTitle(int titleid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_TITLE_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = titleid;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {

            // 添加SQL语句
            strSQL.Append(SQL_SET_TITLE);
            conn.Open();
            //在执行更改设置之前，需要保证数据库中已经不存在当前主题
            cmd1.Connection = conn;
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = SQL_UPDATE_TITLE;
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
}
