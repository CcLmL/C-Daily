using System;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Net;
using System.IO;

/// <summary>
/// Train 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Train : System.Web.Services.WebService {

    public Train () {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }
    
    [WebMethod]
    public string GetTrain(string car)
    {
        string weacherhtml = String.Empty;
        //初始化新的 WebRequest
        HttpWebRequest webrt = (HttpWebRequest)WebRequest.Create("http://www.zuohuoche.com/cha.php?type=cc&ch=utf-8&checi=" +car);
        //返回对 Internet 请求的响应。
        HttpWebResponse webrs = (HttpWebResponse)webrt.GetResponse();
        //从 Internet 资源返回数据流。
        Stream stream = webrs.GetResponseStream();
        
        //读取数据流
        StreamReader srm = new StreamReader(stream, System.Text.Encoding.UTF8);
        //从头读到尾，把数据读到weacherhtml中
        weacherhtml = srm.ReadToEnd();
        //关闭打开的资源
        srm.Close();
        stream.Close();
        webrs.Close();
        //针对不同的网站，以下开始部分和结束部分不同。
        //可通过查看网站的源文件解决。
        int start = weacherhtml.IndexOf("<table");
        int end = weacherhtml.IndexOf("</table>");
        //返回一个HTML的Table,预报城市天气
        return weacherhtml.Substring(start, end - start);
    }
}

