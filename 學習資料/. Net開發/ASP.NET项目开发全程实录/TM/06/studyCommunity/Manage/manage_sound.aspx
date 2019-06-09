<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manage_sound.aspx.cs" Inherits="Manage_manage_sound" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" cellspacing="0" style="width: 437px; height: 324px">
            <tr>
                <td style="width: 100px; text-align: left;" rowspan="3">
                </td>
                <td style="width: 100px; text-align: center">
                    <span style="font-size: 16pt; color: #006633"><strong>语音管理</strong></span></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; text-align: left" valign="top">
                    <asp:GridView ID="grvSound" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        Height="305px" OnPageIndexChanging="grvVideo_PageIndexChanging" OnRowDeleting="grvVideo_RowDeleting"
                        PageSize="5" Width="419px" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" CssClass="chengse">
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="SoundID" DataNavigateUrlFormatString="manage_playSound.aspx?SoundID={0}"
                                DataTextField="SoundName" HeaderText="语音名称" Target="rightFrame">
                                <ControlStyle Font-Underline="False" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
                            <asp:HyperLinkField DataNavigateUrlFields="SoundID" DataNavigateUrlFormatString="manage_Soundspeak.aspx?SoundID={0}"
                                HeaderText="管理留言" Target="rightFrame" Text="管理">
                                <ControlStyle Font-Underline="False" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                <ControlStyle Font-Underline="False" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    </asp:GridView>
                </td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
