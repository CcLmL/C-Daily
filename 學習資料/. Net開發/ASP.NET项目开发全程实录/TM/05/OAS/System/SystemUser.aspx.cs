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

public partial class System_SystemUser : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            //绑定职员姓名
            dlEmployee.DataSource = bc.GetDataSet("select * from tb_employee", "tb_employee");
            dlEmployee.DataTextField = "name";
            dlEmployee.DataValueField = "name";
            dlEmployee.DataBind();
            //绑定系统操作员姓名
            DataSet ds = bc.GetDataSet("select * from tb_sysUser", "sysUser");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row)  //将检索到的数据逐一,循环添加到Listbox1中
            {
                ListBox1.Items.Add(new ListItem(rs["userName"].ToString(), rs["userName"].ToString(),true));
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判断该系统用户名是否存在,如果存在将不允许创建,否则设置系统用户
        DataSet ds = bc.GetDataSet("Select * from tb_sysUser where userName='" + dlEmployee.Text + "'", "tb_sysUser");
        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Write(bc.MessageBox("该用户已经被设置为系统用户！"));
            return;
        }
        else
        {
            //添加系统用户
            bc.ExecSQL("INSERT INTO tb_sysUser (userName, userPwd, loginTime, system) values('" + dlEmployee.Text + "','" + TextBox1.Text + "','','0')");
            ListBox1.DataBind();
        }

        Response.Redirect("SystemUser.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (ListBox1.Text=="")
            return;
        //删除系统用户,当前用户不能删除
        if (ListBox1.SelectedItem.Text.ToUpper() == Session["loginName"].ToString().ToUpper())
        {
            Response.Write(bc.MessageBox("当前使用的用户不能删除！"));
        }
        else
        {
            //删除系统操作员后,重新定向到本页
            bc.ExecSQL("DELETE FROM tb_sysUser WHERE(userName = '" + ListBox1.SelectedItem.Text + "')");
            Response.Redirect("SystemUser.aspx");
        }
    }
}
