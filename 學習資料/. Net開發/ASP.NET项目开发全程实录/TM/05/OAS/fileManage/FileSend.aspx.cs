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

public partial class fileManage_FileSend : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    static string path;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)   //判断是否非法登录
        {
            //如果非法登录，直接跳转到主页。
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            //绑定文件接收人，均为企业员工
            ddlName.DataSource = bc.GetDataSet("select * from tb_employee", "tb_employee");
            ddlName.DataTextField = "name";
            ddlName.DataValueField = "name";
            ddlName.DataBind();
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        //将附件路径
        string str = this.FileUpload1.PostedFile.FileName;
        //判断附件不能为空！
        if (str == string.Empty)
        {
            Response.Write(bc.MessageBox("上传文件不能为空！"));
            return;
        }
        //获取附件名称 
        string fileName = str.Substring(str.LastIndexOf("\\") + 1);
        path = "..\\file\\" + fileName;                         //设置附件上传到的服务器路径
        FileInfo fileInfo = new FileInfo(str);                  //获取文件信息
        long fileSize = (fileInfo.Length / 1024) / 1024;        //获取文件大小
        if (fileSize > 10)                                      //控制文件大小不能超过10M
        {
            Response.Write(bc.MessageBox("文件大小不能超过10M ！"));
            return;                                             //不能继续执行
        }
        //上传送文件的相关信息保存到服务器中
        bool bl = bc.ExecSQL("INSERT INTO tb_file (fileSender, fileAccepter, fileTitle, fileTime, fileContent, path,examine,fileName) VALUES('" + Convert.ToString(Session["loginName"]) + "','" + ddlName.Text + "','" + txtTitle.Text + "','" + DateTime.Today.ToString() + "','" + txtContent.Text + "','" + path + "','未接收','" + fileName + "')");
        if (bl)
        {
            Response.Write(bc.MessageBox("文件传送成功！"));
        }
        else
        {
            Response.Write(bc.MessageBox("网络故障，文件传送失败！"));
            return;
        }
        this.FileUpload1.PostedFile.SaveAs(Server.MapPath(path));         //将文件保存到服务器上
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtTitle.Text = "";
        txtContent.Text = "";
    }
}
