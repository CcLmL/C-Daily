using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Bestcomy.Web.Controls.Upload;
using System.IO;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取上传文件保存的路径
        string fpath = Path.Combine(Request.PhysicalApplicationPath, "UpFiles");
        //如果路径不存在，则创建
        if (!Directory.Exists(fpath))
            Directory.CreateDirectory(fpath);
        //创建一个上传对象
        AspnetUpload upldr = new AspnetUpload();
        //设置上传文件夹
        upldr.set_UploadFolder(fpath);
    }
    protected void btn_upload_Click(object sender, EventArgs e)
    {
        string fpath = Path.Combine(Request.PhysicalApplicationPath, "UpFiles");
        //获取界面内的上传组件
        UploadFileCollection files = AspnetUpload.GetUploadFiles("File1");
        //遍历上传组件
        foreach (UploadFile file in files)
        {
            //判断上传组件内是否已有文件
            if (file != null)
                file.SaveAs(Path.Combine(fpath, Path.GetFileName(file.get_FileName())));
        }
    }
}
