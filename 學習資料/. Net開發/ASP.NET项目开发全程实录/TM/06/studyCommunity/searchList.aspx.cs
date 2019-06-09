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

public partial class searchList : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    public string pth;
    protected void Page_Load(object sender, EventArgs e)
    {
        createGV();
    }

    protected void createGV()
    {
        string sql = Session["searchSql"].ToString();
        string table = Session["table"].ToString();
        DataTable dt = mydo.rows(sql, table);
        if (dt.DefaultView.Count > 0)
        {
           
            Panel1.Visible = false;
            if (table == "tb_Video")
            {
                this.GridView1.DataSource = dt.DefaultView;
                this.GridView1.DataBind();
            }
            else
            {
                this.GridView2.DataSource = dt.DefaultView;
                this.GridView2.DataBind();
            }
        }
        else
        {
            Panel1.Visible = true;
        }

    }
}
