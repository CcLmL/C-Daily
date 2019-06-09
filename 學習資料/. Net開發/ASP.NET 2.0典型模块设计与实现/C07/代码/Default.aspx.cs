using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Specialized;
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Net;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //支付宝的网关
        string alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?";
        //用户注册支付宝时生成的校验码（必须填写自己的）
        string key = "xxxxxxx"; 
        //页面编码格式
        string _input_charset = "utf-8";
        //用户注册支付宝时生成的合作伙伴id（必须填写自己的）
        string partner = "xxxxxx";

        alipayNotifyURL = alipayNotifyURL + "service=create_digital_goods_trade_p" + "&partner=" + partner + "&notify_id=" + Request.QueryString["notify_id"];
        
        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
        string responseTxt = Get_Http(alipayNotifyURL, 120000);
        int i;
        NameValueCollection coll;
        //在集合中装载返回信息
        coll = Request.QueryString;

        // 将所有的键值保存在数组中
        String[] requestarr = coll.AllKeys;
        //进行排序
        string[] Sortedstr = BubbleSort(requestarr);
        for (i = 0; i < Sortedstr.Length; i++)
        {
            Response.Write("Form: " + Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]] + "<br>");
        }

        //构造待md5摘要字符串
        StringBuilder prestr = new StringBuilder();
        for (i = 0; i < Sortedstr.Length; i++)
        {
            if (Request.Form[Sortedstr[i]] != "" && Sortedstr[i] != "sign" && Sortedstr[i] != "sign_type")
            {
                if (i == Sortedstr.Length - 1)
                {
                    prestr.Append(Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]]);
                }
                else
                {
                    prestr.Append(Sortedstr[i] + "=" + Request.QueryString[Sortedstr[i]] + "&");

                }
            }
        }
        prestr.Append(key);
        //生成Md5摘要
        string mysign = GetMD5(prestr.ToString(), _input_charset);
        string sign = Request.QueryString["sign"];
        //测试返回的结果
        //  Response.Write(prestr.ToString());  
        //验证支付发过来的消息，签名是否正确
        if (mysign == sign && responseTxt == "true")   
        {
            //此时可以更新网站的数据,比如商品的减少等等。
            Response.Write("success");     //返回给支付宝消息，成功
        }
        else
        {
            // Response.Write("------------------------------------------");
            // Response.Write("<br>Result:responseTxt=" + responseTxt);
            // Response.Write("<br>Result:mysign=" + mysign);
            // Response.Write("<br>Result:sign=" + sign);
            Response.Write("fail");
        }
    }
    public static string GetMD5(string s, string _input_charset)
    {
        /// <summary>
        /// 与ASP兼容的MD5加密算法
        /// </summary>
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] t = md5.ComputeHash(Encoding.GetEncoding(_input_charset).GetBytes(s));
        StringBuilder sb = new StringBuilder(32);
        for (int i = 0; i < t.Length; i++)
        {
            sb.Append(t[i].ToString("x").PadLeft(2, '0'));
        }
        return sb.ToString();
    }

    public static string[] BubbleSort(string[] r)
    {
        /// <summary>
        /// 冒泡排序法
        /// </summary>
        //交换标志 
        int i, j; 
        string temp;
        bool exchange;
        //最多做R.Length-1趟排序 
        for (i = 0; i < r.Length; i++) 
        {
            //本趟排序开始前，交换标志应为假
            exchange = false; 
            for (j = r.Length - 2; j >= i; j--)
            {
                //交换条件
                if (System.String.CompareOrdinal(r[j + 1], r[j]) < 0)　
                {
                    temp = r[j + 1];
                    r[j + 1] = r[j];
                    r[j] = temp;
                    //发生了交换，故将交换标志置为真
                    exchange = true;  
                }
            }
            //本趟排序未发生交换，提前终止算法 
            if (!exchange) 
            {
                break;
            }

        }
        return r;
    }
    //获取远程服务器ATN结果
    public String Get_Http(String a_strUrl, int timeout)
    {
        string strResult;
        try
        {
            //创建访问页面
            HttpWebRequest myReq = (HttpWebRequest)HttpWebRequest.Create(a_strUrl);
            myReq.Timeout = timeout;
            HttpWebResponse HttpWResp = (HttpWebResponse)myReq.GetResponse();
            //获取页面返回数据流
            Stream myStream = HttpWResp.GetResponseStream();
            StreamReader sr = new StreamReader(myStream, Encoding.Default);
            StringBuilder strBuilder = new StringBuilder();
            //获取内容
            while (-1 != sr.Peek())
            {
                strBuilder.Append(sr.ReadLine());
            }
            strResult = strBuilder.ToString();
        }
        catch (Exception exp)
        {
            strResult = "错误：" + exp.Message;
        }
        return strResult;
    }
}
