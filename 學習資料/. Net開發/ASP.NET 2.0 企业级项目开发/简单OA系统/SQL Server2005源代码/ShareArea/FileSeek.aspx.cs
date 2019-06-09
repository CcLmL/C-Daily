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

public partial class ShareArea_FileSeek : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //服务器上的共享文件路径
        HiddenField1.Value = Server.MapPath("~/FileManager/");
    }
}
