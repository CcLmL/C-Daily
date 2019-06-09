<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleMsg.aspx.cs" Inherits="Manager_DeleMsg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="XmlDataSource1" AutoGenerateColumns="False" Width="490px" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%#Eval("name")%>'
                            CommandName="Delete" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XMLFile.xml" TransformFile="~/XSLTFile.xsl"></asp:XmlDataSource>
    
    </div>
    </form>
</body>
</html>
