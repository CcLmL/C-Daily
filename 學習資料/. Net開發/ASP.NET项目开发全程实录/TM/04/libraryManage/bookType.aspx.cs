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

public partial class bookType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                bindBookType();                           
            }
            else

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");

        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }
    }
    //自定义方法绑定图书类型信息
    public void bindBookType()
    {
        string sql = "select * from tb_bookType";
        gvBookType.DataSource = dataOperate.getDataset(sql, "tb_bookType");
        gvBookType.DataKeyNames = new string[] { "typeID" };
        gvBookType.DataBind();
    }
    //自定义方法判断用户权限
    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSet"]);                             //返回是否拥有权限
    }
    protected void gvBookType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvBookType.DataKeys[e.RowIndex].Value.ToString();
        string seSql = "select count(*) from tb_bookInfo where bookType=" + id;
        if (dataOperate.seleSQL(seSql) <=0)
        {
            string sql = "delete tb_bookType where typeID=" + id;
            dataOperate.execSQL(sql);
            bindBookType();
        }
        else
            RegisterStartupScript("", "<script>alert('不可以删除！')</script>");


    }
}
