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

public partial class controls_InsertMemberUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        //首先要判断页面验证是否成功
        if (Page.IsValid)
        {
            //实例化会员信息实体
            MemberInfoEntity myinfo = new MemberInfoEntity();

            //为会员信息实体的属性赋值
            myinfo.CustName = txtname.Text;
            myinfo.CustIdentity = txtidentity.Text;
            myinfo.CustPhone = txtphone.Text;
            myinfo.CustAdress = txtaddress.Text;
            myinfo.CardNum = txtcardnum.Text;
            //调用CardTypeDA的静态方法获取会员卡ID
            myinfo.CardID = CardTypeDA.GetCardID(ddlcardtype.SelectedValue);
            //取当前日期为办卡日期
            myinfo.CardDate = DateTime.Now;

            MemberInfoDA myda = new MemberInfoDA();
            bool result = myda.InsertMemberInfo(myinfo);
            //如果成功，提示信息。
            if (result)
                Label7.Text = "添加成功";
        }
    }
}
