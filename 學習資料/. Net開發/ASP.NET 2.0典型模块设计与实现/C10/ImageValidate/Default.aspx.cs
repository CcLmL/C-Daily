using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Drawing;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
       //Bitmap image= CreateImage(CreateValidate(4));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断服务器端的验证码是否与用户输入的相同
        if (TextBox1.Text == Session["Valid"].ToString())
        {
            //相同则提示欢迎信息
            Response.Write("<script language='javascript'>alert('欢迎光临')</script>");
        }
        else
        {
            //不相同则提示错误信息
            Response.Write("<script language='javascript'>alert('对不起，验证码错误')</script>");
        }
    }
}
