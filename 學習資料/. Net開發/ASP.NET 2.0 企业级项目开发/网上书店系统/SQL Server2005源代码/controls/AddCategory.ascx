<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCategory.ascx.cs" Inherits="controls_AddCategory" %>
        <table style="width: 633px">
            <tr>
                <td style="width: 195px">
                    目录名称：</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server" Width="401px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 195px">
                    目录的描述：</td>
                <td>
                    <asp:TextBox ID="txtdescription" runat="server" Rows="5" TextMode="MultiLine" Width="404px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 195px">
                    &nbsp;</td>
                <td>
                    &nbsp;<asp:Button ID="Button1" runat="server" Text="添加" Width="76px" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Width="318px"></asp:Label></td>
            </tr>
        </table>