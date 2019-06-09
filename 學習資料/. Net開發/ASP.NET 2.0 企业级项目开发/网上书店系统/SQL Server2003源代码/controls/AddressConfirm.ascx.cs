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

public partial class controls_AddressConfirm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    ///	设置控件内的地址信息
    /// </summary>
    public AddressInfo Address
    {
        set
        {
            if (value != null)
            {
                if (!string.IsNullOrEmpty(value.UserName))
                    ltlUserName.Text = value.UserName;
                if (!string.IsNullOrEmpty(value.Address))
                    ltlAddress.Text = value.Address;
                if (!string.IsNullOrEmpty(value.ZipCode))
                    ltlZip.Text = value.ZipCode;
                if (!string.IsNullOrEmpty(value.Country))
                    ltlCountry.Text = value.Country;
                if (!string.IsNullOrEmpty(value.Phone))
                    ltlPhone.Text = value.Phone;
                if (!string.IsNullOrEmpty(value.Email))
                    ltlEmail.Text = value.Email;
            }
        }
    }
}
