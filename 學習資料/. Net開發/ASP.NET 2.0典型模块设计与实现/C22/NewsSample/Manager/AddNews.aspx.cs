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

public partial class Manager_AddNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化新闻操作类
        NewsManager mynews = new NewsManager();
        //调用添加新闻的方法
        bool result=mynews.AddNews(txttitle.Text,txtcontent.Text,
            ddlcategory.SelectedValue,txtimageurl.Text);
        //判断添加操作的执行结果
        if (result)
            //提示成功信息
            Literal1.Text = "新闻发布成功";
    }
}
