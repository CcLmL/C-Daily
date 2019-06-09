using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// BankPay 的摘要说明
/// </summary>
public class BankPay
{
	public BankPay()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    private string interfaceName = "ICBC_PERBANK_B2C";//接口名称
    private string interfaceVersion = "1.0.0.0";      //接口版本号
    private string merID = "0200EC20000012";          //商户代码
    private string merAcct = "0200029109000030106";   //商城账号
    private string merURL = ""; //接收银行消息地址 (http://地址/Get.aspx)                      
    private string notifyType = "AG";                   //通知类型(在交易完成后不通知商户)
    private string orderid;                           //订单号
    private string amount;                            //订单金额
    private string curType = "001";                   //支付币种
    private string resultType = "0";                     //结果发送类型
    private string orderDate;                           //交易日期时间
    private string verifyJoinFlag = "0";                //检验联名标志（不检验客户是否与商户联名，按金额扣帐）
    private string merCert;                             //商城证商品公 钥
    private string goodsID = "";                        //商品编号
    private string goodsName = "";                      //商品名称
    private string goodsNum = "";                       //商品数量
    private string carriageAmt = "";                    //已含运费金额
    private string merHint = "";                        //商城提示
    private string comment1 = "";                       //备注字段1
    private string comment2 = "";                       //备注字段2  
    private string path1 = @"E:\bank\public.crt";              //公钥路径
    private string path2 = @"E:\bank\user.crt";                //拆分pfx后缀的证商品后的公钥路径
    private string path3 = @"E:\bank\user.key";                //拆分pfx后缀的证商品后的私钥路径
    private string key = "11111111";                    //私钥保护密码
    private string merSignMsg = "";                    //订单签名数据（加密码后的字符串）
    private string msg = "";                           //需要加密码的明文字符串
    public string InterfaceName
    {
        get { return interfaceName; }
        set { interfaceName = value; }
    }
    public string InterfaceVersion
    {
        get { return interfaceVersion; }
        set { interfaceVersion = value; }
    }
    public string MerID
    {
        get { return merID; }
        set { merID = value; }
    }
    public string MerAcct
    {
        get { return merAcct; }
        set { merAcct = value; }
    }
    public string MerURL
    {
        get { return merURL; }
        set { merURL = value; }
    }
    public string NotifyType
    {
        get { return notifyType; }
        set { notifyType = value; }
    }
    public string Orderid
    {
        get { return orderid; }
        set { orderid = value; }
    }
    public string Amount
    {
        get { return amount; }
        set { amount = value; }
    }
    public string CurType
    {
        get { return curType; }
        set { curType = value; }
    }
    public string ResultType
    {
        get { return resultType; }
        set { resultType = value; }
    }
    public string OrderDate
    {
        get { return orderDate; }
        set { orderDate = value; }
    }
    public string VerifyJoinFlag
    {
        get { return verifyJoinFlag; }
        set { verifyJoinFlag = value; }
    }
    public string MerSignMsg
    {
        get { return merSignMsg; }
        set { merSignMsg = value; }
    }
    public string MerCert
    {
        get { return merCert; }
        set { merCert = value; }
    }
    public string GoodsID
    {
        get { return goodsID; }
        set { goodsID = value; }
    }
    public string GoodsName
    {
        get { return goodsName; }
        set { goodsName = value; }
    }
    public string GoodsNum
    {
        get { return goodsNum; }
        set { goodsNum = value; }
    }
    public string CarriageAmt
    {
        get { return carriageAmt; }
        set { carriageAmt = value; }
    }
    public string MerHint
    {
        get { return merHint; }
        set { merHint = value; }
    }
    public string Comment1
    {
        get { return comment1; }
        set { comment1 = value; }
    }
    public string Comment2
    {
        get { return comment2; }
        set { comment2 = value; }
    }
    public string Path1
    {
        get { return path1; }
        set { path1 = value; }
    }
    public string Path2
    {
        get { return path2; }
        set { path2 = value; }
    }
    public string Path3
    {
        get { return path3; }
        set { path3 = value; }
    }
    public string Key
    {
        get { return key; }
        set { Key = value; }
    }
    public string Msg
    {
        get { return msg; }
        set { msg = value; }
    }
}
