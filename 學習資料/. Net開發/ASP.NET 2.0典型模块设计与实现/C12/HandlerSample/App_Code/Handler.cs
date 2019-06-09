using System.Web;
using System;
public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //判断是否是本地引用，如果是则返回给客户端正确的图片
        //这里的判断就是用到了http请求中所记录的页信息
        //如果是网站，可将“localhost”修改为网站地址
        if (context.Request.UrlReferrer.Host == "localhost")
        {
            //设置客户端缓冲中文件过期时间为0，即立即过期。
            context.Response.Expires = 0;
            //清空服务器端为此会话开辟的输出缓存
            context.Response.Clear();
            //获得文件类型
            context.Response.ContentType = "image/jpg";
            //将请求文件写入到输出缓存中
            context.Response.WriteFile(context.Request.PhysicalPath);
            //将输出缓存中的信息传送到客户端
            context.Response.End();
        }
        //如果不是本地引用，则属于盗链引用，返回给客户端错误的图片
        else
        {
            //设置客户端缓冲中文件过期时间为0，即立即过期。
            context.Response.Expires = 0;
            //清空服务器端为此会话开辟的输出缓存
            context.Response.Clear();
            //获得文件类型
            context.Response.ContentType = "image/jpg";
            //将特殊的报告错误的图片文件写入到输出缓存中
            context.Response.WriteFile(context.Request.PhysicalApplicationPath + "error.jpg");
            //将输出缓存中的信息传送到客户端
            context.Response.End();
        }
    }
    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
