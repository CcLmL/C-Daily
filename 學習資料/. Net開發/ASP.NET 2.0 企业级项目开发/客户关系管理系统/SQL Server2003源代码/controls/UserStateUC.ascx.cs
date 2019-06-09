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

public partial class controls_UserStateUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 设计用户控件的选择值
    /// </summary>
    public string SelectValue
    {
        //返回下拉框的选择值
        get { return DropDownList1.SelectedValue.ToString(); }
    }
}
