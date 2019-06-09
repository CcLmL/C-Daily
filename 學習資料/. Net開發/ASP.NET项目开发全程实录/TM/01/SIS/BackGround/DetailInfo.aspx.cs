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

public partial class BackGround_DetailInfo : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.QueryString["id"].ToString() + "   " + Request.QueryString["type"].ToString());
        DataSet ds = operation.SelectInfo(Request.QueryString["type"].ToString(), Convert.ToInt32(Request.QueryString["id"].ToString()));
        txtType.Text = ds.Tables[0].Rows[0][1].ToString();
        txtTitle.Text = ds.Tables[0].Rows[0][2].ToString();
        txtInfo.Text = ds.Tables[0].Rows[0][3].ToString();
        txtLinkMan.Text = ds.Tables[0].Rows[0][4].ToString();
        txtTel.Text = ds.Tables[0].Rows[0][5].ToString();
    }
}
