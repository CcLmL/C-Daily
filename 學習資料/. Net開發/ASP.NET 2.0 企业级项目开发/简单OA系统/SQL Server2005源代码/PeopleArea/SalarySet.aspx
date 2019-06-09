<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SalarySet.aspx.cs" Inherits="PeopleArea_SalarySet" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 473px; height: 288px">
        <tr>
            <td>
                选择工资项目</td>
            <td style="width: 174px">
                选择计算方式</td>
        </tr>
        <tr>
            <td>
                    <asp:ListBox ID="ListBox1" runat="server" Height="104px" Width="237px">
                        <asp:ListItem Value="岗位工资">岗位工资</asp:ListItem>
                        <asp:ListItem Value="车补">车补</asp:ListItem>
                        <asp:ListItem Value="饭补">饭补</asp:ListItem>
                        <asp:ListItem Value="税率">税率</asp:ListItem>
                        <asp:ListItem Value="奖励">奖励</asp:ListItem>
                        <asp:ListItem Value="惩罚">惩罚</asp:ListItem>
                    </asp:ListBox></td>
            <td style="width: 174px">
                <asp:ListBox ID="ListBox2" runat="server" Height="103px" Width="143px">
                    <asp:ListItem>+</asp:ListItem>
                    <asp:ListItem>-</asp:ListItem>
                    <asp:ListItem>*</asp:ListItem>
                    <asp:ListItem>/</asp:ListItem>
                </asp:ListBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="添加" Width="62px" />
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="清空" Width="58px" /></td>
            <td style="width: 174px">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加" Width="58px" /></td>
        </tr>
        <tr>
            <td colspan="2" style="height: 58px">
                <asp:TextBox ID="txtset" runat="server" Rows="3" TextMode="MultiLine" Width="455px"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="保存公式" Width="114px" />
            </td>
        </tr>
    </table>
</asp:Content>

