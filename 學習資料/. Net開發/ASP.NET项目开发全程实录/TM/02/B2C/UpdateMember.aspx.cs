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
using System.Text.RegularExpressions;

public partial class UpdateMember : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    UserClass ucObj = new UserClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //通过用户的ID代号，获取用户信息
            if (Session["UserID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                DataTable dsTable = ucObj.GetUserInfo(Convert.ToInt32(Session["UserID"].ToString()));
                this.txtName.Text = dsTable.Rows[0]["UserName"].ToString();    //用户姓名
                this.txtPassword.Text = dsTable.Rows[0]["Password"].ToString();//用户密码
                this.txtTrueName.Text = dsTable.Rows[0]["RealName"].ToString();//用户真实姓名
                this.ddlSex.SelectedIndex = Convert.ToInt32(dsTable.Rows[0]["Sex"]);//用户性别
                this.txtPhone.Text = dsTable.Rows[0]["Phonecode"].ToString();  //用户电话号码
                this.txtEmail.Text = dsTable.Rows[0]["Email"].ToString();      //用户Email
                this.txtAddress.Text = dsTable.Rows[0]["Address"].ToString();  //用户详细地址
                this.txtPostCode.Text = dsTable.Rows[0]["PostCode"].ToString(); //用户邮编

            }
        }     
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        //确保用户输入必要信息
        if (this.txtName.Text.Trim() == "" && this.txtPassword.Text.Trim() == "" && this.txtTrueName.Text.Trim() == "" && this.txtPhone.Text.Trim() == "" && this.txtEmail.Text.Trim() == "" && this.txtAddress.Text.Trim() == "" && this.txtPostCode.Text.Trim() == "")
        {
            Response.Write(ccObj.MessageBoxPage("请输入完整信息！"));
        }
        else
        {
            if (IsValidPostCode(txtPostCode.Text.Trim()) == false)
            {//验证邮编输入是否正确
                Response.Write(ccObj.MessageBoxPage("您的邮编输入有误！"));
                return;
            }
            else if (IsValidPhone(txtPhone.Text.Trim()) == false)
            {//验证电话号码输入是否正确
                Response.Write(ccObj.MessageBoxPage("您输入的电话号码有误，请重新输入"));
                return;
            }
            else if (IsValidEmail(txtEmail.Text.Trim()) == false)
            {//验证E-mail输入是否正确
                Response.Write(ccObj.MessageBoxPage("您输入的E-mail地址格式不正确，请重新输入！"));
                return;
            }
            else
            {//更新用户信息表tb_Member
                ucObj.MedifyUser(txtName.Text.Trim(), txtPassword.Text.Trim(), txtTrueName.Text.Trim(), transfer(ddlSex.SelectedItem.Text.Trim()),txtPhone.Text.Trim(), txtEmail.Text.Trim(), txtAddress.Text.Trim(), txtPostCode.Text.Trim(), Convert.ToInt32(Session["UserID"].ToString()));
                Session["Username"] = "";
                Session["Username"] = txtName.Text.Trim();
                Response.Write(ccObj.MessageBox("恭喜您，修改成功！", "Default.aspx"));
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
        if (strValue == "男")
        {
            return true;
        }
        else
        {
            return false;

        }
    }
    
   //判断修改的数据是否为有效的数据
    public bool IsValidPostCode( string num)
    {
      return Regex.IsMatch(num, @"\d{6}");

    }
    public bool IsValidPhone( string num)
    {
      return Regex.IsMatch(num, @"(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$");
    }
    public bool IsValidEmail( string num)
    {
      return Regex.IsMatch(num, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        this.txtName.Text = "";    //用户姓名
        this.txtPassword.Text = "";//用户密码
        this.txtTrueName.Text = "";//用户电话号码
        this.txtPhone.Text = "";   //用户电话号码
        this.txtPostCode.Text = "";//用户邮编
        this.txtEmail.Text = "";   //用户Email
        this.txtAddress.Text = ""; //用户详细地址
    }
}
