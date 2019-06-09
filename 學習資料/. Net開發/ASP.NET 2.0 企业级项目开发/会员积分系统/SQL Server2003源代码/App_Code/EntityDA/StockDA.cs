using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Text;
using System.Data.SqlClient;

/// <summary>
/// 商品信息实体类
/// </summary>
public class StockDA
{
    private const string PARM_STOCK_ID = "@stockid";
    private const string PARM_STOCK_NAME = "@stockname";
    private const string PARM_STOCK_PRICE = "@stockprice";
    private const string PARM_STOCK_COUNT = "@stockcount";
    private const string PARM_STOCK_DATE = "@newdate";
    private const string PARM_POINT_COUNT = "@count";
    private const string SQL_SELECT_STOCK = "SELECT stockname,stockprice,stockcount FROM stock WHERE stockid=@stockid";
    private const string SQL_UPDATE_STOCKCOUNT = "UPDATE stock SET stockcount= stockcount - @stockcount WHERE stockid=@stockid";
    private const string SQL_INSERT_SALE = "INSERT INTO sale VALUES(@stockid,@stockcount,@newdate)";
    private const string SQL_INSERT_BACK = "INSERT INTO backstock VALUES(@stockid,@stockcount,@newdate)";
    private const string SQL_INSERT_GIFT = "INSERT INTO freestock VALUES(@stockid,@newdate)";
    private const string SQL_INSERT_GIFTRULE = "INSERT INTO giftrule VALUES(@stockid,@count)";
    /// <summary>
    /// 通过商品编码和数量获取实体信息
    /// </summary>
    /// <param name="stockid">商品编码</param>
    /// <param name="count">商品数量，如果是反馈商品，此值为"-1"</param>
    /// <returns>商品实体信息</returns>
    public StockEntity GetStockByID(string stockid,int count)
    {
        //初始化返回的变量
        StockEntity mystock = null;
        //初始化参数并赋值
        SqlParameter parm = new SqlParameter(PARM_STOCK_ID,SqlDbType.NVarChar,20);
        parm.Value = stockid;

        //执行DataReader命令，获取数据
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_STOCK, parm))
        {
           //通过循环依次获取
            while (rdr.Read())
            {
                //使用有参数的构造函数为信息实体赋值
                //如果是在销售和退货的情况下，更改商品数量，由用户决定。
                //反馈情况下，只允许商品数量为1，所以无须更改。
                if (count != -1)
                {
                    mystock = new StockEntity(rdr.GetString(0), rdr.GetDouble(1), count);
                }
                else
                {
                    mystock = new StockEntity(rdr.GetString(0), rdr.GetDouble(1), rdr.GetInt32(2));

                }
            }
        }
        //返回实体信息
        return mystock;
    }
    /// <summary>
    /// 更新库存量，用于销售、退货或反馈
    /// </summary>
    /// <param name="stockid">商品编码</param>
    /// <param name="stockcount">商品要更新的数量</param>
    /// <param name="operation">执行某种操作</param>
    /// <returns>是否成功</returns>
    public bool UpdateStockCount(string stockid,int stockcount,int operation)
    {
        //打开连接，并执行SqlCommand命令
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //打开数据库连接
            conn.Open();
            //创建与连接关联的SqlCommand
            SqlCommand mycmd = conn.CreateCommand();
            //获取更新需要的参数列表
            SqlParameter[] memberParms = GetStockParameters();
            // 给参数赋值
            memberParms[0].Value = stockid;
             //判断当操作为退货时，数量应该是负数
            if(operation ==1)          
                memberParms[1].Value = -stockcount;
            else
                memberParms[1].Value = stockcount;
            memberParms[2].Value = DateTime.Now;
            //将参数添加到SqlCommand命令中
            foreach (SqlParameter parm in memberParms)
                mycmd.Parameters.Add(parm);
            //开始数据库事务
            SqlTransaction trans = conn.BeginTransaction("StockTrans");
            try
            {
                //设置SqlCommand属性
                mycmd.Connection = conn;
                mycmd.Transaction = trans;
                mycmd.CommandType = CommandType.Text;
                mycmd.CommandText = SQL_UPDATE_STOCKCOUNT;
                mycmd.ExecuteNonQuery();
                //判断选择的是哪种操作类型:0-销售,1-退货,2-反馈
                switch (operation)
                {
                    case 0:
                        mycmd.CommandText = SQL_INSERT_SALE;
                        break;
                    case 1:
                        mycmd.CommandText = SQL_INSERT_BACK;
                        break;
                    case 2:
                        mycmd.CommandText = SQL_INSERT_GIFT;
                        break;
                }
                mycmd.ExecuteNonQuery();
                //执行事务
                trans.Commit();
                //清空参数列表
                mycmd.Parameters.Clear();
                return true;
            }
            catch
            {
                //如果发生错误，则事务回滚
                trans.Rollback();
                return false;
            }
        }
    }
    /// <summary>
    /// 获取参数列表
    /// </summary>
    /// <returns>返回参数数组</returns>
    private static SqlParameter[] GetStockParameters()
    {
        //调用缓存中的参数列表
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_UPDATE_STOCKCOUNT);

        //如果参数不存在
        if (parms == null)
        {
            //新建一个参数数组，并包括指定的参数列表
            parms = new SqlParameter[] {
					new SqlParameter(PARM_STOCK_ID, SqlDbType.Int),
                    new SqlParameter(PARM_STOCK_COUNT, SqlDbType.Int),
                    new SqlParameter(PARM_STOCK_DATE, SqlDbType.DateTime)
					};

            //缓存参数列表
            SqlHelper.CacheParameters(SQL_UPDATE_STOCKCOUNT, parms);
        }
        //返回参数数组
        return parms;        
    }
    /// <summary>
    /// 添加反馈规则
    /// </summary>
    /// <param name="stockid">商品编码</param>
    /// <param name="count">积分额度</param>
    /// <returns>添加是否成功</returns>
    public bool AddGiftRule(string stockid,int count)
    {
        //初始化输入参数并赋值
        SqlParameter parm1 = new SqlParameter(PARM_STOCK_ID, SqlDbType.NVarChar, 20);
        parm1.Value = stockid;
        SqlParameter parm2 = new SqlParameter(PARM_POINT_COUNT, SqlDbType.Int);
        parm2.Value = count;

        //初始化连接字符串
        StringBuilder strSQL = new StringBuilder();
        //初始化参数列表
        SqlParameter[] memberParms = new SqlParameter[] {parm1,parm2};
        SqlCommand cmd = new SqlCommand();

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in memberParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_GIFTRULE);
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
}



