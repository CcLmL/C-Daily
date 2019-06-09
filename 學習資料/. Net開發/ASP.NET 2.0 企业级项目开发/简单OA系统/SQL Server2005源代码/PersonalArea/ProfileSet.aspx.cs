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
using System.Drawing;

public partial class PersonalArea_ProfileSet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //网格线的设置
        switch(ddlline.SelectedValue)
        {
            case "None":
                Profile.GridLine = GridLines.None;
                break;
            case "Both":
                Profile.GridLine = GridLines.Both;
                break;
            case "Vertical":
                Profile.GridLine = GridLines.Vertical;
                break;
            case "Horizontal":
                Profile.GridLine = GridLines.Horizontal;
                break;
        }
        //网格操作的设置
        Profile.EditSet.EnableEdit = chkedit.Checked;
        Profile.EditSet.EnableDelete = chkdelete.Checked;
        Profile.EditSet.EnableSelect = chkselect.Checked;

    }
}
