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

public partial class PostMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //如果用户选择了私聊
        if(CheckBox1.Checked)
        {
            //清空信息
            Session["chat"]="";
            //发言的内容
            Application["chat"]=  HttpContext.Current.User.Identity.Name
             + " 悄悄地对 " + DropDownList1.SelectedValue +" 说: " + TextBox1.Text 
                 +DateTime.Now.TimeOfDay;
            //发言所对的目标用户
            Application["chatto"]=DropDownList1.SelectedValue;
            //发言用户
            Application["owner"]=HttpContext.Current.User.Identity.Name;
        }
        else
        {
            //如果不是私聊，在数据库中增加一条聊天记录
            //取各字段的内容
            string FromName=HttpContext.Current.User.Identity.Name;
            string ToName=DropDownList1.SelectedValue;
            DateTime PostTime=DateTime.Now.ToLocalTime();
            string ContentData=TextBox1.Text;
            //声称一个消息管理对象
            MsgManager mymsg = new MsgManager();
            //调用方法添加发言内容
            mymsg.AddMsg(FromName, ToName, ContentData, PostTime);
            //获取最大的ID
            Application["MSGID"] = mymsg.GetMsgID();
        }
    }
}
