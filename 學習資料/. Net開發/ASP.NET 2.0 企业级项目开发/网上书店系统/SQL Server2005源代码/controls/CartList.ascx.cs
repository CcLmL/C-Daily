using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class controls_CartList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 绑定控件
    /// </summary>
    public void Bind(ICollection<CartItemInfo> cart)
    {
        if (cart != null)
        {
            Repeater1.DataSource = cart;
            Repeater1.DataBind();
        }
    }
}
