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
using localhost;
public partial class ShareArea_Weather : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            GetCityWeather();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GetCityWeather();
    }
    private void GetCityWeather()
    {
        Weather myweather = new Weather();
       Label1.Text = myweather.GetWeather(TextBox1.Text);
    }
}
