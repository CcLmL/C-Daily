<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCheck.aspx.cs" Inherits="PeopleArea_ViewCheck" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 586px">
        <tr>
            <td style="width: 160px">
                员工姓名</td>
            <td style="width: 285px">
                <asp:TextBox ID="TextBox1" runat="server" Width="224px"></asp:TextBox></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="查询" Width="69px" /></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CheckID"
                    DataSourceID="SqlDataSource1" Width="570px">
                    <Columns>
                        <asp:BoundField DataField="EmployeeName" HeaderText="姓名" SortExpression="EmployeeName" />
                        <asp:BoundField DataField="CheckData" HeaderText="考核数据" SortExpression="CheckData" />
                        <asp:BoundField DataField="CheckDate" DataFormatString="{0:d}" HeaderText="日期" HtmlEncode="False"
                            SortExpression="CheckDate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT [CheckID], [EmployeeName], [CheckData], [CheckDate] FROM [Checks] WHERE ([EmployeeName] = @EmployeeName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="EmployeeName" PropertyName="Text"
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

