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

using System.IO;

public partial class BaseInfo_BaseEmployeeAdd : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    static string path;   //必须设置静态变量　　才可以保存存储　上传　文件路径
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            dlDepartment.DataSource = bc.GetDataSet("select * from tb_department", "department");
            dlDepartment.DataBind();
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        string str = this.File1.PostedFile.FileName;
        if (str == "")
        {
            Response.Write(bc.MessageBox("请选择上传图片！"));
            return;
        }

        string ss = str.Substring(str.LastIndexOf("\\") + 1);
        string s = Server.MapPath("..\\photo\\" + ss);
        path = "..\\photo\\" + ss;
        if (File.Exists(s))
        {
            Response.Write(bc.MessageBox("该文件已经存在，请重新命名！！！"));
            return;
        }
        this.File1.PostedFile.SaveAs(s);
        Image1.ImageUrl = path;
    }
    protected void imgBtnSave_Click(object sender, ImageClickEventArgs e)
    {
        string str;
        str = "insert into tb_employee values('" + txtName.Text + "','" + dlSex.Text + "','" + txtBirthday.Text + "','" + txtLearn.Text + "','" + txtPost.Text + "','" + dlDepartment.Text + "','" + dlJob.Text + "','" + txtTel.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "','" + dlState.Text + "','" + path + "')";
        Boolean bl;
        bl = bc.ExecSQL(str);
        if (bl)
        {
            Response.Write(bc.MessageBox("员工基础信息添加成功"));
        }
        else
        {
            Response.Write(bc.MessageBox("员工基础信息添加失败"));
        }
    }
    protected void imgBtnClear_Click(object sender, ImageClickEventArgs e)
    {
        txtName.Text = "";
        txtBirthday.Text = "";
        txtAddress.Text = "";
        txtLearn.Text = "";
        txtPost.Text = "";
        txtTel.Text = "";
        txtEmail.Text = "";
    }
}
