<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsList.aspx.cs" Inherits="NewsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate><b>新闻的详细内容如下：</b><br /></HeaderTemplate>
        <ItemTemplate>
                            <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"> <%# Eval("NewsTitle") %></a>
<br /><br />
        </ItemTemplate>
        <FooterTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/NewsMain.aspx">返回新闻目录</asp:HyperLink><br />
        </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
            SelectCommand="SELECT [NewsTitle], [NewsID] FROM [NewsInfo] WHERE ([NewsCategory] = @NewsCategory)">
            <SelectParameters>
                <asp:QueryStringParameter Name="NewsCategory" QueryStringField="category" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
