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
public partial class bookBorrowSearch : System.Web.UI.Page
{
    static string sql = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (!getSet())                               //判断是否拥有权限  

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");

        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }        
    }
    //自定义方法判断是否拥有此页面的权限
    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSearch"]);                             //返回是否拥有权限
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string condition=ddlCondition.SelectedValue;
        string key = txtKey.Text;
        sql = "select * from tb_bookBorrow where " + condition + " like '%" + key + "%'";
        bindBookBorrow(sql, getisReturn());

    }

    public void bindBookBorrow(string seSql,string isReturn)
    {    
        gvBookBorrow.DataSource = dataOperate.getDataset(seSql+isReturn, "tb_bookBorrow");
        gvBookBorrow.DataBind();
    }

    //自定义方法用来判断图书借还信息并返回
    public string  getisReturn()
    {
        if (rdibtnSy.Checked)       //所有图书信息
        {
            return "";
        }
        else if(rdibtn1.Checked)   //未还图书信息
        {
            return "and isReturn = '1'";
        }
        else if (rdibtn0.Checked)  //以还图书信息
        {
            return "and isReturn='0'";
        }
        return "";
    }
    protected void gvBookBorrow_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookBorrow.PageIndex = e.NewPageIndex;
        bindBookBorrow(sql, getisReturn());
    }
}
