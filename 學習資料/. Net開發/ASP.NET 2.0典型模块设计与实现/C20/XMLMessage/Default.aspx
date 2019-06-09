<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 487px">
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SendMSG.aspx" Width="151px">发表留言</asp:HyperLink></td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" Width="74px" NavigateUrl="~/Manager/DeleMsg.aspx">删除留言</asp:HyperLink></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="534px">
                                       <HeaderTemplate><table></HeaderTemplate>
                    <ItemTemplate><tr>
                    <td>姓名：<%#XPath("name")%></td>
                    <td>邮箱：<%#XPath("mail")%></td>
                    <td >网址：<%#XPath("url")%></td>
                    </tr>
                    
                    <tr>
                    <td colspan="3"  style="color: black; background-color: white;">留言内容：<%#XPath("msg")%></td>
                    </tr></ItemTemplate>
                     <FooterTemplate></table></FooterTemplate>
                        <FooterStyle BackColor="#CCCC99" />
                        <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="White" />
                        <ItemStyle BackColor="#F7F7DE" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    </asp:DataList></td>
            </tr>
            <tr>
                <td>
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile.xml"></asp:XmlDataSource>
                </td>
                <td >
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
