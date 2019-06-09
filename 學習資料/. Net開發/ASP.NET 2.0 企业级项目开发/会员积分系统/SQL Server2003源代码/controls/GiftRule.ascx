<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GiftRule.ascx.cs" Inherits="controls_GiftRule" %>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
    DeleteCommand="DELETE FROM [GiftRule] WHERE [RuleID] = @RuleID"
    InsertCommand="INSERT INTO [GiftRule] ([StockID], [CardCount]) VALUES (@StockID, @CardCount)"
    SelectCommand="SELECT GiftRule.StockID, Stock.StockName, GiftRule.CardCount, GiftRule.RuleID FROM GiftRule INNER JOIN Stock ON GiftRule.StockID = Stock.StockID"
    UpdateCommand="UPDATE [GiftRule] SET [StockID] = @StockID, [CardCount] = @CardCount WHERE [RuleID] = @RuleID">
    <DeleteParameters>
        <asp:Parameter Name="RuleID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="StockID" Type="String" />
        <asp:Parameter Name="CardCount" Type="Decimal" />
        <asp:Parameter Name="RuleID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="StockID" Type="String" />
        <asp:Parameter Name="CardCount" Type="Decimal" />
    </InsertParameters>
</asp:SqlDataSource>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MemberCardConnectionString %>"
    DeleteCommand="DELETE FROM [GiftRule] WHERE [RuleID] = @RuleID" InsertCommand="INSERT INTO [GiftRule] ([StockID], [CardCount]) VALUES (@StockID, @CardCount)"
    SelectCommand="SELECT [RuleID], [StockID], [CardCount] FROM [GiftRule] WHERE ([RuleID] = @RuleID)"
    UpdateCommand="UPDATE [GiftRule] SET [StockID] = @StockID, [CardCount] = @CardCount WHERE [RuleID] = @RuleID">
    <DeleteParameters>
        <asp:Parameter Name="RuleID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="StockID" Type="String" />
        <asp:Parameter Name="CardCount" Type="Decimal" />
        <asp:Parameter Name="RuleID" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="RuleID" PropertyName="SelectedValue"
            Type="Int32" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="StockID" Type="String" />
        <asp:Parameter Name="CardCount" Type="Decimal" />
    </InsertParameters>
</asp:SqlDataSource>
<table style="width: 496px">
    <tr>
        <td colspan="2">
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" DataKeyNames="RuleID" Width="463px">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="StockID" HeaderText="商品编码" SortExpression="StockID" />
        <asp:BoundField DataField="StockName" HeaderText="商品名称" SortExpression="StockName" />
        <asp:BoundField DataField="CardCount" HeaderText="积分总数" SortExpression="CardCount" />
    </Columns>
</asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="RuleID"
    DataSourceID="SqlDataSource2" Height="50px" Width="173px" OnItemInserted="DetailsView1_ItemInserted">
    <Fields>
        <asp:BoundField DataField="StockID" HeaderText="商品编码" SortExpression="StockID" />
        <asp:BoundField DataField="CardCount" HeaderText="积分总数" SortExpression="CardCount" />
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
</asp:DetailsView>
        </td>
        <td style="width: 92px">
            <asp:Label ID="Label1" runat="server" Text="商品编码"></asp:Label>
            <asp:TextBox ID="txtstockid" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="积分总数"></asp:Label>
            <asp:TextBox ID="txtcount" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" />
            <asp:Label ID="Label3" runat="server" Width="127px"></asp:Label></td>
    </tr>
</table>
&nbsp;&nbsp;
