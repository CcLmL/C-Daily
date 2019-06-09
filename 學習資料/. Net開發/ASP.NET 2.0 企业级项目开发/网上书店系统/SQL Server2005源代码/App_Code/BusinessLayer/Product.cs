using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;


/// <summary>
/// 有关商品信息的操作类
/// </summary>
public class Product
{
    //定义静态变量
    private const string PARM_SUPPLIER_NAME = "@SupplierName";
    private const string PARM_SUPPLIER_PHONE = "@Phone";
    private const string PARM_SUPPLIER_ADDR = "@Address";
    private const string SQL_INSERT_SUPPLIER = "INSERT INTO supplier  VALUES( @SupplierName,@Address,@phone)";

    private const string PARM_PRODUCT_NAME = "@ProductName";
    private const string PARM_PRODUCT_CATEGORYID = "@categoryid";
    private const string PARM_PRODUCT_IMAGE = "@productimage";
    private const string PARM_PRODUCT_DESCRIPTION = "@productdescription";
    private const string SQL_INSERT_PRODUCT = "INSERT INTO product  VALUES( @categoryid,@ProductName,@productdescription,@productimage)";
    private const string SQL_SELECT_PRODUCTID = "UPDATE item SET productid=(SELECT TOP 1 productid FROM product ORDER BY productid DESC) WHERE ISNULL(productid,8)=8";
    private const string PARM_ITEM_PRODUCTID = "@productid";
    private const string PARM_ITEM_SUPPLIERID = "@supplierid";
    private const string PARM_ITEM_QUANTITY = "@quantity";
    private const string PARM_ITEM_PRICE = "@price";
    private const string PARM_ITEM_ITEMID = "@itemid";
    private const string SQL_INSERT_ITEM = "INSERT INTO item ( supplierid,price,productname,productimage)  VALUES( @supplierid,@price,@ProductName,@productimage)";
    private const string SQL_SELECT_ITEMID = "UPDATE productcount SET itemid=(SELECT TOP 1 itemid FROM item ORDER BY itemid DESC) WHERE ISNULL(itemid,8)=8";
    private const string SQL_INSERT_COUNT = "INSERT INTO productcount( count)  VALUES(@quantity)";


    private const string SQL_SELECT_PRODUCTS_BY_CATEGORY = "SELECT Product.ProductId, Product.ProductName, Product.ProductDescription, Product.ProductImage, Product.CategoryId FROM Product WHERE Product.CategoryId = @categoryid";
    private const string SQL_SELECT_PRODUCTS_BY_SEARCH1 = "SELECT ProductId, ProductName, ProductDescription, Product.ProductImage, Product.CategoryId FROM Product WHERE ((";
    private const string SQL_SELECT_PRODUCTS_BY_SEARCH2 = "ProductName LIKE '%' + {0} + '%' OR CategoryId LIKE '%' + {0} + '%'";
    private const string SQL_SELECT_PRODUCTS_BY_SEARCH3 = ") OR (";
    private const string SQL_SELECT_PRODUCTS_BY_SEARCH4 = "))";
    private const string PARM_KEYWORD = "@Keyword";
    //private const string SQL_SELECT_PRODUCT = "SELECT Product.ProductId, Product.Name, Product.Descn, Product.Image, Product.CategoryId FROM Product WHERE Product.ProductId  = @ProductId";
    //private const string PARM_CATEGORY = "@Category";

    //private const string PARM_PRODUCTID = "@ProductId";


	public Product(){	}
    /// <summary>
    /// 通过目录ID获取目录下的图书信息 
    /// </summary>
    /// <param name="category">目录ID</param>  
    /// <returns>图书信息列表</returns>
    public IList<ProductInfo> GetProductsByCategory(int category)
    {

        IList<ProductInfo> productsByCategory = new List<ProductInfo>();

        //创建参数并赋值
        SqlParameter parm = new SqlParameter(PARM_PRODUCT_CATEGORYID, SqlDbType.Int);
        parm.Value = category;
        //执行获取语句
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_PRODUCTS_BY_CATEGORY, parm))
        {
            while (rdr.Read())
            {
                ProductInfo product = new ProductInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3), rdr.GetInt32(4));
                productsByCategory.Add(product);
            }
        }
        return productsByCategory;
    }
    /// <summary>
    /// 添加供应商的方法
    /// </summary>
    /// <param name="name">供应商名称</param>
    /// <param name="phone">供应商电话</param>
    /// <param name="addr">供应商地址</param>
    public void AddSupplier(string name,string phone,string addr)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 创建参数列表
        SqlParameter[] parms = new SqlParameter[] {
					new SqlParameter(PARM_SUPPLIER_NAME, SqlDbType.VarChar, 50),
                    new SqlParameter(PARM_SUPPLIER_ADDR, SqlDbType.VarChar, 100),
					new SqlParameter(PARM_SUPPLIER_PHONE, SqlDbType.VarChar, 20)};

        // 设置参数的值
        parms[0].Value = name;
        parms[1].Value = addr;
        parms[2].Value = phone;
        //将参数添加到SQL命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {

            // 添加SQL语句
            strSQL.Append(SQL_INSERT_SUPPLIER);
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
    /// 添加商品
    /// </summary>
    /// <param name="product">商品信息实体</param>
    /// <param name="item">商品详细信息实体</param>
    /// <param name="quantity">商品数量</param>
    public void AddProduct(ProductInfo product,ItemInfo item)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的图书基本资料参数列表
        SqlParameter[] ProductParms = GetProductParameters();
        // 设置参数的值
        ProductParms[0].Value = product.Name;
        ProductParms[1].Value = product.CategoryId;
        ProductParms[2].Value = product.Description;
        ProductParms[3].Value = product.Image;
        //将图书基本资料参数添加到SQL命令中
        foreach (SqlParameter parm in ProductParms)
            cmd.Parameters.Add(parm);

        // 获取缓存的图书详细资料参数列表
        SqlParameter[] ItemParms = GetItemParameters();
        // 设置参数的值
        ItemParms[0].Value = 0;;
        ItemParms[1].Value = item.SupplierId;
        ItemParms[2].Value = item.Price;
        ItemParms[3].Value = item.Quantity;
        //将图书基本资料参数添加到SQL命令中
        foreach (SqlParameter parm in ItemParms)
            cmd.Parameters.Add(parm);
        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {

            // 添加SQL语句
            strSQL.Append(SQL_INSERT_PRODUCT);
            conn.Open();
            //开始事务
            SqlTransaction trans = conn.BeginTransaction();
            //设置SqlCommand的属性
            cmd.Transaction = trans;
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            try
            {
                //首先添加图书基本资料，并获取刚添加的ID值
                cmd.CommandText = strSQL.ToString();
                cmd.ExecuteNonQuery();
                //其次添加图书详细资料
                cmd.CommandText = SQL_INSERT_ITEM;
                cmd.ExecuteNonQuery();
                //最后添加图书数量
                cmd.CommandText = SQL_INSERT_COUNT;
                cmd.ExecuteNonQuery();
                //执行事务
                trans.Commit();

            }
            catch(Exception e)
            {
                //回滚事务
                trans.Rollback();
            }
            //因为执行事务时无法获取刚刚添加数据的ID
            //所以执行完事务后更新外键ID
            cmd.CommandText = SQL_SELECT_PRODUCTID;
            cmd.ExecuteNonQuery();
            cmd.CommandText = SQL_SELECT_ITEMID;
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
    /// <summary>
    /// 返回或设置缓存的参数列表
    /// </summary>
    /// <returns>图书基本信息参数列表</returns>
    private static SqlParameter[] GetProductParameters()
    {
        //获取缓存的参数
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_PRODUCT);
        //如果没有缓存，则创建一个新的参数列表
        if (parms == null)
        {
            parms = new SqlParameter[] {
					new SqlParameter(PARM_PRODUCT_NAME, SqlDbType.VarChar, 50),
                    new SqlParameter(PARM_PRODUCT_CATEGORYID, SqlDbType.Int),
                    new SqlParameter(PARM_PRODUCT_DESCRIPTION, SqlDbType.VarChar, 300),
					new SqlParameter(PARM_PRODUCT_IMAGE, SqlDbType.VarChar, 100)};

            //将参数列表缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_PRODUCT, parms);
        }
        return parms;
    }
    /// <summary>
    /// 返回或设置缓存的参数列表
    /// </summary>
    /// <returns>图书详细信息参数列表</returns>
    private static SqlParameter[] GetItemParameters()
    {
        //获取缓存的参数
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_ITEM);
        //如果没有缓存，则创建一个新的参数列表
        if (parms == null)
        {
            parms = new SqlParameter[] {
					new SqlParameter(PARM_ITEM_PRODUCTID, SqlDbType.Int),
                    new SqlParameter(PARM_ITEM_SUPPLIERID, SqlDbType.Int),
                    new SqlParameter(PARM_ITEM_PRICE, SqlDbType.Decimal,13),
                    new SqlParameter(PARM_ITEM_QUANTITY, SqlDbType.Int)};

            //将参数列表缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_ITEM, parms);
        }
        return parms;
    }
    /// <summary>
    /// 通过关键字查询商品
    /// 查询结果包含带关键字的商品名称和目录名称
    /// </summary>
    /// <param name="keywords">关键字数组</param>
    /// <returns>商品信息</returns>
    public IList<ProductInfo> GetProductsBySearch(string[] keywords)
    {

        IList<ProductInfo> productsBySearch = new List<ProductInfo>();

        int numKeywords = keywords.Length;

        //创建查询语句
        StringBuilder sql = new StringBuilder(SQL_SELECT_PRODUCTS_BY_SEARCH1);

        //添加查询关键字
        for (int i = 0; i < numKeywords; i++)
        {
            sql.Append(string.Format(SQL_SELECT_PRODUCTS_BY_SEARCH2, PARM_KEYWORD + i));
            sql.Append(i + 1 < numKeywords ? SQL_SELECT_PRODUCTS_BY_SEARCH3 : SQL_SELECT_PRODUCTS_BY_SEARCH4);
        }
        string sqlProductsBySearch = sql.ToString();
        SqlParameter[] parms = SqlHelper.GetCachedParameters(sqlProductsBySearch);

        // 如果缓存参数不存在，重新创建参数
        if (parms == null)
        {
            parms = new SqlParameter[numKeywords];
            for (int i = 0; i < numKeywords; i++)
                parms[i] = new SqlParameter(PARM_KEYWORD + i, SqlDbType.VarChar, 80);
            //将参数缓存
            SqlHelper.CacheParameters(sqlProductsBySearch, parms);
        }

        // 绑定新参数
        for (int i = 0; i < numKeywords; i++)
            parms[i].Value = keywords[i];

        //执行查询
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, sqlProductsBySearch, parms))
        {
            while (rdr.Read())
            {
                ProductInfo product = new ProductInfo(rdr.GetInt32(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3), rdr.GetInt32(4));
                productsBySearch.Add(product);
            }
        }

        return productsBySearch;
    }

    /// <summary>
    /// 将用户输入的字符串转化为标准搜索内容
    /// </summary>
    /// <param name="text">用户的输入</param>
    /// <param name="maxLength">字符串的最大长度</param>
    /// <returns>标准的字符串</returns>
    public static string InputText(string text, int maxLength)
    {
        //判断字符是否为空
        text = text.Trim();
        if (string.IsNullOrEmpty(text))
            return string.Empty;
        //判断字符是否超出长度
        if (text.Length > maxLength)
            text = text.Substring(0, maxLength);
        //使用正则表达式替换非法字符
        text = Regex.Replace(text, "[\\s]{2,}", " ");	//两个或更多的空格
        text = Regex.Replace(text, "(<[b|B][r|R]/*>)+|(<[p|P](.|\\n)*?>)", "\n");	//HTML换行
        text = Regex.Replace(text, "(\\s*&[n|N][b|B][s|S][p|P];\\s*)+", " ");	//HTML字符"&nbsp";
        text = Regex.Replace(text, "<(.|\\n)*?>", string.Empty);	//其他标志
        text = text.Replace("'", "''");
        return text;
    }
    /// <summary>
    /// 导航页的方法
    /// </summary>
    /// <param name="key">搜索关键字</param> 
    public static void SearchRedirect(string key)
    {
        HttpContext.Current.Response.Redirect(string.Format("~/Product/Search.aspx?keywords={0}", InputText(key, 255)));
    }
}
