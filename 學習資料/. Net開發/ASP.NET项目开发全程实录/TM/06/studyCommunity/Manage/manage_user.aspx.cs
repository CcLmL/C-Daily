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
using System.Data.OleDb;
public partial class Manage_manage_user : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        createUser();
    }

    protected void createUser()
    {
        string sql = "select * from tb_login";
        this.GridView1.DataSource = mydo.rows(sql, "tb_login").DefaultView;
        this.GridView1.DataKeyNames = new string[] { "ID" };        
        this.GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string sql = "delete from tb_login where ID=" + GridView1.DataKeys[e.RowIndex].Value.ToString();
        if (mydo.adlData(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        createUser();
    } 
   //绑定图标
    public string ImgUrl(string id)
    {
        string sql = "select Lock from tb_login where ID=" +id;
        OleDbDataReader odr = mydo.row(sql);        //调用数据库操作类的Row方法查找用户的详细信息
        odr.Read();

        int i =Convert.ToInt32(odr["Lock"]);        //判断用户是否被锁定
        if (i == 0)
        {
            return "../images/kaisuo.gif";                //返回未锁定的图标
        }
        else
        {
            return "../images/suo.gif";            //返回锁定的图标
        }
        
    }
    //绑定操作
    public string BtnText(string id)
    {
        string sql = "select Lock from tb_login where ID=" +id;
        OleDbDataReader odr = mydo.row(sql);         //调用数据库操作类的Row方法查找用户的详细信息
        odr.Read();
        int i = Convert.ToInt32(odr["Lock"]);       //判断用户是否被锁定
        if (i == 0)
        {
            return "锁定";                          //返回锁定
        }
        else
        {
            return "解锁";                          //返回解锁
        }
      
    }


    
}
