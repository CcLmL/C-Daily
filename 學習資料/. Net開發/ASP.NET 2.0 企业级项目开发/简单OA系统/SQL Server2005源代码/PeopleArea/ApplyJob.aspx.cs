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

public partial class PeopleArea_ApplyJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //申报空缺
        Job myjob = new Job();
        myjob.SaveApply(int.Parse(DropDownList1.SelectedValue),txtjob.Text,int.Parse(txtamount.Text),txtrequire.Text,txtnote.Text);
        //提示信息
        Response.Write("<script language='javascript'>alert('提交成功')</script>");
    }
}
