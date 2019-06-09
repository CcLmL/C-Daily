<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 453px">
        <tr>
            <td>
                您好：<asp:LoginName ID="LoginName1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                今天是:</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbldate" runat="server" Text="Label" Width="295px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                您上班的时间是：</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbltime" runat="server" Width="302px"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="浏览我的考勤记录" Width="136px" /></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TimeID"
                    DataSourceID="SqlDataSource1" Visible="False" Width="583px">
                    <Columns>
                        <asp:BoundField DataField="OnDuty" HeaderText="上班时间" SortExpression="OnDuty" />
                        <asp:BoundField DataField="OffDuty" HeaderText="下班时间" SortExpression="OffDuty" />
                        <asp:BoundField DataField="DutyDate" DataFormatString="{0:d}" HeaderText="日期" HtmlEncode="False"
                            SortExpression="DutyDate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT * FROM [TimeTable]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
   
</asp:Content>