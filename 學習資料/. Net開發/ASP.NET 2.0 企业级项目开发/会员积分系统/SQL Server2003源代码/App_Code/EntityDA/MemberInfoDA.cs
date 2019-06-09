using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// MemberInfoDA 的摘要说明
/// </summary>
public class MemberInfoDA
{
    //定义常量表示字段名称或SQL语句。
    private const string SQL_INSERT_MEMBERINFO = "INSERT INTO memberinfo VALUES(@cardid, @cardnum, @custname, @custidentity, @custphone, @custaddress,@carddate)";
    private const string SQL_UPDATE_MEMBERINFO = "update memberinfo set custname=@custname,custphone=@custphone,custaddress=@custaddress";
    private const string PARM_CARD_ID = "@cardid";
    private const string PARM_CUST_PHONE = "@custphone";
    private const string PARM_CARD_NUM = "@cardnum";
    private const string PARM_CUST_ADDRESS = "@custaddress";
    private const string PARM_CARD_DATE= "@carddate";
    private const string PARM_CUST_IDENTITY = "@custidentity";
    private const string PARM_CUST_NAME = "@custname";
    private const string SQL_SELECT_BYCARDNUM = "SELECT memberinfo.cardnum,memberinfo.custname,memberinfo.custidentity,memberinfo.custphone,memberinfo.custaddress,memberinfo.carddate, cardtype.cardtypename,cardtype.cardid FROM memberinfo INNER JOIN cardtype ON memberinfo.cardid=cardtype.cardid WHERE memberinfo.cardnum=@cardnum";
    private const string SQL_SELECT_BYCUSTIDENTITY = "SELECT memberinfo.cardnum,memberinfo.custname,memberinfo.custidentity,memberinfo.custphone,memberinfo.custaddress,memberinfo.carddate, cardtype.cardtypename,cardtype.cardid FROM memberinfo INNER JOIN cardtype ON memberinfo.cardid=cardtype.cardid WHERE memberinfo.custidentity=@custidentity";
    private const string SQL_SELECT_BYCUSTNAME = "SELECT memberinfo.cardnum,memberinfo.custname,memberinfo.custidentity,memberinfo.custphone,memberinfo.custaddress,memberinfo.carddate, cardtype.cardtypename ,cardtype.cardid FROM memberinfo INNER JOIN cardtype ON memberinfo.cardid=cardtype.cardid WHERE memberinfo.custname=@custname";

    /// <summary>
    /// 通过会员卡号查询会员资料
    /// </summary>
    /// <param name="cardnum">会员卡号</param>
    /// <returns>会员信息实体</returns>
    public MemberInfoEntity GetMemberInfoByCardNum(string cardnum)
    {
        //初始化返回的变量
        MemberInfoEntity memberinfo = null;
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_CARD_NUM, SqlDbType.NVarChar, 20);
        parm.Value = cardnum;
        //使用DataReader来保存返回的数据
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_BYCARDNUM, parm))
        {
            //如果数据有多条，循环读取
            while (rdr.Read())
            {
                //给会员信息实体依次赋值，顺序要与会员信息实体的构造参数一样
                memberinfo = new MemberInfoEntity(rdr.GetString(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3), rdr.GetString(4), rdr.GetDateTime(5), rdr.GetInt32(7));
            }
        }
        //返回会员信息实体
        return memberinfo;
    }

    /// <summary>
    /// 通过身份证号查询会员资料
    /// </summary>
    /// <param name="cardnum">会员身份证号</param>
    /// <returns>会员信息实体</returns>
    public MemberInfoEntity GetMemberInfoByCustIdentity(string custidentity)
    {
        //初始化会员实体
        MemberInfoEntity memberinfo = null;
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_CUST_IDENTITY, SqlDbType.NVarChar, 20);
        parm.Value = custidentity;
        //返回SqlDataReader类型的数据集
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_BYCUSTIDENTITY, parm))
        {
            //循环读取数据
            while (rdr.Read())
            {
                //给会员信息实体依次赋值，顺序要与会员信息实体的构造参数一样
                memberinfo = new MemberInfoEntity(rdr.GetString(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3), rdr.GetString(4), rdr.GetDateTime(5), rdr.GetInt32(7));
            }
        }
        //返回实体信息
        return memberinfo;
    }

    /// <summary>
    /// 通过会员姓名查询会员资料
    /// </summary>
    /// <param name="cardnum">会员姓名</param>
    /// <returns>会员信息实体</returns>
    public MemberInfoEntity  GetMemberInfoByCustName(string custname)
    {
        //初始化会员实体
        MemberInfoEntity memberinfo = null;
        //初始化输入参数并赋值
        SqlParameter parm = new SqlParameter(PARM_CUST_NAME, SqlDbType.NVarChar, 20);
        parm.Value = custname;
        //返回数据集SqlDataReader
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_BYCUSTNAME, parm))
        {
            while (rdr.Read())
            {
                //给会员信息实体依次赋值，顺序要与会员信息实体的构造参数一样
                memberinfo = new MemberInfoEntity(rdr.GetString(0), rdr.GetString(1), rdr.GetString(2), rdr.GetString(3), rdr.GetString(4), rdr.GetDateTime(5),  rdr.GetInt32(7));
            }
            //返回会员信息实体数组
            return memberinfo;
        }

    }

    /// <summary>
    /// 添加会员信息
    /// </summary>
    /// <param name="memberinfo">会员信息实体</param>
    /// <returns>添加是否成功</returns>
    public bool InsertMemberInfo(MemberInfoEntity memberinfo)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] memberParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 依次给实体参数赋值
        memberParms[0].Value = memberinfo.CardID;
        memberParms[1].Value = memberinfo.CardNum;
        memberParms[2].Value = memberinfo.CustName;
        memberParms[3].Value = memberinfo.CustIdentity;
        memberParms[4].Value = memberinfo.CustPhone;
        memberParms[5].Value = memberinfo.CustAdress;
        memberParms[6].Value = memberinfo.CardDate;

        //遍历所有参数，并将参数添加到SqlCommand命令中
        foreach (SqlParameter parm in memberParms)
            cmd.Parameters.Add(parm);

        //首先判断身份证号是否登记过，通过调用本类的GetMemberInfoByCustIdentity方法。
        //如果返回的数据不为空，返回false，表示已经存在此身份证号。
        MemberInfoEntity testen = GetMemberInfoByCustIdentity(memberinfo.CustIdentity);
        if (testen != null)
            return false;
        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_MEMBERINFO);
            //打开数据库连接，执行命令
            conn.Open();
            //设置Sqlcommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加的SqlCommand命令
            int val= cmd.ExecuteNonQuery();
            //清空SqlCommand命令中的参数
            cmd.Parameters.Clear();
            //判断是否添加成功，注意返回的是添加是否成功，不是影响的行数
            if (val > 0)
                return true;
            else
                return false;
        }
    }
    private static SqlParameter[] GetParameters()
    {
        //将SQL_INSERT_MEMBERINFO做为哈希表缓存的键值
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_MEMBERINFO);

        //首先判断缓存是否已经存在
        if (parms == null)
        {
            //缓存不存在的情况下，新建参数列表
            parms = new SqlParameter[] {
                    new SqlParameter(PARM_CARD_ID, SqlDbType.Int),
                    new SqlParameter(PARM_CARD_NUM, SqlDbType.VarChar, 20),
                    new SqlParameter(PARM_CUST_NAME, SqlDbType.VarChar, 20),
                    new SqlParameter(PARM_CUST_IDENTITY, SqlDbType.VarChar, 20),
                    new SqlParameter(PARM_CUST_PHONE, SqlDbType.VarChar, 20),
                    new SqlParameter(PARM_CUST_ADDRESS, SqlDbType.VarChar, 100),
                    new SqlParameter(PARM_CARD_DATE, SqlDbType.DateTime)};

            //将新建的参数列表添加到哈希表中缓存起来
            SqlHelper.CacheParameters(SQL_INSERT_MEMBERINFO, parms);
        }
        //返回参数数组
        return parms;
    }
    /// <summary>
    /// 修改会员信息
    /// </summary>
    /// <param name="memberinfo">会员信息实体</param>
    /// <returns>修改是否成功</returns>
    public bool UpdateMemberInfo(MemberInfoEntity memberinfo)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] memberParms = GetParameters();
        SqlCommand cmd = new SqlCommand();

        // 给参数赋值
        //由于会员卡号、身份证号、办卡日期不允许修改，所以修改的参数只有3个
        memberParms[2].Value = memberinfo.CustName;
        memberParms[4].Value = memberinfo.CustPhone;
        memberParms[5].Value = memberinfo.CustAdress;
        //遍历参数列表，添加到SqlCommand命令的参数列表中
        foreach (SqlParameter parm in memberParms)
            cmd.Parameters.Add(parm);

        //获取数据库的连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_UPDATE_MEMBERINFO);
            //打开数据库连接，开始与数据库的交互
            conn.Open();
            //设置SqlCommand命令的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行命令
            int val=cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            //判断是否修改成功
            if (val > 0)
                return true;
            else
                return false;
        }
    }
   
}
