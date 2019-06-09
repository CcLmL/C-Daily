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
using Gateway;

public partial class SubmitPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //按时构造订单号
        System.DateTime currentTime = new System.DateTime();
        currentTime = System.DateTime.Now;
        //获取适合使用习惯的日期，例如2006-09-13 14：20
        string out_trade_no = currentTime.ToString("g");
        //替换日期中的特殊字符
        out_trade_no = out_trade_no.Replace("-", "");
        out_trade_no = out_trade_no.Replace(":", "");
        out_trade_no = out_trade_no.Replace(" ", "");
        //业务参数赋值
        //支付接口
        string gateway = T_gateway.Text;
        //服务接口名称，此处采用测试默认值。
        string service = T_service.Text;
        // 合作伙伴ID。注册为支付宝用户后获取。
        string partner = T_partner.Text;
        //加密类型。
        string sign_type = T_sign_type.Text;
        //商品名称
        string subject = T_subject.Text;
        //商品描述   
        string body = T_body.Text;
        //支付类型 此处默认为商品购买，具体类型可参考下载的文档。
        string payment_type = T_payment_type.Text;
        //总金额	0.01～50000.00
        string total_fee = T_total_fee.Text;
        //商品的展示地址
        string show_url = T_show_url.Text;
        //卖家账号
        string seller_email = T_seller_email.Text;
        //partner账户的支付宝安全校验码
        string key = T_key.Text;
        //服务器返回接口   
        string return_url = T_return_url.Text;
        //服务器通知返回接口
        string notify_url = T_notify_url.Text;
        //编码格式
        string _input_charset = T_inputchatset.Text;
        //生成一个支付对象
        AliPay ap = new AliPay();
        //根据网关校验，并返回完成地址
        string aliay_url = ap.CreatUrl(
            gateway,       service,      partner,
            sign_type,     out_trade_no, subject,
            body,          payment_type, total_fee,
            show_url,      seller_email, key,
            return_url,   _input_charset,notify_url );
        //导航到支付宝交付页面
        Response.Redirect(aliay_url);
    }
}
