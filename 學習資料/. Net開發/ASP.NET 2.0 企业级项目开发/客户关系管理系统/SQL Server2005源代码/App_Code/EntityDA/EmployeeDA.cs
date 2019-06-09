using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// 员工实体方法
/// </summary>
public class EmployeeDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_EMPLOYEE = "INSERT INTO employeeinfo VALUES(@departid,@name,@phone, @mail,@birthday,@sex,@note)";
    private const string PARM_EMPLOYEE_NAME = "@name";
    private const string PARM_EMPLOYEE_PHONE = "@phone";
    private const string PARM_EMPLOYEE_MAIL = "@mail";
    private const string PARM_EMPLOYEE_BIRTHDAY = "@birthday";
    private const string PARM_EMPLOYEE_SEX = "@sex";
    private const string PARM_EMPLOYEE_NOTE = "@note";
    private const string PARM_DEPART_NAME = "@depart";
    private const string PARM_DEPART_ID = "@departid";
    private const string SQL_SELECT_DEPARTNAME = "SELECT departid FROM department WHERE departname=@depart";

	public EmployeeDA()
	{
	}
    /// <summary>
    /// 添加员工资料
    /// </summary>
    /// <param name="user">员工资料实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertEmployee(EmployeeEntity employee)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] employeeParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        employeeParms[1].Value = employee.Name;
        employeeParms[2].Value = employee.Phone;
        employeeParms[3].Value = employee.Mail;
        employeeParms[4].Value = employee.Birthday;
        employeeParms[5].Value = employee.Sex;
        employeeParms[6].Value = employee.Note;
        //获取部门的ID
        int departid = GetDepartID(employee.Depart);
        employeeParms[0].Value = departid;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in employeeParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_EMPLOYEE);
            //打开数据库连接，执行命令
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
    #region 私有方法
    /// <summary>
    /// 获取部门ID的方法
    /// </summary>
    /// <param name="cityname">部门名称</param>
    /// <returns>该部门的ID</returns>
    private int GetDepartID(string departname)
    {
        int departid = 0;

        //创建新参数并给参数赋值，用来指定单位名称
        SqlParameter parm = new SqlParameter(PARM_DEPART_NAME, SqlDbType.NVarChar, 20);
        parm.Value = departname;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        departid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_DEPARTNAME, parm);
        return departid;
    }
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_EMPLOYEE做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_EMPLOYEE);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_DEPART_ID, SqlDbType.Int),
                    new SqlParameter(PARM_EMPLOYEE_NAME, SqlDbType.NVarChar,20),
                    new SqlParameter(PARM_EMPLOYEE_PHONE, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_EMPLOYEE_MAIL, SqlDbType.NVarChar, 20),
                    new SqlParameter(PARM_EMPLOYEE_BIRTHDAY, SqlDbType.DateTime),
                    new SqlParameter(PARM_EMPLOYEE_SEX, SqlDbType.NVarChar,2),
                    new SqlParameter(PARM_EMPLOYEE_NOTE, SqlDbType.NVarChar,50) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_EMPLOYEE, parms);
        }
        //返回参数数组
        return parms;
    }
    #endregion
}
