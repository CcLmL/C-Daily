<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileSend.aspx.cs" Inherits="fileManage_FileSend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" class="css" style="width: 661px; height: 200px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 31px">
                    文件传送</td>
            </tr>
            <tr>
                <td style="width: 64px">
                    接收人：</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlName" runat="server" CssClass="inputcss" Width="154px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 64px">
                    文件标题：</td>
                <td colspan="2">
                    <asp:TextBox ID="txtTitle" runat="server" Width="516px"></asp:TextBox><asp:RequiredFieldValidator
                        ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr style="color: #000000">
                <td style="width: 64px; height: 14px">
                    文件内容：</td>
                <td colspan="2" style="height: 14px">
                    <asp:TextBox ID="txtContent" runat="server" Height="109px" TextMode="multiline"
                        Width="517px"></asp:TextBox><asp:RequiredFieldValidator ID="requiredfieldvalidator2"
                            runat="server" ControlToValidate="txtContent" ErrorMessage="**　必填项"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 64px; height: 21px">
                    附件：</td>
                <td colspan="2" style="height: 21px">
                    上传文件类型为压缩文件(*.rar)<br />
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="581px" /></td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Button ID="btnSend" runat="server" CssClass="redbuttoncss" OnClick="btnSend_Click"
                        Text="发　送" Width="72px" />
                    <asp:Button ID="btnCancle" runat="server" CausesValidation="false" CssClass="redbuttoncss"
                        OnClick="Button2_Click" Text="重　置" Width="72px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
