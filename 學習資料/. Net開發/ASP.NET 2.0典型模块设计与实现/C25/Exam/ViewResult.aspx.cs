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

public partial class ViewResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取保存的对比答案
        ArrayList mylist = (ArrayList)Session["list"];
        //判断是否有答案
        if(mylist.Count>0)
        {
            //遍历每个答案
            for (int i=0;i<mylist.Count-1;i++)
            {
                //输出结果
                Response.Write("第" +i +"题" + "  " +mylist[i].ToString() );
            }
        }
    }
}
