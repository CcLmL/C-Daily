using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
/// <summary>
/// 针对客服人员的操作类
/// </summary>
public class ServiceOperation
{
    //常量用来表示T-SQL语句中用到的变量名称和T-SQL语句本身
    private const string PARM_QQ_NUMBER = "@listQQ";
    private const string SQL_INSERT_SERVICE = "INSERT INTO QQList VALUES(@listQQ)";
    private const string SQL_DELETE_SERVICE = "DELETE QQList WHERE  listQQ=@listQQ";
	public ServiceOperation()
	{
	}
    public bool InsertService(string qqnumber)
    {
        //构建连接语句字符串
        StringBuilder strSQL = new StringBuilder();
        //创建表示QQ号的参数
        SqlParameter parm = new SqlParameter(PARM_QQ_NUMBER, SqlDbType.NVarChar, 20);
        SqlCommand cmd = new SqlCommand();

        // 给参数赋值
        parm.Value = qqnumber;
        cmd.Parameters.Add(parm);

        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //在执行字符串中加载插入语句
            strSQL.Append(SQL_INSERT_SERVICE);
            conn.Open();

            //设定SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            //如果执行成功，返回true，否则false。
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    public bool DeleteService(string qqnumber)
    {
        //构建连接语句字符串
        StringBuilder strSQL = new StringBuilder();
        //创建表示QQ号的参数
        SqlParameter parm = new SqlParameter(PARM_QQ_NUMBER, SqlDbType.NVarChar, 20);
        SqlCommand cmd = new SqlCommand();

        // 给参数赋值
        parm.Value = qqnumber;
        cmd.Parameters.Add(parm);
        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //在执行字符串中加载插入语句
            strSQL.Append(SQL_DELETE_SERVICE);
            conn.Open();

            //设定SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行SqlCommand命令
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            //如果执行成功，返回true，否则false。
            if (val > 0)
                return true;
            else
                return false;
        }
    }
}
