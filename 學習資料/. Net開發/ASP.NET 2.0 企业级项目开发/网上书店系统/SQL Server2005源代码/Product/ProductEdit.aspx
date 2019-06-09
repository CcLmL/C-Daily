<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductEdit.aspx.cs" Inherits="Product_ProductEdit" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    修改图书资料<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID"
        DataSourceID="SqlDataSource1" Width="534px">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ProductName" HeaderText="书名" SortExpression="ProductName" />
            <asp:BoundField DataField="Count" HeaderText="数量" ReadOnly="True" SortExpression="Count" />
            <asp:BoundField DataField="Price" HeaderText="价格" SortExpression="Price" />
            <asp:BoundField DataField="ProductImage" HeaderText="封面地址" SortExpression="ProductImage" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
        DeleteCommand="DELETE FROM [Item] WHERE [ItemID] = @ItemID" InsertCommand="INSERT INTO [Item] ([ProductID], [SupplierID], [Price], [ProductName], [ProductImage]) VALUES (@ProductID, @SupplierID, @Price, @ProductName, @ProductImage)"
        SelectCommand="SELECT Item.ItemID, Item.ProductID, Item.SupplierID, Item.Price, Item.ProductName, Item.ProductImage, ProductCount.ItemID AS Expr1, ProductCount.Count FROM Item INNER JOIN ProductCount ON Item.ItemID = ProductCount.ItemID"
        UpdateCommand="UPDATE [Item] SET [ProductID] = @ProductID, [SupplierID] = @SupplierID, [Price] = @Price, [ProductName] = @ProductName, [ProductImage] = @ProductImage WHERE [ItemID] = @ItemID">
        <DeleteParameters>
            <asp:Parameter Name="ItemID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductImage" Type="String" />
            <asp:Parameter Name="ItemID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductID" Type="Int32" />
            <asp:Parameter Name="SupplierID" Type="Int32" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="ProductName" Type="String" />
            <asp:Parameter Name="ProductImage" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

