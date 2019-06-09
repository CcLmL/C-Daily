<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
          <table style="border-top-style: groove; border-right-style: groove; border-left-style: groove;
            border-bottom-style: groove">
            <tr>
                  <td>网络书城在线客服</td>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
          <tr>
            <td bgcolor="#CCFFCC">
                <asp:HyperLink ID="HyperLink1" ImageUrl="http://wpa.qq.com/pa?p=1:56472816:7"  runat="server" ToolTip="有事情Q我">
                 <%# Eval("ListQQ") %></asp:HyperLink>
            </td>
          </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
          <tr>
            <td>
              <asp:HyperLink  ID="HyperLink2" ImageUrl="http://wpa.qq.com/pa?p=1:56472816:7"  runat="server" ToolTip="有事情Q我"><%# Eval("ListQQ") %></asp:HyperLink>
            </td>
          </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
         <tr>
         <td>欢迎联络</td>
         </tr>
          </table>
        </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QQConnectionString %>"
            SelectCommand="SELECT [ListQQ] FROM [QQList]"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;</div>
    </form>
</body>
</html>
