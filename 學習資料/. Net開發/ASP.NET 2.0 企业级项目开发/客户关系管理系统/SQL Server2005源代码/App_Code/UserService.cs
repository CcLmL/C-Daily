using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/// <summary>
/// 客户服务管理模块的一些方法
/// </summary>
public class UserService
{
	public UserService()
	{
	}
    /// <summary>
    /// 添加投诉记录
    /// </summary>
    /// <param name="username">客户名称</param>
    /// <param name="name">被投诉人姓名</param>
    /// <param name="notioncontent">投诉内容</param>
    /// <returns>返回是否添加成功</returns>
    public bool InsertNotion(string username,string name,string content)
    {
        //初始化参数数组,此处的参数名字要与存储过程中的参数名相同
        SqlParameter[] parms= new SqlParameter[] {
                    new SqlParameter("@employeename", SqlDbType.NVarChar,20),
                    new SqlParameter("@username", SqlDbType.NVarChar, 20),
                    new SqlParameter("@notioncontent", SqlDbType.NVarChar, 100),
                    new SqlParameter("@handlecontent", SqlDbType.NVarChar, 100),
                    new SqlParameter("@notiondate", SqlDbType.DateTime),
                    new SqlParameter("@handledate", SqlDbType.DateTime) };
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值，有关处理内容的参数为空
        parms[0].Value =name;
        parms[1].Value = username;
        parms[2].Value = content;
        parms[3].Value = "";
        parms[4].Value = DateTime.Now.Date;
        parms[5].Value = DBNull.Value;

        //将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            //注意此处命令类型选择的是“存储过程”
            cmd.CommandType = CommandType.StoredProcedure;
            //如果类型选择的是存储过程，那么下面属性设置的是存储过程的名字
            cmd.CommandText = "SP_INSERTNOTION";
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
    /// 登记需求
    /// </summary>
    /// <param name="username">客户名称</param>
    /// <param name="name">负责人姓名</param>
    /// <param name="content">需求内容</param>
    /// <returns>返回是否添加成功</returns>
    public bool InsertRequire(string username, string name, string content)
    {
        //初始化参数数组,此处的参数名字要与存储过程中的参数名相同
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@employeename", SqlDbType.NVarChar,20),
                    new SqlParameter("@username", SqlDbType.NVarChar, 20),
                    new SqlParameter("@requirecontent", SqlDbType.NVarChar, 100),
                    new SqlParameter("@handlecontent", SqlDbType.NVarChar, 100),
                    new SqlParameter("@requiredate", SqlDbType.DateTime),
                    new SqlParameter("@handledate", SqlDbType.DateTime) };
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值，有关处理内容的参数为空
        parms[0].Value = name;
        parms[1].Value = username;
        parms[2].Value = content;
        parms[3].Value = "";
        parms[4].Value = DateTime.Now.Date;
        parms[5].Value = DBNull.Value;

        //将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            //注意此处命令类型选择的是“存储过程”
            cmd.CommandType = CommandType.StoredProcedure;
            //如果类型选择的是存储过程，那么下面属性设置的是存储过程的名字
            cmd.CommandText = "SP_INSERTREQUIRE";
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
    /// 合同存档
    /// </summary>
    /// <param name="username">客户名称</param>
    /// <param name="name">签订姓名</param>
    /// <param name="note">合同备注</param>
    /// <param name="begindate">合同开始日期</param>
    /// <param name="enddate">结束日期</param>
    /// <returns>返回是否添加成功</returns>
    public bool InsertBargain(string username, string name, string note,DateTime begindate,DateTime enddate)
    {
        //初始化参数数组,此处的参数名字要与存储过程中的参数名相同
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@employeename", SqlDbType.NVarChar,20),
                    new SqlParameter("@username", SqlDbType.NVarChar, 20),
                    new SqlParameter("@note", SqlDbType.NVarChar, 100),
                    new SqlParameter("@begindate", SqlDbType.DateTime),
                    new SqlParameter("@enddate", SqlDbType.DateTime) };
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值，有关处理内容的参数为空
        parms[0].Value = name;
        parms[1].Value = username;
        parms[2].Value = note;
        parms[3].Value = begindate;
        parms[4].Value = enddate;

        //将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            //注意此处命令类型选择的是“存储过程”
            cmd.CommandType = CommandType.StoredProcedure;
            //如果类型选择的是存储过程，那么下面属性设置的是存储过程的名字
            cmd.CommandText = "SP_INSERTBARGAIN";
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
    /// 实施总结
    /// </summary>
    /// <param name="username">客户名称</param>
    /// <param name="name">实施人名</param>
    /// <param name="version">实施备注</param>
    /// <param name="begindate">实施开始日期</param>
    /// <param name="enddate">结束日期</param>
    /// <param name="sumup">实施总结</param>
    /// <param name="note">实施备注</param>
    /// <returns>返回是否添加成功</returns>
    public bool InsertSumUp(string username, string name,string version , DateTime begindate, DateTime enddate,string sumup,string note)
    {
        //初始化参数数组,此处的参数名字要与存储过程中的参数名相同
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@employeename", SqlDbType.NVarChar,20),
                    new SqlParameter("@username", SqlDbType.NVarChar, 20),
                    new SqlParameter("@version", SqlDbType.NVarChar, 100),
                    new SqlParameter("@begindate", SqlDbType.DateTime),
                    new SqlParameter("@enddate", SqlDbType.DateTime) ,
                    new SqlParameter("@sumup", SqlDbType.NVarChar, 100),
                    new SqlParameter("@note", SqlDbType.NVarChar, 100), };
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值，有关处理内容的参数为空
        parms[0].Value = name;
        parms[1].Value = username;
        parms[2].Value = version;
        parms[3].Value = begindate;
        parms[4].Value = enddate;
        parms[5].Value = sumup;
        parms[6].Value = note;

        //将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            //注意此处命令类型选择的是“存储过程”
            cmd.CommandType = CommandType.StoredProcedure;
            //如果类型选择的是存储过程，那么下面属性设置的是存储过程的名字
            cmd.CommandText = "SP_INSERTSUMUP";
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
    /// 根据实施人姓名获取其所有实施记录
    /// </summary>
    /// <param name="employeename">实施人员</param>
    /// <returns>返回SqlDataReader数据集</returns>
    public SqlDataReader GetSumUpData(string employeename)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter("employeename", SqlDbType.NVarChar, 20);
        parm.Value = employeename;

        //调用SqlHelper访问组件的方法返回数据集合
       SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.StoredProcedure, "SP_GETSUMUP", parm);
        return dr;
    }
}
