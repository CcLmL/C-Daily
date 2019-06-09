<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GoodEmployee.ascx.cs" Inherits="UserControl_GoodEmployee" %>
<asp:DataList ID="DataList1" runat="server"
    BorderStyle="none" BorderWidth="0px" CellPadding="0" GridLines="horizontal" Width="224px" BackColor="#F0F0F1">
    <ItemTemplate>
        <table border="0" cellspacing="0" class="css" style="width: 224px; height: 70px;
            background-color: #ffffff;" cellpadding="0">
            <tr>
                <td rowspan="3" style="margin-left: 0px; margin-right: 0px; width: 73px;">
                    <asp:Image ID="image1" runat="server" Height="96px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"photopath") %>'
                        Width="80px" /></td>
                <td align="left" colspan="2" style="width: 107px">
                    姓名：<%# DataBinder.Eval(Container.DataItem, "name")%></td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="width: 107px">
                    部门：<%# DataBinder.Eval(Container.DataItem, "dept")%></td>
            </tr>
            <tr>
                <td align="left" colspan="2" style="width: 107px">
                    职务：<%# DataBinder.Eval(Container.DataItem, "job")%></td>
            </tr>
            <tr>
                <td align="left" bgcolor="#f0f0f1" colspan="3" style="height: 20px">
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <FooterStyle BackColor="White" ForeColor="#4A3C8C" />
    <SelectedItemStyle Font-Bold="True" ForeColor="#F7F7F7" />
    <AlternatingItemStyle BackColor="White" BorderColor="White" />
    <ItemStyle BackColor="White" ForeColor="#4A3C8C" />
    <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#F7F7F7" />
    <EditItemStyle BackColor="White" />
</asp:DataList>
