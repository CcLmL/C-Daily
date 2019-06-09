<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCity.ascx.cs" Inherits="controls_AddCity" %>
<%@ Register Src="AreaUC.ascx" TagName="AreaUC" TagPrefix="uc1" %>
<table style="width: 715px">
    <tr>
        <td style="width: 76px">
            <asp:Label ID="Label1" runat="server" Text="选择区域" Width="180px"></asp:Label></td>
        <td>
            <uc1:AreaUC id="AreaUC1" runat="server" Visible="true" >
            </uc1:AreaUC></td>
    </tr>
    <tr>
        <td style="width: 76px">
            <asp:Label ID="Label2" runat="server" Text="城市名称" Width="175px"></asp:Label></td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                ErrorMessage="请填写城市名称" Width="165px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 76px">
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="101px" />
            <asp:Label ID="Label4" runat="server" Width="216px"></asp:Label></td>
    </tr>
    <tr>
        <td style="width: 76px">
            <asp:Label ID="Label3" runat="server" Text="城市列表" Width="172px"></asp:Label></td>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                Width="305px">
                <Columns>
                    <asp:BoundField DataField="AreaName" HeaderText="区域名称" SortExpression="AreaName" />
                    <asp:BoundField DataField="CityName" HeaderText="城市名称" SortExpression="CityName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftCRMConnectionString %>"
                SelectCommand="SELECT Area.AreaName, City.CityName FROM Area INNER JOIN City ON Area.AreaID = City.AreaID">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
