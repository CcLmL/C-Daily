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

public partial class UserControl_InfoSearch : System.Web.UI.UserControl
{
    static string infoType = "";   　　　　//信息类型
    Operation operation = new Operation();

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["key"] = txtKey.Text;
        if (Page.Title.Length == 5)                 //主页中查询
        {
            infoType = "招聘信息";
            Response.Redirect("ShowPage/webZP.aspx");
            return;
        }
        else
        {
            infoType = Page.Title.Substring(7, 4);
        }
        
        switch (infoType)                           //分页中信息查询
        {
            case "招聘信息":
                Response.Redirect("../ShowPage/webZP.aspx");
                break;
            case "求职信息":
                Response.Redirect("../ShowPage/webQZ.aspx");
                break;
            case "培训信息":
                Response.Redirect("../ShowPage/webPX.aspx");
                break;
            case "公寓信息":
                Response.Redirect("../ShowPage/webGY.aspx");
                break;
            case "家教信息":
                Response.Redirect("../ShowPage/webJJ.aspx");
                break;
            case "物品求购":
                Response.Redirect("../ShowPage/webWPQG.aspx");
                break;
            case "物品出售":
                Response.Redirect("../ShowPage/webWPCS.aspx");
                break;
            case "求兑出兑":
                Response.Redirect("../ShowPage/webQDCD.aspx");
                break;
            case "车辆信息":
                Response.Redirect("../ShowPage/webCL.aspx");
                break;
            case "寻求合作":
                Response.Redirect("../ShowPage/webXQHZ.aspx");
                break;
            case "企业广告":
                Response.Redirect("../ShowPage/webQYGG.aspx");
                break;
        }
    }
}
