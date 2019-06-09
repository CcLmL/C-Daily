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

public partial class ShareArea_FileUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //获取文件在服务器上的保存路径
        String path = Server.MapPath("~/FileManager/");
        //上传前先判断用户是否已经选择了文件
        if (FileUpload1.HasFile) 
        {
            //判断文件大小是否大于10M
            if (FileUpload1.FileBytes.Length > 10000)
                Response.Write("<script language='javascript'>alert('文件超过1M，请重新选择!')</script>");
            else
            {
                try
                {
                    //调用SaveAs方法保存文件到指定的路径下
                    FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                    Response.Write("<script language='javascript'>alert('上传成功!')</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script language='javascript'>alert('上传过程中出现错误，请检查文件!')</script>");
                }
            }
        }
        else
        {
            //没有选择文件，提示信息
            Response.Write("<script language='javascript'>alert('对不起，请选择要上传的文件!')</script>");
        }
    }
}
