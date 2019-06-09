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

public partial class manageEntry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string name = this.txtName.Text;
        string pass = this.txtPass.Text;
        if (name == "Tsoft" && pass == "111")
        {
            Session["ManageUser"] = "Tsoft";
            Response.Redirect("Manage/manageIndex.aspx");
        }
    }
}
