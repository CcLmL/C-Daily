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
using mylocalhost;
public partial class WeatherTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化天气服务类
        MyWeather  myweather = new MyWeather();
        //调用天气服务类中定义的Web服务方法
        //注意传递的参数是城市名称
        Label1.Text = myweather.GetWeather(TextBox1.Text);

    }
}
