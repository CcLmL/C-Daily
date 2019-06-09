<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Department.ascx.cs" Inherits="controls_Department" %>
<table style="width: 560px">
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="部门名称" Width="117px"></asp:Label></td>
        <td>
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="请填写部门名称" Width="196px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="78px" />
            <asp:Label ID="Label3" runat="server" Width="226px"></asp:Label></td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="部门列表" Width="115px"></asp:Label></td>
        <td>
            &nbsp;<asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1"
                GridLines="Both" RepeatColumns="2" Width="419px">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    部门名称:
                    <asp:Label ID="DepartNameLabel" runat="server" Text='<%# Eval("DepartName") %>'></asp:Label><br />
                    <br />
                </ItemTemplate>
                <ItemStyle ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT [DepartName] FROM [Department]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
