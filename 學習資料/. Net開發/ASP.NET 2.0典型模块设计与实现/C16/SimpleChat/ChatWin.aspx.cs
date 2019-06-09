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

public partial class ChatWin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断如果不是页面回发
        if (Page.IsPostBack == false)
        {
            //是否存在聊天频道
            if (Request.Params["Channel"] != null)
                Session["ChatChannel"] =
                   Request.Params["Channel"].ToString();
            else
                //如果没有，默认为1
                Session["ChatChannel"] = "1";
        }
    }
    //public string GetChatPage()
    //{
    //    return ("TheChatScreenWin.aspx");
    //}
    protected void  BT_Send_Click(object sender, EventArgs e)
    {
        string sChannel = "";
        string sUser = "";
        //判断选择的频道
        if (Request.Params["Channel"] != null)
            sChannel = Request.Params["Channel"].ToString();
        else
            sChannel = "1";
        //判断登录用户
        if (Request.Params["User"] != null)
            sUser = Request.Params["User"].ToString();
        else
        {
            //如果是匿名用户
            Random pRan = new Random();
            int iNum = pRan.Next(9);
            sUser = "Annonymouse" + iNum;
        }
        //发送聊天信息
        if (TB_ToSend.Text.Length > 0)
        {
            Chat.AddMessage(sChannel,
                sUser,
                TB_ToSend.Text);
            //清空聊天文本框
            TB_ToSend.Text = "";
        }
    }
}

