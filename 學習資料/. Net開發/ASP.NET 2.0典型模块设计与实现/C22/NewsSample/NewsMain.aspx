<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsMain.aspx.cs" Inherits="NewsMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp;&nbsp;
        <table style="width: 562px; height: 96px">
            <tr>
                <td>
                    <strong><span style="font-size: 14pt">时事新闻：</span></strong></td>
            </tr>
            <tr>
                <td style="height: 21px">
                    &nbsp;
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                    <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"> <%# Eval("NewsTitle") %></a>
                    <br />
                    </ItemTemplate>
                    <FooterTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="~/NewsList.aspx?category=时事新闻">浏览更多。。。。</asp:HyperLink>
                    </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
                        SelectCommand="SELECT [NewsID], [NewsTitle] FROM [NewsInfo] WHERE NewsCategory='时事新闻'        "></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                    <strong><span style="font-size: 14pt">娱乐新闻：</span></strong></td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                        <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"> <%# Eval("NewsTitle") %></a>

                    <br />
                    </ItemTemplate>
                    <FooterTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="~/NewsList.aspx?category=娱乐新闻">浏览更多。。。。</asp:HyperLink>
                    </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>" 
                    SelectCommand="SELECT [NewsID], [NewsTitle] FROM [NewsInfo] WHERE NewsCategory='娱乐新闻'"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <strong><span style="font-size: 14pt">财经新闻：</span></strong></td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                        <ItemTemplate>
                                        <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"> <%# Eval("NewsTitle") %></a>

                    <br />
                    </ItemTemplate>
                    <FooterTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl="~/NewsList.aspx?category=财经新闻">浏览更多。。。。</asp:HyperLink>
                    </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
                        SelectCommand="SELECT [NewsID], [NewsTitle] FROM [NewsInfo] WHERE NewsCategory='财经新闻'"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <strong><span style="font-size: 14pt">体育新闻：</span></strong></td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                       <ItemTemplate>
                                        <a href="NewsData.aspx?newsid=<%# Eval("NewsID") %>"> <%# Eval("NewsTitle") %></a>

                    <br />
                    </ItemTemplate>
                    <FooterTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"
                             NavigateUrl="~/NewsList.aspx?category=体育新闻">浏览更多。。。。</asp:HyperLink>
                    </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
                        SelectCommand="SELECT [NewsID], [NewsTitle] FROM [NewsInfo] WHERE NewsCategory='体育新闻'"></asp:SqlDataSource>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
