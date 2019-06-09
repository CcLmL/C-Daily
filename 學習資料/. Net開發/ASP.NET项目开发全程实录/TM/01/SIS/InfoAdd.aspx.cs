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

public partial class InfoAdd : System.Web.UI.Page
{
    Operation operation = new Operation();　//声明业务层类对象

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        operation.InsertInfo(DropDownList1.Text, txtTitle.Text.Trim(), txtInfo.Text.Trim(), txtLinkMan.Text.Trim(), txtTel.Text.Trim());
        WebMessageBox.Show("信息发布成功！", "Default.aspx");
    }
}
