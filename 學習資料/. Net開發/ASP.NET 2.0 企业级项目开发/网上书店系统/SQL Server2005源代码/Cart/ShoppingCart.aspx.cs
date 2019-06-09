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

public partial class Cart_ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 保存当前图书信息到Profile中
    /// </summary>
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string itemId = Request.QueryString["addItem"];
            if (!string.IsNullOrEmpty(itemId))
            {
                Profile.ShoppingCart.Add(int.Parse(itemId));
                Profile.Save();
                //// 导航到当前页
                //Response.Redirect("~/Cart/ShoppingCart.aspx", true);
            }
        }
    }
}
