using System;
using System.Text;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// 投票项目操作类
/// </summary>
public class ItemControl
{
    private const string PARM_ITEM_NAME = "@ItemName";
    private const string PARM_TITLE_ID = "@TitleID";
    private const string SQL_INSERT_ITEM = "INSERT INTO VoteItem  values(@TitleID,@ItemName,0)";

	public ItemControl()
	{
	}
    public void AddItem(string itemname, int titleid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter [] parms = new SqlParameter []{new SqlParameter(PARM_TITLE_ID, SqlDbType.Int),
         new SqlParameter(PARM_ITEM_NAME, SqlDbType.NVarChar, 30)};
        // 设置参数的值
        parms[0].Value = titleid;
        parms[1].Value = itemname;
        //将所有的参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_INSERT_ITEM);
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
    private const string PARM_ITEM_ID = "@ItemID";
    private const string SQL_UPDATE_ITEM = "UPDATE VoteItem SET  itemcount=itemcount +1 WHERE ItemID=@ItemID";

    /// <summary>
    /// 更新项目被投次数
    /// </summary>
    /// <param name="voteID">投票项目的ID</param>
    public void UpdateItem(int ItemID)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取缓存的参数列表
        SqlParameter parm = new SqlParameter(PARM_ITEM_ID, SqlDbType.Int);
        // 设置参数的值
        parm.Value = ItemID;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);
        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_UPDATE_ITEM);
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
    private const string PARM_IP_ADDRESS = "@ipaddress";
    private const string SQL_INSERT_IP = "INSERT INTO IpControl  values(@ItemID,@ipaddress,getdate())";

    /// <summary>
    /// 将投过票的ID记录下来
    /// </summary>
    /// <param name="IPAddress">IP</param>
    /// <param name="ItemID">项目的ID</param>
    public void AddIP(string IPAddress,int ItemID)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 获取参数列表
        // 获取缓存的参数列表
        SqlParameter[] parms = new SqlParameter[]{new SqlParameter(PARM_ITEM_ID, SqlDbType.Int),
         new SqlParameter(PARM_IP_ADDRESS, SqlDbType.NVarChar, 30)};
        // 设置参数的值
        parms[0].Value = ItemID;
        parms[1].Value = IPAddress;
        //将所有的参数添加到SqlCommand命令中
        foreach (SqlParameter parm in parms)
            cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            // 添加SQL语句
            strSQL.Append(SQL_INSERT_IP);
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
    //此语句要注意，不管要判断IP相同，还要判断时间是否已经是有效期之外。
    private const string SQL_SELECT_IPADDRESS = "SELECT IpAddress FROM IpControl WHERE IpAddress=@ipaddress and datediff(hh,getdate(),logintime)<1 and Itemid !=@ItemID";

    /// <summary>
    /// 判断IP地址是否已经投过票，并在有效时间内
    /// </summary>
    /// <param name="IpAddress">IP</param>
    /// <param name="itemID">项目的ID</param>
    /// <returns></returns>
    public bool IsEffect(string IpAddress,int itemID)
    {
        bool result;
        //创建参数
        SqlParameter[] parms = new SqlParameter[]{new SqlParameter(PARM_ITEM_ID, SqlDbType.Int),
         new SqlParameter(PARM_IP_ADDRESS, SqlDbType.NVarChar, 30)};
        // 设置参数的值
        parms[0].Value = itemID;
        parms[1].Value = IpAddress;

        //执行查询
        using (SqlDataReader rdr = SqlHelper.ExecuteReader(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_IPADDRESS, parms))
        {
            if (rdr.Read())
                result= false;
            else
                result= true;
        }
        return result;

    }
    private const string SQL_SELECT_COUNT = "SELECT SUM(itemcount) FROM VoteItem";
    /// <summary>
    /// 获取总投票数量
    /// </summary>
    /// <returns>总投票数</returns>
    public int GetVoteCount()
    {
        //调用SqlHelper访问组件的方法返回第一行第一列的值
        object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction, CommandType.Text, SQL_SELECT_COUNT, null);
        return int.Parse(obj.ToString());
    }
}
