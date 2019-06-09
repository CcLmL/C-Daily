<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InfoSend.aspx.cs" Inherits="MobileInfo_InfoSend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 711px; height: 356px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" colspan="2" style="height: 25px">
                    发送短信息</td>
            </tr>
            <tr>
                <td align="right" style="width: 108px; height: 10px">
                    信息接收者：</td>
                <td style="width: 657px; height: 10px">
                    <asp:TextBox ID="txtAccepter" runat="server" Width="535px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 108px; height: 226px">
                    <asp:CheckBoxList ID="chkblEmployee" runat="server"
                        Width="95px">
                    </asp:CheckBoxList></td>
                <td style="width: 657px; height: 226px">
                    <asp:TextBox ID="txtInfo" runat="server" Height="276px" TextMode="MultiLine" Width="584px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="center" style="width: 108px">
                    <asp:ImageButton ID="imgBtnSubmit" runat="server" AlternateText="提交接收者" Height="21px"
                        OnClick="ImageButton1_Click" Width="73px" ImageUrl="~/images/tijiao.gif" /></td>
                <td align="center" style="width: 657px">
                    <asp:ImageButton ID="imgBtnSend" runat="server" AlternateText="发 送" OnClick="imgBtnSend_Click" ImageUrl="~/images/fasong.gif" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:ImageButton
                        ID="imgBtnClear" runat="server" AlternateText="清　空" Height="21px" Width="45px" OnClick="imgBtnClear_Click" ImageUrl="~/images/qingkong.gif" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
