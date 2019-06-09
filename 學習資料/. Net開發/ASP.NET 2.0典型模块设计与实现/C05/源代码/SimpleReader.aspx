<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SimpleReader.aspx.cs" Inherits="SimpleReader" %>

<%@ Register Assembly="RssToolkit" Namespace="RssToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        您选择的频道列表是：<br />
        &nbsp; &nbsp;
        <asp:DataList ID="DataList1" runat="server" DataSourceID="RssDataSource1">
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("link") %>' Text='<%# Eval("title") %>'></asp:HyperLink>
            </ItemTemplate>
            <AlternatingItemStyle BackColor="White" />
            <ItemStyle BackColor="#E3EAEB" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        </asp:DataList></div>
        <cc1:RssDataSource ID="RssDataSource1" runat="server" MaxItems="0" Url="http://rss.msnbc.msn.com/id/3032091/device/rss/rss.xml">
        </cc1:RssDataSource>
    </form>
</body>
</html>
