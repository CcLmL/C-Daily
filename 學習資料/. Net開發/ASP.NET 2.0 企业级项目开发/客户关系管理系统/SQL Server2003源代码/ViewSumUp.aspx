<%@ OutputCache Duration="30" VaryByParam="txtname" %>
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewSumUp.aspx.cs" Inherits="ViewSumUp" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<table style="width: 603px">
        <tr>
            <td style="width: 126px">
                实施人</td>
            <td style="width: 334px">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" /></td>
        </tr>
        <tr>
            <td colspan="3" style="height: 154px">
                <asp:GridView ID="GridView1" runat="server" Width="595px" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="employeename" HeaderText="实施人" />
                        <asp:BoundField DataField="username" HeaderText="客户" />
                        <asp:BoundField DataField="softversion" HeaderText="软件版本" />
                        <asp:BoundField DataField="implementbegindate" DataFormatString="{0:d}" HeaderText="开始日期"        HtmlEncode="False" />
                        <asp:BoundField DataField="implementenddate" DataFormatString="{0:d}" HeaderText="结束日期"        HtmlEncode="False" />
                        <asp:BoundField DataField="implementsumup" HeaderText="总结" />
                        <asp:BoundField DataField="note" HeaderText="备注" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

