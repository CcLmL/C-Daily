<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewAreaCity.ascx.cs" Inherits="controls_ViewAreaCity" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="AreaID" DataSourceID="SqlDataSource1" Width="407px">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="AreaName" HeaderText="区域名称" SortExpression="AreaName" />
    </Columns>
</asp:GridView>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [AreaID], [AreaName] FROM [Area]"></asp:SqlDataSource>
<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Both" Width="406px">
    <ItemTemplate>
        城市名称:
        <asp:Label ID="CityNameLabel" runat="server" Text='<%# Eval("CityName") %>'></asp:Label><br />
        <br />
    </ItemTemplate>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <ItemStyle ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
</asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
    SelectCommand="SELECT [CityName] FROM [City] WHERE ([AreaID] = @AreaID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="AreaID" PropertyName="SelectedValue"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
&nbsp;
