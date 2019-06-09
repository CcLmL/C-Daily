using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Datacon 的摘要说明
/// </summary>
public class Datacon
{
	public Datacon()
	{
		
	}
    public SqlConnection getcon()
    {
        string strCon = "Data Source=(local);DataBase=db_Examination;User ID=sa;PWD=";
        SqlConnection sqlCon = new SqlConnection(strCon);
        return sqlCon;
    }
    public bool eccom(string sqlstr) 
    {
        SqlConnection con=this.getcon();
        con.Open();
        SqlCommand mycommand=new SqlCommand(sqlstr,con);
        try
        {
            mycommand.ExecuteNonQuery();
            return true;
        }
        catch 
        {
            return false;
        }
       finally
        {
            con.Close();
        }
    }
    public bool ecDropDownList(DropDownList DDL, string sqlstr3, string DTF, string DVF)
    {
        //创建数据库连接
        SqlConnection con = this.getcon();
        //打开数据库连接
        con.Open();
        //定义并初使化数据适配器
        SqlDataAdapter mydataadapter = new SqlDataAdapter(sqlstr3,con);
        //创建一个数据集mydataset
        DataSet mydataset = new DataSet();
        //将数据适配器中的数据填充到数据集中
        mydataadapter.Fill(mydataset);
        DDL.DataSource = mydataset;
        DDL.DataTextField = DTF;
        DDL.DataValueField = DVF;
        try
        {
            
            DDL.DataBind();
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            //关闭数据库连接
            con.Close();
        }
    }
    public bool ecadabind(GridView gv,string sqlstrl4)
    {
        //定义新的数据库连接
        SqlConnection con = this.getcon();
        //打开数据库连接
        con.Open();
        //定义并初使化数据适配器
        SqlDataAdapter mydataadapter = new SqlDataAdapter(sqlstrl4,con);
        //创建一个数据集mydataset
        DataSet mydataset = new DataSet();
        //将数据适配器中的数据填充到数据集中
        mydataadapter.Fill(mydataset);
        //将此数据集作为表格控件的数据源
        gv.DataSource=mydataset;
        try
        {
            //绑定数据库中数据
            gv.DataBind();
            //返回这个数据集
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            //关闭数据库连接
            con.Close();
        }
    }
    public bool ecadabindinfostring(GridView gv,string sqlstr5,string DNK)
    {
        SqlConnection con = this.getcon();
        con.Open();
        SqlDataAdapter mydataadapter = new SqlDataAdapter(sqlstr5,con);
        DataSet mydataset = new DataSet();
        mydataadapter.Fill(mydataset);
        gv.DataSource=mydataset;
        gv.DataKeyNames = new string[] { DNK };
        try
        {
            gv.DataBind();
            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            con.Close();
        }
    }
    public SqlDataReader ExceRead(string SqlCom)
    {
        SqlConnection con = this.getcon();
        con.Open();
        //创建一个SqlCommand对象，表示要执行的SqlCom语句或存储过程
        SqlCommand sqlcom = new SqlCommand(SqlCom, con);
        SqlDataReader read = sqlcom.ExecuteReader();
        return read;
    }
}
