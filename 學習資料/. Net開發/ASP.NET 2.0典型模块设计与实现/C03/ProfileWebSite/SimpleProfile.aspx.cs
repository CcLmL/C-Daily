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

public partial class SimpleProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Profile.Name != string.Empty && Profile.ToopTip != string.Empty)
            {
                //获取个性化设置中的姓名
                Label1.Text = Profile.Name;
                //获取鼠标移动到姓名控件时的提示信息
                Label1.ToolTip = Profile.ToopTip;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //首先验证页面是否有效
        if (Page.IsValid)
        {
            // 开始个性化设置
            // 保存姓名
            Profile.Name=txtname.Text;
            //保存鼠标移动到姓名控件时的提示信息
            Profile.ToopTip = txtTooltip.Text;

        }
    }
}
