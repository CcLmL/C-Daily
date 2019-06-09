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

public partial class bookcaseManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                bindCase();                         //自定义方法显示图书详细信息  
            }
            else

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");

        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }           
    }
    //自定义方法绑定书架信息
    public void bindCase()
    {
        string sql = "select * from tb_bookcase";
        gvBookcase.DataSource = dataOperate.getDataset(sql, "tb_bookcase");
        gvBookcase.DataKeyNames = new string[] { "bookcaseID" };
        gvBookcase.DataBind();
    }

    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSet"]);                             //返回是否拥有权限
    }
    protected void gvBookcase_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvBookcase.DataKeys[e.RowIndex].Value.ToString();
        string seSql="select count(*) from tb_bookInfo where bookcase="+id;
        if (dataOperate.seleSQL(seSql)<= 0)
        {
            string sql = "delete from tb_bookcase where bookcaseID=" + id;
            dataOperate.execSQL(sql);
            bindCase();
        }
        else
            RegisterStartupScript("", "<script>alert('此书架拥有图书，不可以删除！')</script>");
    }
}
