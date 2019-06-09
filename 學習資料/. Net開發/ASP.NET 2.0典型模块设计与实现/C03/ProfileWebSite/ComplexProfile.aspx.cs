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

public partial class ComplexProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否是回发页面
        if (!IsPostBack)
        {

            //设计一个空的自定义对象，做比较用
            MyType equtype = new MyType();
            //获取复杂个性化设置
            if ( !Profile.MyBank.Equals(equtype) && Profile.TextMode.ToString() !="")
            {
                //获取保存的文本框类型
                switch (Profile.TextMode.ToString())
                {
                    case "SingleLine":
                        ddlsize.SelectedValue ="单行" ;
                        break;
                    case "MultiLine":
                        ddlsize.SelectedValue = "多行";
                        break;
                    case "Password":
                        ddlsize.SelectedValue = "密码";
                        break;
                }
                //获取个人银行信息
                //用TextBox显示获取的银行信息
                txtbankname.Text = Profile.MyBank.BankName;
                txtbankpass.Text = Profile.MyBank.BankPassword;
                txtmoney.Text = Profile.MyBank.BankMoney.ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        //保存文本框类型
        switch (ddlsize.SelectedValue)
        {
            case "单行":
                Profile.TextMode = TextBoxMode.SingleLine;
                break;
            case "多行":
                Profile.TextMode = TextBoxMode.MultiLine;
                break;
            case "密码":
                Profile.TextMode = TextBoxMode.Password;
                break;
        }
        //设计一个空的自定义对象，做比较用
        MyType equtype = new MyType();
        //如果自定义设置为空，则赋值
        if (Profile.MyBank.Equals(equtype))
        {
            //保存自定义类型
            MyType bank = new MyType();
            //个人银行名称
            bank.BankName = txtbankname.Text;
            //个人银行密码
            bank.BankPassword = txtbankpass.Text;
            //个人银行存款，注意类型的转换
            bank.BankMoney = int.Parse(txtmoney.Text);
            //注意保存的类型是“myType”型
            Profile.MyBank = bank;
            Profile.Save();
        }
        else
        {
            //如果已经存在配置，则修改
            Profile.MyBank.BankName = txtbankname.Text;
            Profile.MyBank.BankPassword = txtbankpass.Text;
            Profile.MyBank.BankMoney = int.Parse(txtmoney.Text);
        }
    }
}
