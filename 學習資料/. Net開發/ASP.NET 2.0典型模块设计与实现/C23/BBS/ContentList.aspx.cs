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

public partial class ContentList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //配置DataList的数据源文件
        XmlDataSource1.DataFile = Request.QueryString["filename"]+"file.xml";
        HyperLink1.NavigateUrl = "backmsg.aspx?infoid=" + Request.QueryString["filename"];
    }
}
