using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.IO;
using System.Net;


/// <summary>
/// MyWeather 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MyWeather : System.Web.Services.WebService {

    public MyWeather () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }

    //[WebMethod]
    //public string HelloWorld() {
    //    return "Hello World";
    //}
    [WebMethod]
    public string GetWeather(string city)
    {
        string weacherhtml = String.Empty;
        //转换输入参数的编码类型
        string mycity = System.Web.HttpUtility.UrlEncode(city, System.Text.UnicodeEncoding.GetEncoding("GB2312"));
        //初始化新的 WebRequest
        HttpWebRequest webrt = (HttpWebRequest)WebRequest.Create("http://php.weather.sina.com.cn/search.php?city=" + mycity);
        //返回对 Internet 请求的响应。
        HttpWebResponse webrs = (HttpWebResponse)webrt.GetResponse();
        //从 Internet 资源返回数据流。
        Stream stream = webrs.GetResponseStream();

        //读取数据流
        StreamReader srm = new StreamReader(stream, System.Text.Encoding.Default);
        //从头读到尾，把数据读到weacherhtml中
        weacherhtml = srm.ReadToEnd();
        //关闭打开的资源
        srm.Close();
        stream.Close();
        webrs.Close();
        //针对不同的网站，以下开始部分和结束部分不同。
        //可通过查看网站的源文件解决。
        int start = weacherhtml.IndexOf("城市天气 begin");
        int end = weacherhtml.IndexOf("城市天气 end");
        //返回一个HTML的Table,预报城市天气
        return weacherhtml.Substring(start + 14, end - start);
    }

}

