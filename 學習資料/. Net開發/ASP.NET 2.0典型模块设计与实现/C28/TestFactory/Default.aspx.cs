using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //通过工厂类返回一个名字对象
        MyName name = NameFactory.GetName(TextBox1.Text);
        //调用对象的两个方法，返回姓名
        TextBox2.Text = name.GetFname();
        TextBox3.Text = name.GetLname();
    }
}
