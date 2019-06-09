using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    Operation operation = new Operation();  //声明网站业务类对象
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)  //!IsPostBack避免重复刷新加载页面
        {
            //获取前6条分类供求信息
            dlZP.DataSource = operation.SelectLeaguerInfo(true, "招聘信息", 6);
            dlZP.DataBind();
            dlPX.DataSource = operation.SelectLeaguerInfo(true, "培训信息", 6);
            dlPX.DataBind();
            dlGY.DataSource = operation.SelectLeaguerInfo(true, "公寓信息", 6);
            dlGY.DataBind();
            dlJJ.DataSource = operation.SelectLeaguerInfo(true, "家教信息", 6);
            dlJJ.DataBind();
            dlWPQG.DataSource = operation.SelectLeaguerInfo(true, "物品求购", 6);
            dlWPQG.DataBind();
            dlWPCS.DataSource = operation.SelectLeaguerInfo(true, "物品出售", 6);
            dlWPCS.DataBind();
            dlQDCD.DataSource = operation.SelectLeaguerInfo(true, "求兑出兑", 6);
            dlQDCD.DataBind();
            dlCL.DataSource = operation.SelectLeaguerInfo(true, "车辆信息", 6);
            dlCL.DataBind();
        }
    }
}
