<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAffiche.aspx.cs" Inherits="ShareArea_ViewAffiche" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 507px">
        <tr>
            <td style="height: 26px">
                选择公告日期 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<asp:Calendar ID="Calendar1" runat="server" Width="319px"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AfficheID"
                    DataSourceID="SqlDataSource1" Width="498px">
                    <Columns>
                        <asp:BoundField DataField="AfficheContent" HeaderText="公告内容" SortExpression="AfficheContent" />
                        <asp:BoundField DataField="AfficheTime" DataFormatString="{0:d}" HeaderText="时间"
                            HtmlEncode="False" SortExpression="AfficheTime" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
                    SelectCommand="SELECT [AfficheID], [AfficheContent], [AfficheTime] FROM [Affiche] WHERE (datediff(day,[AfficheTime] , @AfficheTime)=0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Calendar1" Name="AfficheTime" PropertyName="SelectedDate"
                            Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

