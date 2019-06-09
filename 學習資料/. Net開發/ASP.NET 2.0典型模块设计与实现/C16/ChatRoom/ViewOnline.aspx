<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewOnline.aspx.cs" Inherits="ViewOnline" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 341px">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                        Width="115px">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="用户名" ReadOnly="True" SortExpression="UserName" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetUsers"
                        TypeName="GetOnline"></asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
