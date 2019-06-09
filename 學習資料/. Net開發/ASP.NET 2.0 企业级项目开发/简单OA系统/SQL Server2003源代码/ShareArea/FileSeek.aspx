<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FileSeek.aspx.cs" Inherits="ShareArea_FileSeek" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 568px">
        <tr>
            <td style="width: 201px">
                搜索模式</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="228px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查询" Width="69px" /></td>
        </tr>
        <tr>
            <td colspan="2">
                例如：*.doc或t*.txt</td>
        </tr>
        <tr>
            <td colspan="2" style="height: 21px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                    Width="498px">
                    <Columns>
                        <asp:BoundField DataField="filename" HeaderText="文件名" />
                        <asp:BoundField DataField="filesize" HeaderText="文件大小" />
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SeekFileInfo"
                    TypeName="FileManager">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" DefaultValue="" Name="path" PropertyName="Value"
                            Type="String" />
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="*.*" Name="searchPattern"
                            PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

