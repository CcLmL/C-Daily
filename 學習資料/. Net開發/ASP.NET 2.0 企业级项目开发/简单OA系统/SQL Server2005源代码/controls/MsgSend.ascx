<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MsgSend.ascx.cs" Inherits="controls_MsgSend" %>
    <table style="width: 452px">
        <tr>
            <td>
                收件人：</td>
            <td>
                <asp:TextBox ID="txtreceive" runat="server" Width="258px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                主题</td>
            <td>
                <asp:TextBox ID="txttitle" runat="server" Width="263px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                内容</td>
            <td>
                <asp:TextBox ID="txtcontent" runat="server" Rows="6" TextMode="MultiLine" Width="269px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" Width="93px" /></td>
            <td>
            </td>
        </tr>
    </table>