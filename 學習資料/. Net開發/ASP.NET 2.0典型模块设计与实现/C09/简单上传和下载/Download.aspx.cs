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

public partial class Download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取共享的文件列表
        
        //获取存放文件的目录
        string directoryPath = Server.MapPath("~/UploadFiles/");
        //创建目录对象
        DirectoryInfo dir = new DirectoryInfo(directoryPath);
        //获取目录下的所有文件
        FileSystemInfo[] infos = dir.GetFileSystemInfos();
         ListItem myitem;
        //遍历文件集合，将所有的文件用listbox显示
        foreach (FileSystemInfo myfile in infos)
        {
            //创建一个listitem新项
            myitem = new ListItem();
            myitem.Text = myfile.Name;
            //包含完整路径的名称
            myitem.Value = myfile.FullName;
            //添加到列表中
            ListBox1.Items.Add(myitem);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //定义选中的文件的全名
        string SelectName = ListBox1.SelectedItem.Value;
        //获取文件的名字
        string saveFileName = ListBox1.SelectedItem.Text;
        //创建一个文件实体，方便对文件操作
        FileInfo finfo = new FileInfo(SelectName);
        //清空输出流
        Response.Clear();
        Response.Charset = "utf-8";
        Response.Buffer = true;
        //关闭ViewState以提高速度
        this.EnableViewState = false;
        //定义输出文件编码及类型和文件名
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        Response.AppendHeader("Content-Disposition", "attachment;filename=" + saveFileName);
        //因为保存的文件类型不限，此处类型选择“unknown”。
        Response.ContentType = "application/unknown"; ;
        Response.WriteFile(SelectName);
        //清空并关闭输出流
        Response.Flush();
        Response.Close();
        Response.End();
    }
}
