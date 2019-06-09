<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VotingResult.aspx.cs" Inherits="communion_VotingResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" style="width: 591px; height: 1px" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3">
                    活动投票结果</td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                        CellPadding="4" CssClass="css" Height="23px" OnRowDeleting="GridView1_RowDeleting"
                        OnRowEditing="GridView1_RowEditing" Width="650px" GridLines="Horizontal">
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="votetitle" HeaderText="标题" />
                            <asp:BoundField DataField="votecontent" HeaderText="活动描述" />
                            <asp:BoundField DataField="voteqty" HeaderText="投票数量" />
                            <asp:CommandField HeaderText="删除活动" ShowDeleteButton="True" />
                            <asp:CommandField EditText="投票清零" HeaderText="投票清零" ShowEditButton="True" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页"
                            NextPageText="下一页" PreviousPageText="上一页" Mode="NextPreviousFirstLast" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
