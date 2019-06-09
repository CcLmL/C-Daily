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

public partial class ViewMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //显示聊天内容
        //用户登录时id
        int usercount=int.Parse(Session["MSGID"].ToString());
        //当前id
        int count=int.Parse(Application["MSGID"].ToString());
        //如果当前ID大于用户登录时的id，表示已经有聊天记录
        if (usercount < count)
        {
            //从数据库里提取记录并显示出来
            MsgManager mymsg = new MsgManager();
            TextBox1.Text=Session["public"] + mymsg.GetMsg(usercount);
            Session["public"] = TextBox1.Text;
            //重新记录ID号
            Session["MSGID"] = Application["MSGID"];
        }
        //私聊内容
        if(Session["chat"] != Application["chat"])
        {
            if (HttpContext.Current.User.Identity.Name == Application["owner"].ToString() || 
                HttpContext.Current.User.Identity.Name == Application["chatto"].ToString())
            {
                TextBox2.Text = Application["chat"].ToString();
                Session["chat"] = Application["chat"];
            }
        }
        else
        {
            TextBox2.Text=Session["chat"].ToString();
        }
    }
}
