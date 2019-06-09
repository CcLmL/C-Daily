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

public partial class admSet : System.Web.UI.Page
{
   static string userName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)        
        {
            bindUser();         //调用自定义方法显示该管理员当前拥有的权限
        }
    }
    //用来绑定管理员当前拥有的权限
    public void bindUser()
    {
        userName = Request.QueryString["userName"].ToString();                      //获取管理员登录名
        txtUserName.Text = userName;                                                //显示管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";   
        SqlDataReader sdr = dataOperate.getRow(sql);                                   
        sdr.Read();                                                                 //读取一条记录    
        cekboxSystemSet.Checked = Convert.ToBoolean(sdr["systemSet"]);              //显示是否拥有系统设置权限
        ceckboxSystemSearch.Checked = Convert.ToBoolean(sdr["systemSearch"]);       //显示是否拥有系统查询权限
        ceckboxReaderManage.Checked = Convert.ToBoolean(sdr["ReaderManage"]);       //显示是否拥有读者管理权限
        ceckboxBookManage.Checked = Convert.ToBoolean(sdr["bookManage"]);           //显示是否拥有图书管理权限
        ceckboxBookBorrow.Checked = Convert.ToBoolean(sdr["bookBorrow"]);           //显示是否拥有图书借还权限
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        byte systemSet = Convert.ToByte(cekboxSystemSet.Checked);                   //获取系统管理权限
        byte systemSearch = Convert.ToByte(ceckboxSystemSearch.Checked);            //获取系统查询权限
        byte readerManage = Convert.ToByte(ceckboxReaderManage.Checked);            //获取读者管理权限
        byte bookManage = Convert.ToByte(ceckboxBookManage.Checked);                //获取图书管理权限
        byte bookBorrow = Convert.ToByte(ceckboxBookBorrow.Checked);                //获取图书借还权限
        string sql = "update tb_admSet set systemSet=" + systemSet + ",systemSearch=" + systemSearch + ",readerManage=" + readerManage + ",bookManage=" + bookManage + " ,bookBorrow=" + bookBorrow + " where userName='" + userName + "'";
        if (dataOperate.execSQL(sql))
        {           
            RegisterStartupScript("", "<script>alert('设置成功！');opener.location.reload();window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('设置失败！')</script>");
        } 
    }
}
