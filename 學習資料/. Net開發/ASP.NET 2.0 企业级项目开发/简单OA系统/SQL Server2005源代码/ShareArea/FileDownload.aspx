<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FileDownload.aspx.cs" Inherits="ShareArea_FileDownload" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 554px">
        <tr>
            <td>
                浏览服务器文件并提供下载</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" Width="544px" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated">
                    <Columns>
                        <asp:BoundField DataField="filename" HeaderText="文件名" />
                        <asp:BoundField DataField="filesize" HeaderText="文件大小" />
                        <asp:ButtonField CommandName="down" Text="下载" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetFileInfo"
                    TypeName="FileManager">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="path" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>

</asp:Content>

