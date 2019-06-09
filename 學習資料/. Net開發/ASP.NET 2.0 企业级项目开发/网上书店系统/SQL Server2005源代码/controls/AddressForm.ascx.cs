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

public partial class controls_AddressForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 定义控件的公开属性－地址
    /// </summary>
    public AddressInfo Address
    {
        get
        {

            // 判断文本内容是否为空
            if (string.IsNullOrEmpty(txtName.Text)  &&
               string.IsNullOrEmpty(txtAddress.Text) &&
               string.IsNullOrEmpty(txtZip.Text) &&
               string.IsNullOrEmpty(txtEmail.Text) &&
               string.IsNullOrEmpty(txtPhone.Text))
                return null;

            // 验证数据内容
            string userName = Product.InputText(txtName.Text, 50);
            string address = Product.InputText(txtAddress.Text, 50);
            string zip = Product.InputText(txtZip.Text, 10);
            string phone = Product.InputText(txtPhone.Text, 10);
            string email = Product.InputText(txtEmail.Text, 80);
            string country = Product.InputText(listCountry.SelectedItem.Value, 50);
            //创建一个地址类实体对象。
            return new AddressInfo(userName, address, zip, country, phone, email);
        }
        set
        {
            //为实体类对象赋值
            if (value != null)
            {
                if (!string.IsNullOrEmpty(value.UserName))
                    txtName.Text = value.UserName;
                if (!string.IsNullOrEmpty(value.Address))
                    txtAddress.Text = value.Address;
                if (!string.IsNullOrEmpty(value.ZipCode))
                    txtZip.Text = value.ZipCode;
                if (!string.IsNullOrEmpty(value.Phone))
                    txtPhone.Text = value.Phone;
                if (!string.IsNullOrEmpty(value.Email))
                    txtEmail.Text = value.Email;
                if (!string.IsNullOrEmpty(value.Country))
                {
                    listCountry.ClearSelection();
                    listCountry.SelectedValue = value.Country;
                }
            }
        }
    }
}
