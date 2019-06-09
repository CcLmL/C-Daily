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
using System.Data.OleDb;
public partial class Manage_change : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToString();     
        string sql = "select Lock from tb_login where ID=" + id;
        OleDbDataReader odr = mydo.row(sql);
        odr.Read();
        int i = Convert.ToInt32(odr["Lock"]);
        if (i == 0)
        {            
           string   upsql = "update tb_Login set Lock=1 where ID=" + id;
            mydo.updateData(upsql);
        }
        else
        {
           string   upsql = "update tb_Login set Lock=0 where ID=" + id;
            mydo.updateData(upsql);
        }
      
        Response.Redirect("manage_user.aspx");
    }
}
