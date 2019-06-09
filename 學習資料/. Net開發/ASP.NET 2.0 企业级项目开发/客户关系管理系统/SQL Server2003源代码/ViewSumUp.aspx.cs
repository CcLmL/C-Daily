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

public partial class ViewSumUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化服务类
        UserService service = new UserService();
        //为GridView绑定数据
        GridView1.DataSource = service.GetSumUpData(txtname.Text);
        GridView1.DataBind();

    }
}
