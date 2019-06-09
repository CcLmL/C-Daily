<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsData.aspx.cs" Inherits="NewsData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="296px" Height="138px">
        <HeaderTemplate> 
        <b><%# Eval("NewsTitle") %></b><br /><br /> 
                        <asp:Label ID="NewsDateLabel" runat="server" Text='<%# Eval("NewsDate") %>'></asp:Label><br />
        <br /><br />
        </HeaderTemplate>
            <ItemTemplate>
                <asp:Label ID="NewsDataLabel" runat="server" Text='<%# Eval("NewsData") %>'></asp:Label><br />
                <asp:Image ID="Image1" runat="server" ImageUrl=<%# Eval("NewsImageUrl")  %>/><br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NewsConnectionString %>"
            SelectCommand="SELECT * FROM [NewsInfo] WHERE ([NewsID] = @NewsID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="NewsID" QueryStringField="newsid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
