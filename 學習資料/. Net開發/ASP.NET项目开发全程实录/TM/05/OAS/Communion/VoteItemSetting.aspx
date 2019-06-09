<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoteItemSetting.aspx.cs" Inherits="communion_VoteItemSetting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="1" class="css" style="width: 500px; height: 100px">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 9px">
                    －＝设置活动投票信息＝－</td>
            </tr>
            <tr>
                <td style="width: 432px; height: 4px">
                    活动标题：</td>
                <td style="width: 294px; height: 4px">
                    <asp:TextBox ID="txtTitle" runat="server" Width="335px"></asp:TextBox></td>
                <td style="width: 88px; height: 4px">
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtTitle"
                        ErrorMessage="**　必填项！" Width="73px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 432px; height: 49px">
                    活动描述：</td>
                <td style="width: 294px; height: 49px">
                    <asp:TextBox ID="txtContent" runat="server" CssClass="inputcss" Height="80px" TextMode="multiline"
                        Width="335px"></asp:TextBox></td>
                <td style="width: 88px; height: 49px">
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtContent"
                        ErrorMessage="**　必填项！" Width="73px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="center" colspan="3" rowspan="2">
                    <asp:ImageButton ID="imgBtnSave" runat="server" AlternateText="提　交" OnClick="imgBtnSave_Click" ImageUrl="~/images/tt.gif" />
                    &nbsp;
                    <asp:ImageButton ID="imgBtnClear" runat="server" AlternateText="清　空" OnClick="imgBtnClear_Click" ImageUrl="~/images/qingkong.gif" /></td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
