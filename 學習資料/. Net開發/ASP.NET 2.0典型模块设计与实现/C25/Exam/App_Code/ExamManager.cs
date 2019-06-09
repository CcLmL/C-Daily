using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
/// <summary>
/// 考题操作类
/// </summary>
public class ExamManager
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_OPTIONEXAM = "INSERT INTO optionexam VALUES " +
        "(@title,@option1,@option2,@option3,@result)";
    private const string PARM_EXAM_TITLE = "@title";
    private const string PARM_EXAM_OPTION1 = "@option1";
    private const string PARM_EXAM_OPTION2 = "@option2";
    private const string PARM_EXAM_OPTION3 = "@option3";
    private const string PARM_EXAM_RESULT = "@result";


	public ExamManager()
	{
	}
    /// <summary>
    /// 添加考题的方法
    /// </summary>
    /// <param name="title">考题内容</param>
    /// <param name="option1">选择1</param>
    /// <param name="option2">选择2</param>
    /// <param name="option3">选择3</param>
    /// <param name="result">答案</param>
    public bool AddExamination(string title,string option1,string option2,string option3,string result)
    {
        //使用StringBuild连接字符串比使用“+”效率高很多
        StringBuilder strSQL = new StringBuilder();
        //获取缓存参数，如果没有，此方法会自动创建缓存列表
        SqlParameter[] newsParms = GetParameters();
        //创建执行语句的SQL命令
        SqlCommand cmd = new SqlCommand();
        // 依次给参数赋值
        newsParms[0].Value = title;
        newsParms[1].Value = option1;
        newsParms[2].Value = option2;
        newsParms[3].Value = option3;
        newsParms[4].Value = result;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //加载执行语句
            strSQL.Append(SQL_INSERT_OPTIONEXAM);
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
    /// <summary>
    /// 创建或获取缓存参数的私有方法
    /// </summary>
    /// <returns>返回参数列表</returns>
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_NEWSINFO做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_OPTIONEXAM);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_EXAM_TITLE, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_EXAM_OPTION1, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_EXAM_OPTION2, SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_EXAM_OPTION3, SqlDbType.NVarChar, 50),
                    new SqlParameter(PARM_EXAM_RESULT, SqlDbType.NVarChar,50) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_OPTIONEXAM, parms);
        }
        //返回参数数组
        return parms;
    }

    ///// <summary>
    ///// 随机抽取5道考题
    ///// </summary>
    ///// <returns></returns>
    //public SqlDataReader GetExam()
    //{
    //    string sql="SELECT  * FROM  optionExam";
    //    //返回SqlDataReader类型的数据集
    //    SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sql, null)
    //    //返回实体信息
    //    return memberinfo;
    //}
    ////一要保证抽到的数字在
    //private Array[] getRandom()
    //{

    //}
    ///// <summary>
    ///// 获取数据中的考题总数量
    ///// </summary>
    ///// <returns>考题数量</returns>
    //private int getCount()
    //{
    //    //定义行数变量
    //    int count = 0;
    //    //定义执行语句
    //    string sql = "SELECT COUNT(*) FROM optionexam";
    //    //调用SqlHelper访问组件的方法返回第一行第一列的值
    //    count = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text,sql , null);
    //    //返回行数
    //    return count;
    //}
}
