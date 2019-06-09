<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitPage.aspx.cs" Inherits="SubmitPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>用户提交页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table style="width: 571px">
            <tr>
                <td colspan="2" style="text-align: left">
                    商品信息</td>
            </tr>
            <tr>
                <td style="width: 181px">
                    <span style="font-size: 9pt; font-family: 宋体">
        商品名称：</span></td>
                <td>
                    <asp:TextBox ID="T_subject" Text="aaa" runat="server" Width="350px" ></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 181px">
                    <span style="font-size: 9pt; font-family: 宋体">
        商品描述：</span></td>
                <td>
                    <asp:TextBox ID="T_body" Text="aaa" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 181px">
                    <span style="font-size: 9pt; font-family: 宋体">
        总金额：</span></td>
                <td>
        <asp:TextBox ID="T_total_fee" Text="0.01" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 181px">
                    <span style="font-size: 9pt; font-family: 宋体">
        展示地址：</span></td>
                <td>
                    <asp:TextBox ID="T_show_url" Text="www.alipay.com" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 181px">
                    <span style="font-size: 9pt; font-family: 宋体">
        卖家账号：</span></td>
                <td>
                    <asp:TextBox ID="T_seller_email" Text="liu_engine@hotmail.com" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
        </table>
        <hr />
        <table style="width: 567px">
            <tr>
                <td colspan="2" style="text-align: left">
                    第三方支付信息</td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">

        支付网关：</span></td>
                <td>
                    <asp:TextBox ID="T_gateway" Text="https://www.alipay.com/cooperate/gateway.do?" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">
        服务参数：</span></td>
                <td>
                    <asp:DropDownList ID="T_service"
            runat="server" Width="357px">
            
            <asp:ListItem>create_digital_goods_trade_p</asp:ListItem>
            
        </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">
        合作商：</span></td>
                <td>
        <asp:TextBox ID="T_partner" runat="server" Width="350px">2088xxxxxxxxxxx</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">
        支付类型：</span></td>
                <td>
                    <asp:TextBox ID="T_payment_type" Text="1" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px; height: 26px;">
                    <span style="font-size: 9pt; font-family: 宋体">
        加密协议：</span></td>
                <td style="height: 26px">
                    <asp:TextBox ID="T_sign_type" Text="MD5" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">
        安全校验码：</span></td>
                <td>
                    <asp:TextBox ID="T_key" runat="server" Width="350px" >xxxxxxxxxxxxxxxxxxxxx</asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">重定向地址：</span></td>
                <td>
                    <asp:TextBox ID="T_return_url" Text="~/Default.aspx" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px">
                    <span style="font-size: 9pt; font-family: 宋体">
        服务器通知地址：</span></td>
                <td>
                    <asp:TextBox ID="T_notify_url" Text="~/Notice.aspx" runat="server" Width="350px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 177px; height: 26px">
                    <span style="font-size: 9pt; font-family: 宋体">服务器编码：</span></td>
                <td style="height: 26px">
                    <asp:TextBox ID="T_inputchatset"
            runat="server" Text="utf-8" Width="350px"></asp:TextBox></td>
            </tr>
        </table>
        <asp:Button ID="Button1"  runat="server"  Text="支付宝付款" OnClick="Button1_Click" /><span
            style="font-size: 9pt; font-family: 宋体"></span></div>
    </form>
</body>
</html>
