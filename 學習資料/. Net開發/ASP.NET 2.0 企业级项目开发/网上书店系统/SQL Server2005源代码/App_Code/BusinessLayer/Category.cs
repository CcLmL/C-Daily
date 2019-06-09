using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Collections;
using System.Collections.Generic;
/// <summary>
///目录的相关操作
/// </summary>
public class Category
{
    //定义静态变量
    private const string PARM_CATEGORY_NAME = "@CategoryName";
    private const string PARM_CATEGORY_DESN = "@CategoryDescription";
    private const string SQL_INSERT_CATEGORIES = "INSERT INTO category (CategoryName,CategoryDescription) VALUES( @CategoryName,@CategoryDescription)";

    private const string SQL_SELECT_CATEGORIES = "SELECT CategoryID, CategoryName, CategoryDescription FROM Category";
    private const string SQL_SELECT_CATEGORY = "SELECT CategoryID, CategoryName, CategoryDescription FROM Category WHERE CategoryID = @CategoryID";
    private const string PARM_CATEGORY_ID = "@CategoryID";

    private const string SQL_DELETE_CATEGORIE = "DELETE  FROM Category WHERE CategoryID = @CategoryID";
    private const string SQL_SELECT_BOOK = "SELECT  productname FROM Product WHERE CategoryID = @CategoryID";

	public Category()
	{
	}
    public void AddCategory(CategoryInfo cate)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter[] CategoryParms = GetCategoryParameters();
        // 设置参数的值
        CategoryParms[0].Value = cate.Name;
        CategoryParms[1].Value = cate.Description;
        //将参数添加到SQL命令中
        foreach (SqlParameter parm in CategoryParms)
            cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {

            // 添加SQL语句
            strSQL.Append(SQL_INSERT_CATEGORIES);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 返回或设置缓存的参数列表
    /// </summary>
    /// <returns>参数列表</returns>
    private static SqlParameter[] GetCategoryParameters()
    {
        //获取缓存的参数
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_CATEGORIES);
        //如果没有缓存，则创建一个新的参数列表
        if (parms == null)
        {
            parms = new SqlParameter[] {
					new SqlParameter(PARM_CATEGORY_NAME, SqlDbType.VarChar, 50),
					new SqlParameter(PARM_CATEGORY_DESN, SqlDbType.VarChar, 300)};

            //将参数列表缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_CATEGORIES, parms);
        }
        return parms;
    }
    /// <summary>
    /// 获取所有的目录
    /// </summary>	    	 
    public IList<CategoryInfo> GetCategories()
    {
        //初始化目录列表
        IList<CategoryInfo> categories = new List<CategoryInfo>();

        //执行返回数据集的方法
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CATEGORIES, null))
        {
            //逐条读取数据集中的数据记录
            while (rdr.Read())
            {
                //用实体接收数据
                CategoryInfo cat = new CategoryInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2));
                //将数据实体添加到目录列表中
                categories.Add(cat);
            }
        }
        return categories;
    }

    /// <summary>
    ///　通过ID获取目录
    /// </summary>
    /// <param name="categoryId">目录的id</param>
    /// <returns>返回指定的目录</returns>
    public CategoryInfo GetCategory(int categoryId)
    {
        CategoryInfo category = null;
        //创建参数，并赋值
        SqlParameter parm = new SqlParameter(PARM_CATEGORY_ID, SqlDbType.Int);
        parm.Value = categoryId;

        //执行查询	
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CATEGORY, parm))
        {
            if (rdr.Read())
                category = new CategoryInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2));
            else
                category = new CategoryInfo();
        }
        return category;
    }
    /// <summary>
    /// 删除指定ID的目录
    /// </summary>
    /// <param name="catid">目录的ID</param>
    /// <returns>是否成功</returns>
    public bool DelCategory(int catid)
    { 
        //首先判断目录下是否有书
        //创建参数，并赋值
        SqlParameter parm = new SqlParameter(PARM_CATEGORY_ID, SqlDbType.Int);
        parm.Value = catid;
        //执行查询	
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_BOOK, parm))
        {
            //表示此目录下没有书存在
            if (rdr.Read())
                return false;
        }
        //开始执行删除操作
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        //    //创建参数，并赋值
        //SqlParameter parm1 = new SqlParameter(PARM_CATEGORY_ID, SqlDbType.Int);
        //parm1.Value = catid;
        cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_DELETE_CATEGORIE);
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
            return true;
        }
    }
}
