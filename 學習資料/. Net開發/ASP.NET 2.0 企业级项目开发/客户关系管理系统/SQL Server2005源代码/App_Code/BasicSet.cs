using System;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
/// <summary>
/// 基础配置类
/// </summary>
public class BasicSet
{
    //将参数名和T-SQL语句设置成常量，方便以后维护。
    private const string PARM_AREA_NAME = "@areaname";
    private const string SQL_INSERT_AREA = "INSERT INTO area VALUES(@areaname)";

    private const string PARM_AREA_ID = "@areaid";
    private const string PARM_CITY_NAME = "@cityname";
    private const string SQL_INSERT_CITY = "INSERT INTO city VALUES(@areaid,@cityname)";
    private const string SQL_SELECT_AREAID = "SELECT areaid FROM area WHERE areaname=@areaname";

    private const string PARM_STATE_NAME = "@statename";
    private const string SQL_INSERT_STATE = "INSERT INTO userstate VALUES(@statename)";

    private const string PARM_GRADE_NAME = "@gradename";
    private const string SQL_INSERT_GRADE = "INSERT INTO usergrade VALUES(@gradename)";

    private const string PARM_TYPE_NAME = "@typename";
    private const string SQL_INSERT_TYPE = "INSERT INTO usertype VALUES(@typename)";
    private const string PARM_DEPART_NAME = "@departname";
    private const string SQL_INSERT_DEPART = "INSERT INTO department VALUES(@departname)";



	public BasicSet()
	{
	}
    /// <summary>
    /// 添加区域方法
    /// </summary>
    /// <param name="areaname">区域名称</param>
    /// <returns>是否成功</returns>
    public bool AddArea(string areaname)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_AREA_NAME, SqlDbType.NVarChar, 20);
        parm.Value = areaname;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_AREA);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
    /// 为区域添加城市的方法
    /// </summary>
    /// <param name="areaname">区域名称</param>
    /// <param name="cityname">城市名称</param>
    /// <returns>是否添加成功</returns>
    public bool AddCity(string areaname,string cityname)
    { 

        //因为城市表中存放的是区域的ID，所以要先获取区域ID。
        int areaid = GetAreaID(areaname);
        //初始化输入参数并赋值
        SqlParameter [] parm = new SqlParameter[]{new SqlParameter(PARM_AREA_ID, SqlDbType.Int),new SqlParameter(PARM_CITY_NAME, SqlDbType.NVarChar,20)};
        parm[0].Value = areaid;
        parm[1].Value = cityname;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm1 in parm)
            cmd.Parameters.Add(parm1);

        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_CITY);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
    /// 根据区域名称获取ID的内部方法
    /// </summary>
    /// <param name="areaname">区域名称</param>
    /// <returns>返回区域ID</returns>
    private int GetAreaID(string areaname)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_AREA_NAME, SqlDbType.NVarChar, 20);
        parm.Value = areaname;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        string tmpstr = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_AREAID, parm).ToString();
        //将返回值进行类型转换
        int areaid = int.Parse(tmpstr);
        //返回区域ID。
        return areaid;
    }
    /// <summary>
    /// 添加客户等级方法
    /// </summary>
    /// <param name="areaname">等级名称</param>
    /// <returns>是否成功</returns>
    public bool AddGrade(string gradename)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_GRADE_NAME, SqlDbType.NVarChar, 20);
        parm.Value = gradename;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_GRADE);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
    /// 添加客户状态方法
    /// </summary>
    /// <param name="areaname">状态名称</param>
    /// <returns>是否成功</returns>
    public bool AddState(string statename)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_STATE_NAME, SqlDbType.NVarChar, 20);
        parm.Value = statename;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_STATE);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
    /// 添加客户类型方法
    /// </summary>
    /// <param name="areaname">类型名称</param>
    /// <returns>是否成功</returns>
    public bool AddType(string typename)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_TYPE_NAME, SqlDbType.NVarChar, 20);
        parm.Value = typename;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_TYPE);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
    /// 添加部门方法
    /// </summary>
    /// <param name="areaname">类型名称</param>
    /// <returns>是否成功</returns>
    public bool AddDepart(string departname)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_DEPART_NAME, SqlDbType.NVarChar, 20);
        parm.Value = departname;
        //将参数添加到SQL命令中
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.Add(parm);
        //初始化字符串连接
        StringBuilder strSQL = new StringBuilder();
        //初始化数据库连接
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //添加连接语句
            strSQL.Append(SQL_INSERT_DEPART);
            //打开数据库连接
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
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
