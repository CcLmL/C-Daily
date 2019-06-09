<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="Manager_AddNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 500px">
            <tr>
                <td style="width: 134px">
                    新闻主题：</td>
                <td>
                    <asp:TextBox ID="txttitle" runat="server" Width="334px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    新闻内容：</td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 134px">
                </td>
                <td>
                    <asp:TextBox ID="txtcontent" runat="server" Rows="8" TextMode="MultiLine" Width="337px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    图片路径：</td>
                <td>
                    <asp:TextBox ID="txtimageurl" runat="server" Width="334px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 134px">
                    新闻分类：</td>
                <td>
                    <asp:DropDownList ID="ddlcategory" runat="server" Width="342px">
                        <asp:ListItem>时事新闻</asp:ListItem>
                        <asp:ListItem>财经新闻</asp:ListItem>
                        <asp:ListItem>娱乐新闻</asp:ListItem>
                        <asp:ListItem>体育新闻</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 134px">
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="111px" /></td>
            </tr>
            <tr>
                <td style="width: 134px">
                </td>
                <td>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
