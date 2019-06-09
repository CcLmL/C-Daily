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

public partial class IPStat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化一个iP数据访问对象
        IPControl cont = new IPControl();
        //获取今天访问量
        iptoday.Text = cont.GetToday();
        //获取总访问量
        iptotal.Text = cont.GetTotal();
        //获取昨天访问量
        ipyesterday.Text = cont.GetYesterday();
        //获取本月访问量
        ipmonth.Text = cont.GetMonth();

        //目前本网页的访问量
        //注意变量的类型转换
        Literal1.Text = Application["StatCount"].ToString();
        //使用Membership类的静态方法获取在线人数
        Literal2.Text = Membership.GetNumberOfUsersOnline().ToString();
    }
}
