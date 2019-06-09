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

public partial class controls_PayControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //公共属性－表示用户填写的付款信息
    public PayInfo Pay
    {
        get 
        {
            //获取变量的值
            string name = txtname.Text;
            string cardtype = ddltype.SelectedValue;
            string cardnum = txtcardnum.Text;
            //初始化一个付款实体对象
            return new PayInfo(name, cardtype, cardnum);
        }
        set 
        {
            if (value != null)
            {
                //判断如果有值的话，自动填充控件
                if (!string.IsNullOrEmpty(value.Name))
                    txtname.Text = value.Name;
                if (!string.IsNullOrEmpty(value.CardNum))
                    txtcardnum.Text = value.CardNum;
                if (!string.IsNullOrEmpty(value.CardType))
                    ddltype.Items.FindByValue(value.CardType).Selected = true;
            }
        }
    }
}
