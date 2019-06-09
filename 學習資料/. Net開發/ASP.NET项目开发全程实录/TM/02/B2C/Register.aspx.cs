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
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    UserClass ucObj = new UserClass();
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //判断是否输入必要的信息
        if (this.txtPostCode.Text.Trim() == "" && this.txtPhone.Text.Trim()=="" && this.txtEmail.Text.Trim() == "")
        {
            Response.Write(ccObj.MessageBoxPage("请输入必要的信息！"));
        }
        else
        {
            //将用户输入的信息插入到用户表tb_Member中
            int IntReturnValue=ucObj.AddUser(txtName.Text.Trim(),txtPassword.Text.Trim(),txtTrueName.Text.Trim(), transfer(this.ddlSex.SelectedItem.Text),txtPhone.Text.Trim(),txtEmail.Text.Trim(),txtAddress.Text.Trim(), txtPostCode.Text.Trim());
            if (IntReturnValue == 100)
            {
                Response.Write(ccObj.MessageBox("恭喜您，注册成功！", "Default.aspx"));
            }
            else
            {
                Response.Write(ccObj.MessageBox("注册失败，该名字已存在！"));
            
            }
           
        }

    }
    /// <summary>
    ///  将性别转化为Bool值
    /// </summary>
    /// <param name="strValue">需要转化的性别值</param>
    /// <returns>返回转化后的性别值</returns>
    protected bool transfer(string strValue)
    {
        if (strValue== "男")
        {
            return true;
        }
        else
        {
            return false;
        
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        this.txtName.Text = "";     //用户名
        this.txtPassword.Text = ""; //用户密码
        this.txtTrueName.Text = ""; //用户真实姓名
        this.txtPhone.Text = "";    //用户电话号码
        this.txtPostCode.Text = ""; //邮政编码
        this.txtEmail.Text = "";    //Email
        this.txtAddress.Text = "";  //详细地址
    }
}
