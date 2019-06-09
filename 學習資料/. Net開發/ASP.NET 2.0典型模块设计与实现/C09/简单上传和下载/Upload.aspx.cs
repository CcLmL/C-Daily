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

public partial class Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //测试文件类型是否符合的变量
        Boolean fileOK = false;
        //设置服务器中保存文件的路径
        String path = Server.MapPath("~/UploadFiles/");
        //判断是否选择了文件
        if (FileUpload1.HasFile)
        {
            //返回文件的扩展名
            String fileExtension =
                System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //设置限定的文件类型
            String[] allowedExtensions = 
            { ".txt", ".doc", ".xml", ".jpg" };
            //判断用户选择的文件类型是否受限
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
        }
        //如果文件大于1M，则不允许上传
        if (FileUpload1.PostedFile.ContentLength > 1024000)
        {
            fileOK = false;
        }
        //如果文件类型符合
        if (fileOK)
        {
            try
            {
                // 将文件保存到指定的文件夹下
                FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                Label1.Text = "文件上传成功！";
            }
            catch 
            {
                Label1.Text = "无法实现文件的上传。";
            }
        }
        else
        {
            Label1.Text = "文件类型不对或文件超出1M。";
        }
    }
}
