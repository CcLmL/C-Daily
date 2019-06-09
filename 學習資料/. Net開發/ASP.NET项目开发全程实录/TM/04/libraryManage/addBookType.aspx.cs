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

public partial class addBookType : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        id = Request.QueryString["bookTypeID"].ToString();           //获取对图书操作的方式
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            //自定义方法绑定书架
            if (id != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改图书类型";
                string sql = "select * from tb_bookType where typeID=" + id;            //调用自定义方法生成条形码
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtTypeName.Text = sdr["typeName"].ToString();
                txtBorrowDay.Text = sdr["borrowDay"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加图书类型";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string typeName = txtTypeName.Text;
        string borrowDay = txtBorrowDay.Text;
        string sql = "";
        if (id == "add")
        {
            sql = "insert into tb_bookType values('" + typeName + "','"+borrowDay+"')";
        }
        else
            sql = "update tb_bookType set typeName='" + typeName + "',borrowDay='"+borrowDay+"' where typeID=" + id;

        if (dataOperate.execSQL(sql))   //判断添加或修改是否成功
        {
            Response.Write("<script language=javascript>alert('保存成功！');window.opener.location.href=window.opener.loaction='bookType.aspx';window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('保存失败！')</script>");
        }
    }
}
