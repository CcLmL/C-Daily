using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;

/// <summary>
/// CardTypeDA 是专门用于访问CardTypeEntity的方法
/// </summary>
public class CardTypeDA
{
    //常量用来表示T-SQL语句中用到的变量名称和T-SQL语句本身
    private const string PARM_CARD_TYPENAME = "@cardtypename";
    private const string PARM_CARD_RULE = "@cardrule";
    private const string PARM_CARD_ID = "@cardid";
    private const string SQL_SELECT_CARDRULE = "SELECT cardrule FROM cardtype WHERE cardtypename=@cardtypename";
    private const string SQL_UPDATE_CARDTYPENAME = "UPDATE cardtype SET cardtypename=@cardtypename WHERE cardtypename=@oldname";
    private const string SQL_UPDATE_CARDRULE = "UPDATE cardtype SET cardrule=@cardrule WHERE cardtypename=@cardtypename";
    private const string SQL_INSERT_CARDTYPE = "INSERT INTO cardtype VALUES(@cardtypename,@cardrule)";
    private const string SQL_SELECT_CARDNAME = "SELECT cardtypename FROM cardtype WHERE cardtypename=@cardtypename";
    private const string SQL_SELECT_CARDID = "SELECT cardid FROM cardtype WHERE cardtypename=@cardtypename";

    /// <summary>
    /// 通过会员卡类型名称更新积分规则
    /// </summary>
    /// <param name="cardtypename">会员卡类型名称</param>
    /// <returns>积分规则</returns>
    public int GetCardRule(string cardtypename)
    {
        int cardrule=0;
        
        //创建新参数并给参数赋值，用来指定会员卡类型名称
        SqlParameter parm = new SqlParameter(PARM_CARD_TYPENAME, SqlDbType.NVarChar, 20);
        parm.Value = cardtypename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        cardrule = (int)  SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CARDRULE, parm);
        
        return cardrule;
    }

    /// <summary>
    /// 更新卡积分规则
    /// </summary>
    /// <param name="cardtypename">卡类型名称</param>
    /// <param name="newrule">更新后的积分规则</param>
    /// <returns>更新是否成功</returns>
    public bool UpdateCardRule(CardTypeEntity mycarden)
    {
        //获取参数列表
        SqlParameter[] cardParms = GetParameters();

        // 给参数赋值
        cardParms[0].Value = mycarden.CardTypeName;
        cardParms[1].Value = mycarden.CardRule;

        //使用StringBuilder来连接字符串
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();

        //遍历参数列表并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in cardParms)
            cmd.Parameters.Add(parm);

        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            //在连接字符串中加入SQL语句
            strSQL.Append(SQL_UPDATE_CARDRULE);
            conn.Open();
            cmd.Connection = conn;

            //设定SqlCommand命令的属性
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();

            //执行SqlCommand命令的不返回结果集的方法
            int val = cmd.ExecuteNonQuery();

            //清空SqlCommand中的参数列表
            cmd.Parameters.Clear();
            //判断如果并影响的行数大于0，则更新更新成功，否则失败。
            if (val > 0)
                return true;
            else
                return false;
        }
    }

    /// <summary>
    /// 更新卡类型名称
    /// </summary>
    /// <param name="oldname">旧名称</param>
    /// <param name="newname">新名称</param>
    /// <returns>更新是否成功</returns>
    public bool UpdateCardTypeName(string oldname,string newname)
    {
        //首先判断新的会员卡类型名称是否已经存在
        bool exits = GetCardType(newname);
        int val=0;
        //如果不存在，正常执行，如果存在，则val值不变，方法返回false。
        if (exits)
        {
            //创建参数数组，并赋值。
            //因为此方法中参数与会员卡类型实体的参数不同，不可以使用GetParameters方法获取。
            SqlParameter[] parms = new SqlParameter[]{
                            new SqlParameter(PARM_CARD_TYPENAME, SqlDbType.NVarChar, 20),
                            new SqlParameter("@oldname", SqlDbType.NVarChar, 20)};
            parms[0].Value = newname;
            parms[1].Value = oldname;

            //执行SqlHelper中不返回结果集的方法
           val = SqlHelper.ExecuteNonQuery(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_UPDATE_CARDTYPENAME, parms);
        }
        if (val > 0)
            return true;
        else
            return false;
    }

    /// <summary>
    /// 添加卡类型
    /// </summary>
    /// <param name="mycard">卡类型实体</param>
    public bool InsertCardType(CardTypeEntity mycard)
    {
        //首先判断新的会员卡类型名称是否已经存在
        bool exits = GetCardType(mycard.CardTypeName);
        //如果不存在，正常执行，如果存在，方法返回false。
        if (exits)
        {
            StringBuilder strSQL = new StringBuilder();

            //获取添加卡类型的T-SQL语句的参数
            SqlParameter[] cardParms = GetParameters();
            SqlCommand cmd = new SqlCommand();

            // 给参数赋值
            cardParms[0].Value = mycard.CardTypeName;
            cardParms[1].Value = mycard.CardRule;

            //遍历参数列表，并将参数添加进SqlCommand命令中
            foreach (SqlParameter parm in cardParms)
                cmd.Parameters.Add(parm);

            //定义对象资源保存的范围，一旦using范围结束，将释放对方所占的资源
            using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
            {
                strSQL.Append(SQL_INSERT_CARDTYPE);
                conn.Open();

                //设定SqlCommand的属性
                cmd.Connection = conn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strSQL.ToString();
                //执行SqlCommand命令
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                if (val > 0)
                    return true;
                else
                    return false;
            }
        }
        else
            return false;

    }

    /// <summary>
    /// 获取参数列表，因上面两个方法用到了此方法，所以单独列出。
    /// </summary>
    /// <param name="mycard">要执行的T-SQL语句</param>
    /// <returns>返回参数集合</returns>
    private static SqlParameter[] GetParameters()
    {
        //获取key值为cardtype的缓存参数列表
        SqlParameter[] parms = SqlHelper.GetCachedParameters("cardType");

        //如果参数列表不存在
        if (parms == null)
        {
            //新建参数列表
            parms = new SqlParameter[] {
					new SqlParameter(PARM_CARD_TYPENAME, SqlDbType.VarChar, 20),
					new SqlParameter(PARM_CARD_RULE, SqlDbType.Int)};

            //缓存新建的参数列表，并设置KEY值为cardtype。
            SqlHelper.CacheParameters("cardType", parms);
        }
        return parms;
    }

    /// <summary>
    /// 判断会员卡类型名称是否重复(仅为类内部调用，不公开)
    /// </summary>
    /// <param name="typename">会员卡类型名称</param>
    /// <returns>是否重复</returns>
    private bool GetCardType(string typename)
    {
       //创建新参数并给参数赋值，用来指定会员卡类型名称
        SqlParameter parm = new SqlParameter(PARM_CARD_TYPENAME, SqlDbType.NVarChar, 20);
        parm.Value = typename;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CARDNAME, parm);
           
        //如果卡类型不存在返回true，如果存在返回false
        if (obj == null)
            return true;
        else
            return false;
    }

    /// <summary>
    /// 获取卡类型的ID
    /// </summary>
    /// <param name="cardtype">卡类型</param>
    /// <returns>卡类型ID</returns>
    public static int GetCardID(string cardtype)
    {
        int cardid = 0;

        //创建新参数并给参数赋值，用来指定会员卡类型名称
        SqlParameter parm = new SqlParameter(PARM_CARD_TYPENAME, SqlDbType.NVarChar, 20);
        parm.Value = cardtype;

        //调用SqlHelper访问组件的方法返回第一行第一列的值
        cardid = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_CARDID, parm);

        return cardid;
    }
}