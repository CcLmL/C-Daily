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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //用户登陆后首先判断是否有短信息
            if (Msg.GetNewMsg(HttpContext.Current.User.Identity.Name))
            {
                HyperLink1.Text = "您有新消息";
                //如果有新消息，导航到接收消息界面
                HyperLink1.NavigateUrl = "PersonalArea/MsgRecPage.aspx";
            }
        }        
    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        //退出登录时，更新考勤时间。
        TimeSet mytime = new TimeSet();
        mytime.UpdateOffDuty(HttpContext.Current.User.Identity.Name, DateTime.Now.TimeOfDay.ToString());
    }
}
