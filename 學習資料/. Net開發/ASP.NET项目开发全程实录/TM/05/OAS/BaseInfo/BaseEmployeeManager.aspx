<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaseEmployeeManager.aspx.cs" Inherits="BaseInfo_BaseEmployeeManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" class="css" style="width: 1px;
            height: 1px">
            <tr>
                <td align="center" class="csstitle" colspan="3">
                    －＝员工基本信息＝－</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 18px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="2px"
                        CellPadding="2" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"
                        PageSize="15" Width="736px" GridLines="Horizontal" Height="97px">
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                            NextPageText="下一页" PreviousPageText="上一页" />
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" />
                            <asp:BoundField DataField="name" HeaderText="姓名">
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sex" HeaderText="性别">
                                <HeaderStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="learn" HeaderText="学历">
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="post" HeaderText="职称">
                                <HeaderStyle Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dept" HeaderText="部门">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="job" HeaderText="职务">
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tel" HeaderText="联系电话">
                                <HeaderStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="address" HeaderText="联系地址">
                                <HeaderStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="state" HeaderText="在职否">
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="BaseEmployeeUpdate.aspx?id={0}"
                                HeaderText="编辑" Text="编辑" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
