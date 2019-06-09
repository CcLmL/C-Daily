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

public partial class MigrateAnonymous : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Profile.IsAnonymous)
        {
            //屏蔽提示信息
            Label1.Visible=false;
            //显示属性界面
            Panel1.Visible = true;

            //获取复杂个性化设置
            MyType equtype = new MyType();
            if ( !Profile.MyBank.Equals(equtype) )
            {
                //获取保存的文本框类型
                switch (Profile.TextMode.ToString())
                {
                    case "SingleLine":
                        ddlsize.SelectedValue = "单行";
                        break;
                    case "MultiLine":
                        ddlsize.SelectedValue = "多行";
                        break;
                    case "Password":
                        ddlsize.SelectedValue = "密码";
                        break;
                }
                //获取个人银行信息
                MyType mybank = new MyType();
                mybank = Profile.MyBank;
                //用TextBox显示获取的银行信息
                txtbankname.Text = mybank.BankName;
                txtbankpass.Text = mybank.BankPassword;
                txtmoney.Text = mybank.BankMoney.ToString();
                
            }
        }
        else 
        {
            //显示提示信息
            Label1.Visible = true;
            //屏蔽个性设置
            Panel1.Visible = false;
        }
    }

}
