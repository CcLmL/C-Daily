using System;
using System.Web;

/// <summary>
/// 处理HTTP请求中的文件下载
/// </summary>
public class FileHandler : IHttpHandler
{

    /// <summary>
    /// 执行特殊请求的处理
    /// </summary>
    /// <param name="context">请求的上下文</param>
    public void ProcessRequest(HttpContext context)
    {
        //如果本网站，可直接下载
        if (context.Request.UrlReferrer.Host == "www.google.com")
        {
            //允许用户直接下载，不做任何操作
        }
        //如果是其他网站，先将页面导航到指定的下载界面，用户再选择下载
        else
        {
            //将请求转到特殊处理页，以实现下载功能
            HttpResponse response = context.Response;
            response.Redirect(context.Request.PhysicalApplicationPath+"Download.aspx");
        }
    }
    //返回是否执行此处理程序
    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}