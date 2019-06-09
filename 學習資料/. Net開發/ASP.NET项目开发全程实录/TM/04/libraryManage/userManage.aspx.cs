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

public partial class userManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                bindUerManage();                       
            }
            else
                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");
        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }
        
    }

    public void bindUerManage()
    {
        string sql = "select * from tb_admSet";
        gvAdmSet.DataSource = dataOperate.getDataset(sql, "tb_admSet"); //获取数据源
        gvAdmSet.DataKeyNames=new string[] {"userName"};                //设置主键字段
        gvAdmSet.DataBind();                                            //绑顶GridView控件显示管理员信息
    }

    protected void gvAdmSet_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userName = this.gvAdmSet.DataKeys[e.RowIndex].Value.ToString();  //获取主键字段
        string sql = "delete from tb_admSet where userName='" + userName + "'";
        dataOperate.execSQL(sql);                                               //删除管理员信息
        bindUerManage();                                                        //重新绑定管理员信息
    }

    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSet"]);                             //返回是否拥有权限
    }

}
