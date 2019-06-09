<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductIn.ascx.cs" Inherits="controls_ProductIn" %>
<table style="width: 701px">
    <tr>
        <td style="width: 172px">
            书名：</td>
        <td style="width: 22px">
            <asp:TextBox ID="txtname" runat="server" Width="173px"></asp:TextBox></td>
        <td>
            所属目录</td>
        <td>
            <asp:DropDownList ID="ddlcategory" runat="server" Width="152px" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
                SelectCommand="SELECT [CategoryName], [CategoryID] FROM [Category]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 172px">
            入库数量：</td>
        <td style="width: 22px">
            <asp:TextBox ID="txtcount" runat="server" Width="173px"></asp:TextBox></td>
        <td>
            封面地址：</td>
        <td>
            <asp:TextBox ID="txtimage" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 172px">
            价格：</td>
        <td style="width: 22px">
            <asp:TextBox ID="txtprice" runat="server" Width="174px"></asp:TextBox></td>
        <td>
            供应商：</td>
        <td>
            <asp:DropDownList ID="ddlsupplier" runat="server" Width="152px" DataSourceID="SqlDataSource2" DataTextField="SupplierName" DataValueField="SupplierID">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
                SelectCommand="SELECT [SupplierID], [SupplierName] FROM [Supplier]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 172px">
            简介：</td>
        <td style="width: 22px">
            <asp:TextBox ID="txtdesc" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="入库" Width="76px" OnClick="Button1_Click" /></td>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
</table>
