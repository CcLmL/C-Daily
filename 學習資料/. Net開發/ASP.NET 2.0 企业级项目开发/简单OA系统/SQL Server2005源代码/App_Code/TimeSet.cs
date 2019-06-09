using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// 设置工作时间
/// </summary>
public class TimeSet
{
    //SQL语句设置为常量，方便日后的维护
    private const string SQL_INSERT_TIMESET = "INSERT INTO timeset VALUES(@begintime,@endtime,'')";
    private const string SQL_UPDATE_TIMESET = "UPDATE timeset SET begintime=@begintime,endtime=@endtime";
    private const string SQL_SELECTBEGIN_TIMESET = "SELECT  BEGINTIME FROM timeset";
    private const string SQL_SELECTEND_TIMESET = "SELECT  ENDTIME FROM timeset";

    private const string SQL_PARM_ONTIME = "@ontime";
    private const string SQL_PARM_OFFTIME = "@offtime";
    private const string SQL_PARM_DATE = "@date";
    private const string SQL_PARM_NAME = "@name";
    private const string SQL_INSERT_TIMETABLE = "INSERT INTO timetable (employeename,onduty,dutydate) VALUES(@name,@ontime,@date)";
    private const string SQL_UPDATE_TIMETABLE = "UPDATE timetable SET  offduty=@offtime WHERE dutydate=@date AND employeename=@name";
	public TimeSet()
	{
	}
    /// <summary>
    /// 设置工作时间的方法
    /// </summary>
    /// <param name="begintime">上班时间</param>
    /// <param name="endtime">下班时间</param>
    /// <returns>设置是否成功</returns>
    public bool  SetTime(string begintime,string endtime)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@begintime", SqlDbType.NVarChar,5),
                    new SqlParameter("@endtime", SqlDbType.NVarChar, 5)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = begintime;
        parms[1].Value = endtime;

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
            cmd.CommandType = CommandType.Text;
            //此时判断是添加时间设置还是更新时间设置
            //因为一个系统中只能有一个时间设置，所以通过判断是否已经存在时间值
            //查看是更新还是添加
            if (GetOnDutyTime() == "")
                //返回的时间没有值，则使用添加语句
                cmd.CommandText = SQL_INSERT_TIMESET;
            else
                //否则是更新语句
                cmd.CommandText = SQL_UPDATE_TIMESET;

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
    /// 获取上班时间值
    /// </summary>
    /// <returns>上班的时间</returns>
    public string  GetOnDutyTime()
    {

        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL_SELECTBEGIN_TIMESET, conn);
            //设置Sqlcommand命令的属性
            cmd.CommandType = CommandType.Text;
            //执行添加的SqlCommand命令
            //string worktime = cmd.ExecuteScalar().ToString();
            SqlDataReader dr = cmd.ExecuteReader();
            string worktime="";
            //判断是否有数据，有则选择第一列的值
            while (dr.Read())
                worktime = dr.GetString(0);
            //返回上班的时间
           return worktime;
        }
    }
    /// <summary>
    /// 获取下班时间值
    /// </summary>
    /// <returns>返回下班的时间</returns>
    public string GetOffDutyTime()
    {
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_SELECTEND_TIMESET;
            //执行添加的SqlCommand命令
            //string tempstr = cmd.ExecuteScalar().ToString();
            SqlDataReader dr = cmd.ExecuteReader();
            string worktime = "";
            while (dr.Read())
                //选取第一列的内容
                worktime = dr.GetString(0);
            //返回下班的时间
            return worktime;
        }
    }
    /// <summary>
    /// 添加上班时间
    /// </summary>
    /// <param name="name">员工姓名</param>
    /// <param name="ondutytime">上班时间</param>
    /// <param name="dutydate">日期</param>
    public void InsertOnDuty(string name ,string ondutytime)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter(SQL_PARM_NAME, SqlDbType.NVarChar,20),
                    new SqlParameter(SQL_PARM_ONTIME, SqlDbType.NVarChar,5),
                    new SqlParameter(SQL_PARM_DATE, SqlDbType.DateTime)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = name;
        parms[1].Value = ondutytime;
        parms[2].Value = DateTime.Now.Date;

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
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_INSERT_TIMETABLE;
            //执行添加的SqlCommand命令
             cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 更新下班时间
    /// </summary>
    /// <param name="name">员工姓名</param>
    /// <param name="offdutytime">下班时间</param>
    public void UpdateOffDuty(string name,string offdutytime)
    {
        //初始化参数数组
        SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter(SQL_PARM_NAME, SqlDbType.NVarChar,20),
                    new SqlParameter(SQL_PARM_OFFTIME, SqlDbType.NVarChar,5),
                    new SqlParameter(SQL_PARM_DATE, SqlDbType.DateTime)};
        SqlCommand cmd = new SqlCommand();

        // 依次给参数赋值
        parms[0].Value = name;
        parms[1].Value = offdutytime;
        parms[2].Value = DateTime.Now.Date;

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
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_UPDATE_TIMETABLE;
            //执行添加的SqlCommand命令
            cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
        }
    }
}
