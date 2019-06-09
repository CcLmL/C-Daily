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

public partial class bookInfoManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                bindBook();                          //自定义方法显示图书详细信息  
            }
            else
              
                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");
            
        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }                   
    }
    public void bindBook()
    {
        string sql = "select * from tb_bookInfo  ";
        gvBookManage.DataSource = dataOperate.getDataset(sql, "tb_bookInfo");     //获取图书信息数据源
        gvBookManage.DataKeyNames = new string[] { "bookBarCode" };               //设置主键字段  
        gvBookManage.DataBind();                                                  //绑定GridView控件  
    }

    protected void gvBookManage_RowDataBound(object sender, GridViewRowEventArgs e)
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

            e.Row.Attributes.Add("onMouseOver", "Color=this.style.backgroundColor;this.style.backgroundColor='lightBlue'");
            e.Row.Attributes.Add("onMouseOut", "this.style.backgroundColor=Color;");
        }
    }
    protected void gvBookManage_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string barCode = gvBookManage.DataKeys[e.RowIndex].Value.ToString();        //获取改行图书条形码    
        string sql = "delete from tb_bookInfo where bookBarCode='" + barCode + "'";
        dataOperate.execSQL(sql);                                                   //将此条图书信息删除
        bindBook();                                                                 //调用自定义方法重新绑定图书信息        
    }

    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSet"]);                             //返回是否拥有权限
    }

    protected void gvBookManage_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBookManage.PageIndex = e.NewPageIndex;                //设置当前页的索引
        gvBookManage.DataBind();                                //重新绑定GridView控件
    }
}
