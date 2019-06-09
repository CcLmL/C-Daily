using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

/// <summary>
/// dataOperate 的摘要说明
/// </summary>
public class dataOperate
{
  
	public dataOperate()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    //添加数据或删除数据  
     public  bool adlData(string sql)
    {
        OleDbConnection Odbc = createCon();
        Odbc.Open();
        OleDbCommand com = new OleDbCommand(sql, Odbc);
        int i = Convert.ToInt32(com.ExecuteNonQuery());
        Odbc.Close();
        if (i > 0)
        {
           return true;
        }
        else
        {
           return false;
        }      
    }

    //查找数据  
    public  int isData(string sql)
    {
        OleDbConnection Odbc =createCon();                  
        Odbc.Open();
        OleDbCommand com = new OleDbCommand(sql, Odbc);
        int i = Convert.ToInt32(com.ExecuteScalar());
        Odbc.Close();
        return i;       
    }

    //更新数据  
    public  void updateData(string sql)
    {
        OleDbConnection Odbc =createCon();                
        Odbc.Open();
        OleDbCommand com = new OleDbCommand(sql,Odbc);       
        com.ExecuteScalar();
        Odbc.Close();
    }

    //查找并返回一条数据
    public  OleDbDataReader row(string sql)
    {
        OleDbConnection Odbc =createCon();
        Odbc.Open();
        OleDbCommand com = new OleDbCommand(sql, Odbc);
        return com.ExecuteReader();       
    }


    //查找并返回多条数据
    public  DataTable rows(string sql, string table)
    {
        DataSet ds;
        OleDbConnection Odbc =createCon();
        Odbc.Open();
        OleDbDataAdapter oda = new OleDbDataAdapter(sql,Odbc);
        ds = new DataSet();
        oda.Fill(ds,table);
        Odbc.Close();
        return ds.Tables[table];
    }

    //创建数据库连接
    public  OleDbConnection createCon()
    {
        OleDbConnection odbc = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data source=|DataDirectory|db_study.mdb;");
        return odbc;
    }
}
