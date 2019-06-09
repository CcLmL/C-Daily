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
        //非页面回发时，才生成随机数
        if (!Page.IsPostBack)
        {
            //获取随机数
            string val = getValidate();
            //显示随机数
            Label1.Text = val;
        }
    }
    /// <summary>
    /// 随机生成4位数的方法
    /// </summary>
    /// <returns>返回4位随机数</returns>
    public string getValidate()
    {
        string strchar = "0,1,2,3,4,5,6,7,8,9" ;
        string[] VcArray = strchar.Split(',') ;
        string  VNum = "" ;
        //记录上次随机数值，尽量避免产生几个一样的随机数
        int temp = -1 ;    
        //采用一个简单的算法以保证生成随机数的不同
        Random rand =new Random();
        for ( int i = 1 ; i < 5 ; i++ ) 
        {    
            if ( temp != -1) 
            {
                rand =new Random(i*temp*unchecked((int)DateTime.Now.Ticks));
            }    
            int t=rand.Next(10);
            temp = t  ;
            VNum += VcArray[t];
        }
        Session["Valid"] = VNum;
        return VNum ;//返回生成的随机数
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
