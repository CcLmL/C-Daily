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

public partial class bookSearch : System.Web.UI.Page
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
    //自定义方法绑定图书类型
    public void bindBookType()
    {
        string typeSql = "select * from tb_bookType";
        ddlBookType.DataSource = dataOperate.getDataset(typeSql, "tb_bookType");
        ddlBookType.DataTextField = "typeName";
        ddlBookType.DataValueField = "typeID";
        ddlBookType.DataBind();
    }
    //判断是否显示图书类型
    protected void ddlCondition_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCondition.SelectedValue.Trim() == "bookType")
        {
            txtKey.Visible = false;
            ddlBookType.Visible = true;
            RequiredFieldValidator1.Visible = false;
            bindBookType();
        }
        else
        {
            txtKey.Visible = true;
            RequiredFieldValidator1.Visible = true;
            ddlBookType.Visible = false;
        }
    }
    //查找搜索的图书信息
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string Condition = ddlCondition.Text;
        string key = "";
        if (ddlBookType.Visible)
        {
            key = ddlBookType.SelectedValue;
        }
        else
            key = txtKey.Text;
         sql = "select * from tb_bookInfo where " + Condition + " like '%" + key + "%'";
         bindBookInfo(sql);
        txtKey.Text = "";       
    }

    public void bindBookInfo(string sql)
    {
        gvBookInfo.DataSource = dataOperate.getDataset(sql, "tb_bookInfo");
        gvBookInfo.DataBind();
    }
    //绑定显示图书类型和书架
    protected void gvBookInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   //设置图书类型
            string bookType = e.Row.Cells[2].Text.ToString();               //获取图书类型编号
            string typeSql = "select * from tb_bookType where TypeID=" + bookType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 //读取一条记录
            e.Row.Cells[2].Text = typeSdr["typeName"].ToString();
            //设置书架
            string bookcase = e.Row.Cells[3].Text.ToString();               //获取书架编号
            string caseSql = "select * from tb_bookcase where bookcaseID=" + bookcase;
            SqlDataReader caseSdr = dataOperate.getRow(caseSql);
            caseSdr.Read();                                                 //读取一条记录
            e.Row.Cells[3].Text = caseSdr["bookcaseName"].ToString();            
        }
    }
    protected void gvBookInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookInfo.PageIndex = e.NewPageIndex;
        bindBookInfo(sql);
    }
}
