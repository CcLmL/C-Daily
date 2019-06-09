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

public partial class readerInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                bindReaderInfo();
            }
            else

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");

        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }        
    }

    public void bindReaderInfo()
    {
        string sql = "select * from tb_readerInfo as a inner join tb_readerType as b on a.readerType=b.[id]";
        gvReaderInfo.DataSource = dataOperate.getDataset(sql, "tb_readerInfo");
        gvReaderInfo.DataKeyNames = new string[] { "readerBarCode" };
        gvReaderInfo.DataBind();
    }

    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["readerManage"]);                             //返回是否拥有权限
    }
    protected void gvReaderInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvReaderInfo.DataKeys[e.RowIndex].Value.ToString();
        string sql = "delete tb_readerInfo where readerBarCode='" + id + "'";
        dataOperate.execSQL(sql);
        bindReaderInfo();
    }
}
