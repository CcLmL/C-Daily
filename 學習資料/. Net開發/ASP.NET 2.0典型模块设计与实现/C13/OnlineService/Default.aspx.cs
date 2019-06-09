using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //如果是行
        if (e.Item.ItemType == ListItemType.Item)
        {
            //定义连接地址
            HyperLink mylink = (HyperLink)e.Item.Controls[0].FindControl("HyperLink1");
            mylink.NavigateUrl = "tencent://message/?uin=" + ((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[0] + "&Site=http://localhost/Default.aspx&Menu=yes>";
        }
        //如果是交替行
        if (e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //定义连接地址
            HyperLink mylink = (HyperLink)e.Item.Controls[0].FindControl("HyperLink2");
            mylink.NavigateUrl = "tencent://message/?uin=" + ((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[0] + "&Site=http://localhost/Default.aspx&Menu=yes>";

        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}
