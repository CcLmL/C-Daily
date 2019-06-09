<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Configuration;

public class Handler : IHttpHandler {
    
    public bool IsReusable {
        get
        {
            return true;
        }
    }
    public void ProcessRequest(HttpContext context) {
        // 设置输出的类型
        context.Response.ContentType = "image/jpeg";
        context.Response.Cache.SetCacheability(HttpCacheability.Public);
        context.Response.BufferOutput = false;
        //图片的ID
        int photoId = -1;
        Stream stream = null;
        //判断图片是否为空
        if (context.Request.QueryString["PhotoID"] != null &&
            context.Request.QueryString["PhotoID"] != "")
        {
            //获取图片的ID
            photoId = Convert.ToInt32(context.Request.QueryString["PhotoID"]);
            //获取图片的数据流
            stream = GetPhoto(photoId);
        }
        //定义字节缓存空间
        const int buffersize = 1024 * 16;
        byte[] buffer = new byte[buffersize];
        int count = stream.Read(buffer, 0, buffersize);
        while (count > 0) {
            context.Response.OutputStream.Write(buffer, 0, count);
            count = stream.Read(buffer, 0, buffersize);
        }
    }

    public Stream GetPhoto(int photoId)
    {
        //打开数据库连接，获取图像内容
        SqlConnection myConnection = new SqlConnection(
            ConfigurationManager.ConnectionStrings["FileImageConnectionString"].ConnectionString);
        SqlCommand myCommand = new SqlCommand
            ("SELECT [Content] FROM [FileImageLoad] WHERE [FileID]=@PhotoID",
            myConnection);
        myCommand.CommandType = CommandType.Text;
        myCommand.Parameters.Add(new SqlParameter("@PhotoID", photoId));
        myConnection.Open();
        object result = myCommand.ExecuteScalar();
        
        try 
        {
            //返回字节流
            return new MemoryStream((byte[])result);
        }
        catch (ArgumentNullException e)
        {
            return null;
        }
        finally 
        {
            //关闭连接
            myConnection.Close();
        }
    }
}