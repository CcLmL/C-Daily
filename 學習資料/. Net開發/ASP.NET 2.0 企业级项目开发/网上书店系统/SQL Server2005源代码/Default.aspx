<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 693px; height: 483px">
            <tr>
                <td colspan="2">
                    LOGO区</td>
                <td>
                    &nbsp;欢迎您：<asp:LoginName ID="LoginName1" runat="server" />
                    &nbsp;&nbsp; &nbsp;<asp:LoginStatus ID="LoginStatus1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3" style="height: 364px">
                    目录列表区 &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                        <table cellspacing="0" border="0" style="border-collapse: collapse;">
                        </HeaderTemplate>
                        <ItemTemplate>
                        <tr>
                        <td ><asp:HyperLink runat="server" ID="lnkCategory"  NavigateUrl='<%# string.Format("~/Product/ProductsPage.aspx?page=0&categoryId={0}", Eval("Id")) %>' Text='<%# Eval("Name") %>' /><asp:HiddenField runat="server" ID="hidCategoryId" Value='<%# Eval("Id") %>' /></td>
                        </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                        </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    服务区</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
