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

public partial class controls_AddUser : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断页面验证是否正确
        if (Page.IsValid)
        { 
            //初始化客户资料实体类
            UserInfoEntity user = new UserInfoEntity();
            //填充实体属性
            user.UserName = txtusername.Text;
            user.SoftVersion = softversion.Text;
            user.UserState = UserStateUC2.SelectValue;
            user.UserType = UserTypeUC1.SelectValue;
            user.UserGrade = UserGradeUC1.SelectValue;
            user.City = txtcity.Text;
            user.Address = txtaddress.Text;
            user.LinkMan = txtlinkman.Text;
            user.Phone = txtphone.Text;
            user.Fax = txtfax.Text;
            user.Mail = txtmail.Text;
            user.QQ = txtqq.Text;
            //先判断是否为空
            user.PeopleAmount = txtpeople.Text == "" ? 0 : int.Parse(txtpeople.Text);
            //调用添加方法
            UserInfoDA myda = new UserInfoDA();
            bool result= myda.InsertUser(user);
            //判断是否添加成功
            if (result)
                Label1.Text = "添加成功";
        }
    }
}
