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

public partial class addReaderType : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.QueryString["id"].ToString();           //获取对图书操作的方式
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            //自定义方法绑定书架
            if (id != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改读者类型";
                string sql = "select * from tb_readerType where id=" + id;            
                SqlDataReader sdr = dataOperate.getRow(sql);
                sdr.Read();
                txtTypeName.Text = sdr["type"].ToString();
                txtNum.Text = sdr["num"].ToString();
                sdr.Close();
            }
            else
                this.Title = "添加读者类型";
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string type = txtTypeName.Text;         //获取读者类型名称
        string num = txtNum.Text;               //获取可借数量
        string sql = "";
        if (id == "add")
        {
            sql = "insert into tb_readerType values('" + type + "'," + num + ")";
        }
        else
            sql = "update tb_readerType set type='" + type + "',num=" + num + " where id=" + id;

        if (dataOperate.execSQL(sql))   //判断添加或修改是否成功
        {
            Response.Write("<script language=javascript>alert('保存成功！');window.opener.location.href=window.opener.loaction='readerType.aspx';window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('保存失败！')</script>");
        }
    }
}
