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

public partial class PageDependency : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取当前时间
        Literal1.Text = DateTime.Now.ToString();
        //判断是否已经有缓存时间
        if (Cache["LastAccess"] != null)
        {
            //获取当初的缓存时间
            Literal2.Text = Cache["LastAccess"].ToString();
        }



        //System.Web.Caching.SqlCacheDependencyAdmin.EnableTableForNotifications(System.Configuration.ConfigurationManager.ConnectionStrings["AdventureWorksConnectionString"].ConnectionString, "Location");

    }
    protected void SqlDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //当重新获取数据时，显示当前时间
        Literal2.Text = DateTime.Now.ToString();
        //进行时间戳的缓存
        Cache["LastAccess"] = System.DateTime.Now.ToString();
    }
}
