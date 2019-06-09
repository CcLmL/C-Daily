using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// 获取IP数据信息的类
/// </summary>
public class IPControl
{
    //常量用来表示T-SQL语句中用到的变量名称和T-SQL语句本身
    private const string PARM_IP_ADDRESS = "@IPAddress";
    private const string PARM_IP_SRC = "@IPSrc";
    private const string PARM_IP_DATETIME = "@IPDateTime";
    private const string SQL_INSERT_IPSTAT = "INSERT INTO IPStat VALUES(@IPAddress,@IPSrc,@IPDateTime)";
    private const string SQL_SELECT_TOTAL = "SELECT COUNT(*) FROM IPStat ";
    private const string SQL_SELECT_TODAY = "SELECT COUNT(*) FROM IPStat WHERE DATEDIFF(d,getdate(),ip_datetime)=0";
    private const string SQL_SELECT_YESTERDAY = "SELECT COUNT(*) FROM IPStat WHERE DATEDIFF(d,getdate(),ip_datetime)=1";
    private const string SQL_SELECT_MONTH = "SELECT COUNT(*) FROM IPStat WHERE DATEDIFF(d,getdate(),ip_datetime)<30";

	public IPControl()
	{
	}
    /// <summary>
    /// 保存IP数据信息到数据库
    /// </summary>
    /// <param name="ipAddress">ip地址</param>
    /// <param name="ipSrc">ip来源</param>
    /// <param name="ipDatetime">ip访问时间</param>
    public void AddIP(string ipAddress,string ipSrc,DateTime ipDatetime)
    {
        //构建连接语句字符串
        StringBuilder strSQL = new StringBuilder();
        //创建表示QQ号的参数
        SqlParameter[] parms = new SqlParameter[] { new SqlParameter(PARM_IP_ADDRESS, SqlDbType.NVarChar, 20),
            new SqlParameter(PARM_IP_SRC, SqlDbType.NVarChar,80),
            new SqlParameter(PARM_IP_DATETIME, SqlDbType.DateTime)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值,并添加到执行语句中
        parms[0].Value = ipAddress;
        parms[1].Value = ipSrc;
        parms[2].Value = ipDatetime;
        foreach(SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //在执行字符串中加载插入语句
            strSQL.Append(SQL_INSERT_IPSTAT);
            conn.Open();

            //设定SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行SqlCommand命令
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            //如果执行成功，返回true，否则false。
        }
    }
    public string GetTotal()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
       object  count = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_TOTAL, null);
        //返回统计结果
        return count.ToString();
    }
    public string GetToday()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object count = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_TODAY, null);
        //返回统计结果
        return count.ToString();
    }
    public string GetYesterday()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object count = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_YESTERDAY, null);
        //返回统计结果
        return count.ToString();
    }
    public string GetMonth()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object count = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_MONTH, null);
        //返回统计结果
        return count.ToString();
    }
}
