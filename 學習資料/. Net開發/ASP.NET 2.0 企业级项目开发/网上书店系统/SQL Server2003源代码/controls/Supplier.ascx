<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Supplier.ascx.cs" Inherits="controls_Supplierl" %>
                添加供应商：
<hr />
    <table style="width: 617px; height: 71px">
        <tr>
            <td style="width: 114px">
                名称：</td>
            <td style="width: 187px">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
            <td style="width: 95px">
                电话：</td>
            <td>
                <asp:TextBox ID="txtphone" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 114px">
                地址</td>
            <td style="width: 187px">
                <asp:TextBox ID="txtaddr" runat="server"></asp:TextBox></td>
            <td style="width: 95px">
                <asp:Button ID="Button1" runat="server" Text="添加供应商" OnClick="Button1_Click" /></td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label></td>
        </tr>
    </table>
    浏览供应商：
    <hr />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SupplierID" DataSourceID="SqlDataSource1" Width="616px">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="SupplierName" HeaderText="供应商名称" SortExpression="SupplierName" />
            <asp:BoundField DataField="Address" HeaderText="地址" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="电话" SortExpression="Phone" />
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopConnectionString %>"
    DeleteCommand="DELETE FROM [Supplier] WHERE [SupplierID] = @SupplierID" InsertCommand="INSERT INTO [Supplier] ([SupplierName], [Address], [Phone]) VALUES (@SupplierName, @Address, @Phone)"
    SelectCommand="SELECT [SupplierName], [Address], [Phone], [SupplierID] FROM [Supplier]"
    UpdateCommand="UPDATE [Supplier] SET [SupplierName] = @SupplierName, [Address] = @Address, [Phone] = @Phone WHERE [SupplierID] = @SupplierID">
    <DeleteParameters>
        <asp:Parameter Name="SupplierID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="SupplierName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
        <asp:Parameter Name="SupplierID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="SupplierName" Type="String" />
        <asp:Parameter Name="Address" Type="String" />
        <asp:Parameter Name="Phone" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
&nbsp;