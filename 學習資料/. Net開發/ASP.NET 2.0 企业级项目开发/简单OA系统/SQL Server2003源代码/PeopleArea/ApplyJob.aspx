<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ApplyJob.aspx.cs" Inherits="PeopleArea_ApplyJob" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 590px; height: 145px">
        <tr>
            <td style="height: 21px">
                部门</td>
            <td style="width: 11px; height: 21px">
                &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="DepartName" DataValueField="DepartID" Width="152px">
                </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT [DepartID], [DepartName] FROM [Department]"></asp:SqlDataSource>
            </td>
            <td style="width: 88px; height: 21px">
                空缺职位</td>
            <td style="height: 21px">
                <asp:TextBox ID="txtjob" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                人员数量</td>
            <td style="width: 11px">
                <asp:TextBox ID="txtamount" runat="server"></asp:TextBox></td>
            <td style="width: 88px">
                备注</td>
            <td>
                <asp:TextBox ID="txtnote" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                能力要求</td>
            <td colspan="3">
                <asp:TextBox ID="txtrequire" runat="server" Rows="4" TextMode="MultiLine" Width="415px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="提交" Width="110px" OnClick="Button1_Click" /></td>
            <td style="width: 11px">
            </td>
            <td style="width: 88px">
            </td>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>

