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
using System.Text;
using System.IO;

public partial class ImageUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //将图片转化为字节流
        byte[] content= FileToByte(FileUpload1.PostedFile.FileName);
        //保存字节数组到数据库
        SaveFile(content);
        //提示信息
        Response.Write("<script language='javascript'>alert('上传成功');</script>");
    }
    private byte[] FileToByte(string filePath)
    {
        //创建字节空间
        byte[] ib = new Byte[60000];
        //获取上传的图片的路径
        string strfilepath = filePath;
        //转换成文件流
        FileStream fs = new FileStream(strfilepath, FileMode.Open, FileAccess.Read);
        //将文件内容读进字节数组
        fs.Read(ib, 0, 60000);
        return ib;
    }
    private void SaveFile(byte[] content)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        // 创建参数列表
        SqlParameter parm = new SqlParameter("@content", SqlDbType.Image);

        // 设置参数的值
        parm.Value = content;
        //将参数添加到SQL命令中
        cmd.Parameters.Add(parm);

        // 创建连接字符串
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {

            // 添加SQL语句
            strSQL.Append("INSERT INTO fileimageload VALUES(@content)");
            conn.Open();
            //设置SqlCommand的属性
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();
            //执行添加语句
            cmd.ExecuteNonQuery();
            //清空参数列表
            cmd.Parameters.Clear();
        }
    }
}
