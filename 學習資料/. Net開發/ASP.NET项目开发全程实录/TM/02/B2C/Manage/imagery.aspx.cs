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
using System.IO;

public partial class Manger_imagegallery : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.labIamge.Visible = false;
            dlImageBind();
        }
    }
    public void dlImageBind()
    {
        string strSql = "select * from tb_Image";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 16; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnBack.Enabled = false;//不显示最后一页
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.dlImage.DataSource = ps;
        this.dlImage.DataKeyField = dsTable.Columns[0].ToString();
        this.dlImage.DataBind();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.dlImageBind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.dlImageBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.dlImageBind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.dlImageBind();
    }
    protected void UploadImage_OnClick(object sender, EventArgs e)
    {    
        try
        {
            this.labIamge.Visible = true;
            labIamge.Text = "";
            if (imageUpload.PostedFile.FileName == "")
            {
                Response.Write(ccObj.MessageBox( "要上传的文件不允许为空！"));
                return;
            }
            else
            {
                string filePath= imageUpload.PostedFile.FileName;
                string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
                string fileEx = filePath.Substring(filePath.LastIndexOf(".") + 1);
                string serverpath = Server.MapPath(@"~\Images\ftp\") + filename;
                string relativepath = @"~\images\ftp\" + filename;
                string strSql = "select * from tb_Image where ImageName='"+filename+"'";
                DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
                if (dsTable.Rows.Count > 0)
                {
                    Response.Write(ccObj.MessageBox("该图片已存在！"));
                }
                else
                {
                    //判断图片格式
                    if (fileEx == "jpg" || fileEx == "bmp" || fileEx == "gif")
                    {
                        //生成缩略图
                        System.Drawing.Image image, newimage;
                        image = System.Drawing.Image.FromFile(filePath);
                        System.Drawing.Image.GetThumbnailImageAbort callb=null;
                        newimage = image.GetThumbnailImage(67, 90, callb, new System.IntPtr());
                        //把缩略图保存到指定的虚拟路径
                        newimage.Save(serverpath);
                        //释放image对象占用的资源
                        newimage.Dispose();
                        image.Dispose();
                        //imageUpload.PostedFile.SaveAs(serverpath);
                        //将图片的信息保存在数据库中
                        string strAddSql = "insert into tb_Image(ImageName,ImageUrl)";
                        strAddSql += "Values('" + filename + "','" + relativepath + "')";
                        SqlCommand myCmd = dbObj.GetCommandStr(strAddSql);
                        dbObj.ExecNonQuery(myCmd);
                       dlImageBind();
                        Response.Write(ccObj.MessageBox("上传成功！"));
                    }
                    else
                    {
                        Response.Write(ccObj.MessageBox("上传的图片扩展名错误！"));

                    }
                   
                }
               
            }
        
        }
        catch (Exception error)
        {
            labIamge.Text = "处理发生错误！原因：" + error.ToString();
        }

    }
    protected void dlImage_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string strSql = "select ImageName from tb_Image where ImageID="+Convert.ToInt32(e.CommandArgument.ToString());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        //删除指定文件的图片
        string strFilePath = Server.MapPath(@"~\Images\ftp\") + dsTable.Rows[0][0].ToString();
        File.Delete(strFilePath);
        //删除数据库中的图片
        string strDeleteSql = "delete from tb_Image where ImageID=" + Convert.ToInt32(e.CommandArgument.ToString());
        SqlCommand myCmd = dbObj.GetCommandStr(strDeleteSql);
        dbObj.ExecNonQuery(myCmd);
        dlImageBind();
        Response.Write(ccObj.MessageBox("删除成功！"));     
    }
}
