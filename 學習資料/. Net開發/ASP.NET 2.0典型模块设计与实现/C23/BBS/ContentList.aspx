<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentList.aspx.cs" Inherits="ContentList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 476px">
            <tr>
                <td style="height: 25px">
                    <asp:HyperLink ID="HyperLink1" runat="server" Width="153px">回复主题</asp:HyperLink></td>
            </tr>
            <tr>
                <td>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1"  Width="465px">
        <HeaderTemplate><b>帖子详细内容</b><table border=1 ></HeaderTemplate>
        <ItemTemplate><tr><td >主题：<b><%#XPath("title")%></b></td><td>发帖人：<%#XPath("postuser")%></td></tr>
                      <tr><td colspan="2">发帖时间：<%#XPath("posttime")%></td></tr>
                      <tr><td></td></tr>
                      <tr><td colspan="2"><%#XPath("content")%></td></tr>
                      <br />
        </ItemTemplate>

        <FooterTemplate></table></FooterTemplate>
        </asp:DataList></td>
            </tr>
            <tr>
                <td>
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
