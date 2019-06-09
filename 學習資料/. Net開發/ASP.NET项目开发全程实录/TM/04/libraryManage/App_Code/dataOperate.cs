using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// dataOperate 的摘要说明
/// </summary>
public class dataOperate
{
   static SqlConnection  con;
	public dataOperate()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //执行数据库的添加删除更新操作
    public static bool execSQL(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        try
        {
            com.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception e)
        {
            con.Close();
            return false;
        }
        return true;
    }
    //查找记录是否存在
    public static int seleSQL(string sql)
    {       
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        try
        {
            return Convert.ToInt32(com.ExecuteScalar());
            con.Close();
        }
        catch (Exception e)
        {
            con.Close();
            return 0;
        }
       

    }
    //返回所有记录
    public static DataSet getDataset(string sql, string table)
    {

        SqlConnection con = createCon();
        con.Open();
        DataSet ds;

        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        ds = new DataSet();
        sda.Fill(ds, table);
        return ds;

      

    }
    //返回一条记录
    public static SqlDataReader getRow(string sql)
    {
        SqlConnection con = createCon();
        con.Open();
        SqlCommand com = new SqlCommand(sql, con);
        return com.ExecuteReader();


    }

    public static SqlConnection createCon()
    {
         con = new SqlConnection("server=.;database=db_tsrj;uid=sa;pwd=;");
        return con;
    }

  
    
}
