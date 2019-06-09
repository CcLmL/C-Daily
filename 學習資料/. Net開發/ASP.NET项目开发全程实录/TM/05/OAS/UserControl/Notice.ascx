<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Notice.ascx.cs" Inherits="UserControl_Notice" %>
<asp:DataList ID="DataList1" runat="server" align="center" BackColor="white"
    BorderStyle="none" BorderWidth="0px" CellPadding="3" ForeColor="white" GridLines="horizontal" Width="440px">
    <FooterStyle BackColor="Fuchsia" ForeColor="#4A3C8C" />
    <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    <ItemTemplate>
        <table cellpadding="0" cellspacing="0" class="css" style="width: 609px;
            color: #000000; height: 80px;">
            <tr>
                <td align="center" colspan="2" style="height: 18px">
                    公告标题：<%#DataBinder.Eval(Container.DataItem, "noticetitle")%></td>
            </tr>
            <tr>
                <td colspan="2" style="color: #6600cc; height: 22px">
                    公告内容：<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<%# DataBinder.Eval(Container.DataItem, "noticecontent")%>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 921px; height: 65px;">
                    公告日期：<%# DataBinder.Eval(Container.DataItem,"noticetime", "{0:yyyy-MM-dd}")%></td>
                <td align="center" style="width: 475px; height: 65px;">
                    发布公告人：<%# DataBinder.Eval(Container.DataItem, "noticeperson")%></td>
            </tr>
        </table>
    </ItemTemplate>
    <AlternatingItemStyle BackColor="#F7F7F7" />
    <ItemStyle ForeColor="Black" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
</asp:DataList>
