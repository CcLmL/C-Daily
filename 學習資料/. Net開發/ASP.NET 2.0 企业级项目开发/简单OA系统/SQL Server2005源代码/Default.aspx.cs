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
        if (!IsPostBack)
        {
            //显示日期
            lbldate.Text = DateTime.Now.Date.ToShortDateString();
            //显示上班时间
            lbltime.Text = DateTime.Now.TimeOfDay.ToString();
            //将上班时间记录到数据库
            TimeSet mytime = new TimeSet();
            mytime.InsertOnDuty(HttpContext.Current.User.Identity.Name, DateTime.Now.TimeOfDay.ToString());
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
}
