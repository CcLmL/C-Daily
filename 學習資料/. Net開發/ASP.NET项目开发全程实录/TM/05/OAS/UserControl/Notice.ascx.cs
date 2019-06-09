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

public partial class UserControl_Notice : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BaseClass bc = new BaseClass();
        DataList1.DataSource = bc.GetDataSet("select * from tb_notice order by noticeid desc", "tb_notice");
        DataList1.DataBind();
    }
}
