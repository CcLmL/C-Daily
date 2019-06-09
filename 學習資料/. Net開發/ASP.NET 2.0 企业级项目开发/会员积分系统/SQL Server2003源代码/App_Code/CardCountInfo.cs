using System;
using System.Data;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// CardCountInfo 的摘要说明
/// </summary>
public class CardCountInfo
{
    private int _cardcount;
    private const string PARM_CARD_NUM = "@cardnum";
    private const string SQL_SELECT_CARDCOUNT = "SELECT ISNULL(SUM(Point),0) AS CardCount FROM CardHistory  WHERE CardNum=@cardnum";

    private const string PARM_CARD_POINT = "@point";
    private const string PARM_OPERATION_TYPE = "@mark";
    private const string PARM_HANDLE_DATE = "@handledate";
    private const string SQL_INSERT_CARDHISTORY = "INSERT INTO CardHistory VALUES(@cardnum,@mark,@point,@handledate)";
    private const string SQL_SELECT_CARDRULE = "SELECT cardtype.cardrule FROM memberinfo INNER JOIN cardtype on cardtype.cardid=memberinfo.cardid WHERE  cardnum=@cardnum";

    private const string SQL_SELECT_HISTORY = "SELECT ConsumeID,CardNum,Point,HandleDate, CASE Mark WHEN 0 THEN '销售' WHEN 1 THEN '退货' WHEN 2 THEN '反馈' END AS operationtype FROM cardhistory WHERE CardNum=@cardnum";

    public CardCountInfo()
	{
	}
    /// <summary>
    /// 根据卡号查询卡积分
    /// </summary>
    /// <param name="cardnum">卡号</param>
    /// <returns>总积分</returns>
    public int GetCountByCardNum(string cardnum)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_CARD_NUM, SqlDbType.NVarChar, 20);
        parm.Value = cardnum;
        
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        string tempstr=SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CARDCOUNT, parm).ToString();
        //为了转换不发生错误，可以先把取出的值从object转到string,再转到int.
        _cardcount = int.Parse(tempstr);
        //返回总积分
        return _cardcount;
    }
    /// <summary>
    /// 积分处理方法，添加历史记录
    /// </summary>
    /// <param name="cardnum">会员卡号</param>
    /// <param name="money">金额（只允许输入整数，因为只有整数才能积分）</param>
    /// <param name="operationtype">操作类型（0-销售，1-退货，2-反馈）</param>
    /// <returns>操作是否成功</returns>
    public bool AddHistory(string cardnum,int money,int operationtype)
    {
        //首先获取该卡号对应的积分规则。
        //初始化输入参数并赋值
        SqlParameter parm1 = new SqlParameter(PARM_CARD_NUM, SqlDbType.NVarChar, 20);
        parm1.Value = cardnum;

        //调用SqlHelper访问组件的方法返回第一行第一列的值-积分规则
        string tempstr = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CARDRULE, parm1).ToString();
        //进行类型转换，以方便下面的运算
        int rule = int.Parse(tempstr);
        //根据金额换算出积分,金额数乘以积分规则，结果取整数部分。
        //如果操作类型是“反馈”，则已经是积分，不需要换算
         int point=0;
         if (operationtype != 2)
             point = (int)(money * rule);
         else
             point = money;

        //初始化连接字符串
        StringBuilder strSQL = new StringBuilder();
        //初始化参数列表
        SqlParameter[] memberParms = GetCountParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        memberParms[0].Value = cardnum;
        memberParms[1].Value = operationtype;
        //判断操作类型，是销售时，加积分，退货和反馈时，减积分
        if(operationtype !=0)
            memberParms[2].Value = -point;
        else
            memberParms[2].Value = point;
        memberParms[3].Value = DateTime.Now;


        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in memberParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_CARDHISTORY);
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
    /// 获取参数列表
    /// </summary>
    /// <returns>返回参数数组</returns>
    private static SqlParameter[] GetCountParameters()
    {
        //调用缓存中的参数列表
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_CARDHISTORY);

        //如果参数不存在
        if (parms == null)
        {
            //新建一个参数数组，并包括指定的参数列表
            parms = new SqlParameter[] {
					new SqlParameter(PARM_CARD_NUM, SqlDbType.NVarChar,20),
                    new SqlParameter(PARM_OPERATION_TYPE, SqlDbType.Int),
                    new SqlParameter(PARM_CARD_POINT, SqlDbType.Int),
                    new SqlParameter(PARM_HANDLE_DATE, SqlDbType.DateTime)
					};

            //缓存参数列表
            SqlHelper.CacheParameters(SQL_INSERT_CARDHISTORY, parms);
        }
        //返回参数数组
        return parms;
    }


    /// <summary>
    /// 根据卡号查询积分历史记录
    /// </summary>
    /// <param name="cardnum">卡号</param>
    /// <returns>积分历史记录</returns>
    public SqlDataReader GetHistroy(string cardnum)
    {
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_CARD_NUM, SqlDbType.NVarChar, 20);
        parm.Value = cardnum;
        //根据卡号返回数据集SqlDataReader
        SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_HISTORY, parm);
         return rdr;
    }
}