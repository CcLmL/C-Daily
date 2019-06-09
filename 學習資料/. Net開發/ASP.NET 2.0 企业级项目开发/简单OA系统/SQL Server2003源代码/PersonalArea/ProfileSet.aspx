<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfileSet.aspx.cs" Inherits="PersonalArea_ProfileSet" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table style="width: 550px">
        <tr>
            <td style="width: 190px">
                网格线的设置</td>
            <td>
                <asp:DropDownList ID="ddlline" runat="server" Width="229px">
                    <asp:ListItem Value="Both">横竖都有</asp:ListItem>
                    <asp:ListItem Value="None">没有线条</asp:ListItem>
                    <asp:ListItem Value="Vertical">只有竖线</asp:ListItem>
                    <asp:ListItem Value="Horizontal">只有横线</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 190px">
                允许编辑网格</td>
            <td>
                <asp:CheckBox ID="chkedit" runat="server" Text="允许" Width="100px" /></td>
        </tr>
        <tr>
            <td style="width: 190px">
                允许删除记录</td>
            <td>
                <asp:CheckBox ID="chkdelete" runat="server" Text="允许" Width="99px" /></td>
        </tr>
        <tr>
            <td style="width: 190px">
                允许选择记录</td>
            <td>
                <asp:CheckBox ID="chkselect" runat="server" Text="允许" Width="98px" /></td>
        </tr>
        <tr>
            <td style="width: 190px">
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存设置" Width="124px" /></td>
        </tr>
    </table>
</asp:Content>

