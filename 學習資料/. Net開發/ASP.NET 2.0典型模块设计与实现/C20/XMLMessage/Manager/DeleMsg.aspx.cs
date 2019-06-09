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
public partial class Manager_DeleMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //判断选择的是否是删除按钮
        if (e.CommandName == "Delete")
        {
            //初始化XML文件操作类
            XMLRW myrw = new XMLRW();
            //传递选中的名字和需要修改的文件名
            myrw.DeleNote(Server.MapPath("../") + @"XMLFile.xml",e.CommandArgument.ToString());
        }
    }
}
