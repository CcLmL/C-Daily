using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
/// <summary>
/// 工资管理中的方法
/// </summary>
public class Salary
{
   //SQL语句设置为常量，方便日后的维护
    private const string SQL_PARM_FORMULA = "@formula";
    private const string SQL_INSERT_SALARYSET = "INSERT INTO salaryset VALUES(@formula)";
    private const string SQL_UPDATE_SALARYSET = "UPDATE salaryset SET formula=@formula";
    private const string SQL_SELECTFORMULA_SALARYSET = "SELECT  formula FROM salaryset";

    private const string SQL_PARM_NAME = "@employeename";
    private const string SQL_INSERT_EMPLOYEE = "INSERT INTO salary (EmployeeName) VALUES(@employeename)";
    private const string SQL_UPDATE_SALARY = "UPDATE salary set endsalary= " ;
    public Salary()
	{
	}
    /// <summary>
    /// 设置工资的计算公式
    /// </summary>
    /// <param name="formula">计算公式</param>
    /// <returns>设置是否成功</returns>
    public bool  SetSalary(string formula)
    {
        //初始化参数数组
        SqlParameter parm = new SqlParameter(SQL_PARM_FORMULA, SqlDbType.NVarChar, 50);
        SqlCommand cmd = new SqlCommand();
        //进行中英文转换
        formula = WordToField(formula);
        //给参数赋值
        parm.Value = formula;

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
            //此时判断是添加公式设置还是更新公式
            //因为一个系统中只能有一个公式，所以判断是否已经公式
            //查看是更新还是添加
            if (GetFormula() == "")
                //返回的时间没有值，则使用添加语句
                cmd.CommandText = SQL_INSERT_SALARYSET;
            else
                //否则是更新语句
                cmd.CommandText = SQL_UPDATE_SALARYSET;

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
    /// 用户获取公式设置值
    /// </summary>
    /// <returns>公式的设置</returns>
    public string  GetFormula()
    {
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL_SELECTFORMULA_SALARYSET, conn);
            //设置Sqlcommand命令的属性
            cmd.CommandType = CommandType.Text;
            //执行添加的SqlCommand命令
            SqlDataReader dr = cmd.ExecuteReader();
            string formula="";
            //判断是否有数据，有则选择第一列的值
            while (dr.Read())
                formula = dr.GetString(0);
            //进行中英文转换
            formula = FieldToWord(formula);
            //返回上班的时间
            return formula;
        }
    }
    /// <summary>
    /// 将用户选择的工资项目转化为字段形式
    /// </summary>
    /// <param name="formula">公式</param>
    /// <returns>转换后的公式</returns>
    private string WordToField(string formula)
    {
        //如果工资项目中有岗位工资，则替换成字段
        if (formula.IndexOf("岗位工资") > 0)
            formula = formula.Replace("岗位工资", "gangwei");
        if (formula.IndexOf("饭补") > 0)
            formula = formula.Replace("饭补", "fanbu");
        if (formula.IndexOf("车补") > 0)
            formula = formula.Replace("车补", "chebu");
        if (formula.IndexOf("税率") > 0)
            formula = formula.Replace("税率", "tax");
        if (formula.IndexOf("奖励") > 0)
            formula = formula.Replace("奖励", "encourage");
        if (formula.IndexOf("惩罚") > 0)
            formula = formula.Replace("惩罚", "punish");
        //返回修改后的公式
        return formula;
        
    }
    /// <summary>
    /// 从数据库中选出的工资项目转化为中文形式
    /// </summary>
    /// <param name="formula">公式</param>
    /// <returns>转换后的公式</returns>
    private string FieldToWord(string formula)
    {
        //如果工资项目中有gangwei，则替换成中文
        if (formula.IndexOf("gangwei") > 0)
            formula = formula.Replace("gangwei", "岗位工资");
        if (formula.IndexOf("fanbu") > 0)
            formula = formula.Replace("fanbu", "饭补");
        if (formula.IndexOf("chebu") > 0)
            formula = formula.Replace("chebu", "车补");
        if (formula.IndexOf("tax") > 0)
            formula = formula.Replace("tax", "税率");
        if (formula.IndexOf("encourage") > 0)
            formula = formula.Replace("encourage", "奖励");
        if (formula.IndexOf("punish") > 0)
            formula = formula.Replace("punish", "惩罚");
        //返回修改后的公式
        return formula;
    }
    /// <summary>
    /// 获取所有的员工名并添加到工资表中
    /// </summary>
    public void InsertEmployee()
    {
        //初始化参数数组
        SqlParameter parm = new SqlParameter(SQL_PARM_NAME, SqlDbType.NVarChar, 20);
        SqlCommand cmd = new SqlCommand();

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_INSERT_EMPLOYEE;
            //循环添加员工名到工资表中
            MembershipUserCollection users = Membership.GetAllUsers();
            foreach (MembershipUser user in users)
            {
                //给参数赋值
                parm.Value = user.UserName;
                //将参数添加到SqlCommand命令中
                cmd.Parameters.Add(parm);
                //执行添加的SqlCommand命令
                cmd.ExecuteNonQuery();
                //清空SqlCommand命令中的参数
                cmd.Parameters.Clear();
            }
        }
    }
    /// <summary>
    /// 更新实发工资
    /// </summary>
    public void UpdateSalary()
    {
        SqlCommand cmd = new SqlCommand();
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = SQL_UPDATE_SALARY + GetFormula1();
            //执行添加的SqlCommand命令
            cmd.ExecuteNonQuery();
        }
    }
    /// <summary>
    /// 系统内部获取公式设置值
    /// </summary>
    /// <returns>公式的设置</returns>
    private string GetFormula1()
    {
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接，执行命令
            conn.Open();
            SqlCommand cmd = new SqlCommand(SQL_SELECTFORMULA_SALARYSET, conn);
            //设置Sqlcommand命令的属性
            cmd.CommandType = CommandType.Text;
            //执行添加的SqlCommand命令
            SqlDataReader dr = cmd.ExecuteReader();
            string formula = "";
            //判断是否有数据，有则选择第一列的值
            while (dr.Read())
                formula = dr.GetString(0);
            //返回上班的时间
            return formula;
        }
    }
}
