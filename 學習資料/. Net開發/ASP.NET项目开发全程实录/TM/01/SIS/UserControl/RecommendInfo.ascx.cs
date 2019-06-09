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

public partial class UserControl_RecommendInfo : System.Web.UI.UserControl
{
    Operation operation = new Operation();
    static string infoType = "";   　　　　//信息类型

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.Title != "供求信息网")
        {
            infoType = Page.Title.Substring(7, 4);
            DataList1.DataSource = operation.SelectLeaguerInfo(infoType, true);
            DataList1.DataBind();
        }
        else
        {
            DataList1.DataSource = operation.SelectLeaguerInfo(infoType, false);
            DataList1.DataBind();
        }
    }
}
