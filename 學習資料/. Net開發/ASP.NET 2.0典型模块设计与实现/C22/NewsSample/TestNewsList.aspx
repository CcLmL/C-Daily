<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestNewsList.aspx.cs" Inherits="TestNewsList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>

    <form id="form1" runat="server">

    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="491px">
        <HeaderTemplate>
        <marquee direction="down"> <table><tr><td> 
        </HeaderTemplate>
            <ItemTemplate>

                <asp:Label ID="NewsTitleLabel" runat="server" Text='<%# Eval("NewsTitle") %>'></asp:Label><br />
                 <asp:Label ID="NewsDateLabel" runat="server" Text='<%# Eval("NewsDate") %>'></asp:Label><br />
                <br />
            </ItemTemplate>
            <FooterTemplate></td></tr></table></marquee> </FooterTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
            SelectCommand="SELECT [NewsTitle], [NewsDate] FROM [NewsInfo]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
