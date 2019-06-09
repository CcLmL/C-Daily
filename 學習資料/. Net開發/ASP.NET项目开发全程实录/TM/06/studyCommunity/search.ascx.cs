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

public partial class search : System.Web.UI.UserControl
{

    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindLanguage();
        }
    }

    protected void bindLanguage()
    {
        string sql = "select * from tb_Type  ";
        this.ddlLanguage.DataSource = mydo.rows(sql, "tb_Type").DefaultView;
        this.ddlLanguage.DataBind();
    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string table = this.ddlType.SelectedValue.ToString();
        string type = this.ddlLanguage.SelectedValue.ToString();
        string tkey = this.txtKey.Text;
        string sql;

        if (table == "tb_Video")
        {
            sql = "select * from tb_Video where VideoType=" + type + " and VideoName like '%" + tkey + "%'";
        }
        else
        {
            sql = "select * from tb_Sound where SoundType=" + type + " and SoundName like '%" + tkey + "%'";
        }
        Session["searchSql"] = sql;
        Session["table"] = table;
        Response.Redirect("searchList.aspx");
    }
}
