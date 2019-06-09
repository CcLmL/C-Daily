<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewOnline.aspx.cs" Inherits="ShareArea_ViewOnline" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 515px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Width="498px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                    Width="206px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="UserName" HeaderText="用户名" ReadOnly="True" SortExpression="UserName" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
                    TypeName="GetOnline"></asp:ObjectDataSource>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>

