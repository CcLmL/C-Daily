using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// 新闻处理的操作类
/// </summary>
public class NewsManager
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_NEWSINFO = "INSERT INTO newsinfo VALUES(@title,@data,@date, @imageurl,@category)";
    private const string PARM_NEWS_TITLE = "@title";
    private const string PARM_NEWS_DATA = "@data";
    private const string PARM_NEWS_DATE = "@date";
    private const string PARM_NEWS_CATEGORY = "@category";
    private const string PARM_NEWS_IMAGEURL = "@imageurl";

	public NewsManager()
	{	}
    /// <summary>
    /// 添加新闻
    /// </summary>
    /// <param name="newsTitle">新闻主题</param>
    /// <param name="newsData">新闻内容</param>
    /// <param name="newsCategory">新闻类别</param>
    /// <param name="imageUrl">新闻的图片连接地址</param>
    /// <returns>添加是否成功</returns>
    public bool AddNews(string newsTitle, string newsData, string newsCategory, string imageUrl)
    {
        //使用StringBuild连接字符串比使用“+”效率高很多
        StringBuilder strSQL = new StringBuilder();
        //获取缓存参数，如果没有，此方法会自动创建缓存列表
        SqlParameter[] newsParms = GetParameters();
        //创建执行语句的SQL命令
        SqlCommand cmd = new SqlCommand();
        // 依次给参数赋值
        newsParms[0].Value = newsTitle;
        newsParms[1].Value = newsData;
        //注意新闻发布的日期取当日
        newsParms[2].Value = DateTime.Now;
        newsParms[3].Value = imageUrl;
        newsParms[4].Value = newsCategory;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_NEWSINFO);
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
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_NEWSINFO);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_NEWS_TITLE, SqlDbType.NVarChar,20),
                    new SqlParameter(PARM_NEWS_DATA, SqlDbType.NVarChar,500),
                    new SqlParameter(PARM_NEWS_DATE, SqlDbType.DateTime),
                    new SqlParameter(PARM_NEWS_IMAGEURL, SqlDbType.NVarChar, 50),
                    new SqlParameter(PARM_NEWS_CATEGORY, SqlDbType.NVarChar,20) };

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_NEWSINFO, parms);
        }
        //返回参数数组
        return parms;
    }
}
