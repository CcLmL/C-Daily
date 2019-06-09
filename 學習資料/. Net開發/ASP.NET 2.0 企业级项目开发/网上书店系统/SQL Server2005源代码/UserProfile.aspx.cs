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

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            //绑定Profile的信息到指定控件
            AddressForm.Address = Profile.AccountInfo;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Profile.AccountInfo = AddressForm.Address;
        Profile.Save();
        lblMessage.Text = "您的帐户地址更新成功.<br>&nbsp;";
    }
}
