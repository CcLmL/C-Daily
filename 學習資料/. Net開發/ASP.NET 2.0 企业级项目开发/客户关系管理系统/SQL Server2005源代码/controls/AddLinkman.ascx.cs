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

public partial class controls_AddLinkman : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断页面是否验证成功
        if (Page.IsValid)
        {
            //初始化一个联系人实体类，并赋值
            LinkmanEntity linkman = new LinkmanEntity();
            linkman.CompanyName = txtcompany.Text;
            linkman.Like = txtlike.Text;
            linkman.Mail = txtmail.Text;
            linkman.Name = txtname.Text;
            linkman.Note = txtnote.Text;
            linkman.Phone = txtphone.Text;
            linkman.QQ = txtqq.Text;
            linkman.Sex = ddlsex.SelectedValue;
            linkman.Birthday = Calendar1.SelectedDate;
            //初始化实体方法
            LinkmanDA myda = new LinkmanDA();
            //调用添加方法
            bool result = myda.InsertLinkman(linkman);
            //判断添加是否成功
            if (result)
                Label1.Text = "添加成功";
        }
    }
}
