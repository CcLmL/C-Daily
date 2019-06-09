<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_videoSpeak.aspx.cs" Inherits="Manage_manage_speak" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <ItemTemplate>
                <table backcolor="Brown" border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <span style="font-size: 12pt">发言人：</span></td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("Spokesman") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <span style="font-size: 12pt">发言内容：</span></td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Font-Size="12pt" Height="95px" ReadOnly="True"
                                Text='<%#Eval("SpeakContent") %>' TextMode="MultiLine" Width="351px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="height: 19px">
                                        <span style="font-size: 12pt">发言时间：</span></td>
                                    <td style="height: 19px; width: 274px;">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("SpeakDate") %>' Width="193px"></asp:Label>
                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" CommandName="delete">【删除】</asp:LinkButton></td>
                                    <td style="height: 19px">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <AlternatingItemStyle BackColor="#DCDCDC" />
            <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        </asp:DataList></div>
        <table cellpadding="0" cellspacing="0" style="width: 443px">
            <tr>
                <td style="font-size: 9pt; width: 579px; height: 16px; text-align: right">
                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                    [
                    <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                    &nbsp;]
                    <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                    [
                    <asp:Label ID="labBackPage" runat="server"></asp:Label>
                    &nbsp;]
                    <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Red"
                        OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                    &nbsp;
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
