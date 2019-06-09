using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// 设置部门和发布公告的方法
/// </summary>
public class ManagerSet
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_INSERT_DEPART = "INSERT INTO department VALUES(@departname)";
    private const string SQL_DELETE_DEPART = "DELETE department WHERE departname=@departname";
    private const string SQL_PARM_DEPARTNAME = "@departname";

    private const string SQL_PARM_CONTENT = "@content";
    private const string SQL_INSERT_AFFICHE = "INSERT INTO affiche VALUES(@content,GETDATE())";

    public ManagerSet()
    {
    }
    /// <summary>
    /// 添加部门的方法
    /// </summary>
    /// <param name="departname">部门名称</param>
    /// <returns>返回添加是否成功</returns>
    public bool InsertDepart(string departname)
    {
        //初始化参数
        SqlParameter parm = new SqlParameter(SQL_PARM_DEPARTNAME, SqlDbType.NVarChar,20);
        SqlCommand cmd = new SqlCommand();
        // 给参数赋值
        parm.Value = departname;
        //将参数添加到SqlCommand命令中
        cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_INSERT_DEPART;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    /// <summary>
    /// 删除部门的方法
    /// </summary>
    /// <param name="departname">部门名称</param>
    /// <returns>返回删除是否成功</returns>
    public bool DelDepart(string departname)
    {
        //初始化参数
        SqlParameter parm = new SqlParameter(SQL_PARM_DEPARTNAME, SqlDbType.NVarChar, 20);
        SqlCommand cmd = new SqlCommand();
        // 给参数赋值
        parm.Value = departname;
        //将参数添加到SqlCommand命令中
        cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_DELETE_DEPART;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    /// <summary>
    /// 为公告保留历史记录
    /// </summary>
    /// <param name="content">公告的内容</param>
    /// <returns>返回发布是否成功</returns>
    public bool InsertAffiche(string content)
    {
        //初始化参数-本语句可以设置两个参数。
        //由于SQL提供函数获取当日日期，所以此处不设置日期参数
        SqlParameter parm = new SqlParameter(SQL_PARM_CONTENT, SqlDbType.NVarChar, 100);
        SqlCommand cmd = new SqlCommand();
        // 给参数赋值
        parm.Value = content;
        //将参数添加到SqlCommand命令中
        cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_INSERT_AFFICHE;
            //执行添加的SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
}
