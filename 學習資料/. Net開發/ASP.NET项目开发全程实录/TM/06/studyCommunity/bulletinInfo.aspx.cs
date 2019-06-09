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

public partial class bulletinInfo : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    public string Content;
    public string date;
    public string ClickSum;
    public string Name;
    public DataSet ds;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        createCon();
       
    }
    protected void createCon()
    {           
        try
        {
            string sql = "select * from tb_Bulletin where ID=" + Request.QueryString["ID"];
            OleDbDataReader odr = mydo.row(sql);
            odr.Read();           
            lbTitle.InnerText = odr["Title"].ToString(); 
            Content = odr["Content"].ToString();
            this.labDate.Text = Convert.ToDateTime(odr["Date"]).ToLongDateString();
            
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }       
    }
   
}
