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
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" Width="534px">
                                       <HeaderTemplate><table></HeaderTemplate>
                    <ItemTemplate>
                    <tr > <td>                        姓名:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label><br />
                       邮箱:
                        <asp:Label ID="MailLabel" runat="server" Text='<%# Eval("Mail") %>'></asp:Label><br />
                        网址:
                        <asp:Label ID="UrlLabel" runat="server" Text='<%# Eval("Url") %>'></asp:Label><br />
</td><td>
                        留言内容:
                        <asp:Label ID="MsgContentLabel" runat="server" Text='<%# Eval("MsgContent") %>'>
                        </asp:Label><br />
                        <br /></td></tr>
                    </ItemTemplate>
                     <FooterTemplate></table></FooterTemplate>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MSGConnectionString %>"
                        SelectCommand="SELECT * FROM [msgView]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td >
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
