<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BaseNoteBook.aspx.cs" Inherits="BaseInfo_BaseNoteBook" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" class="css" style="width: 648px; height: 138px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3">
                    记事本</td>
            </tr>
            <tr>
                <td style="width: 91px">
                    记事标题：</td>
                <td colspan="2">
                    <asp:TextBox ID="txtTitle" runat="server" Width="407px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtTitle"
                        ErrorMessage="** 必填项" Width="67px"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 91px">
                    记事内容：</td>
                <td colspan="2">
                    <asp:TextBox ID="txtContent" runat="server" Height="124px" TextMode="multiline" Width="451px"></asp:TextBox>
                    <asp:ImageButton ID="imgBtnSave" runat="server" AlternateText="保　存" OnClick="imgBtnSave_Click" ImageUrl="~/images/save.gif" />
                </td>
            </tr>
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 22px">
                    记事本信息列表</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                        CellPadding="4" CssClass="css" GridLines="Horizontal" Height="1px" OnRowDataBound="GridView1_RowDataBound"
                        OnRowDeleting="GridView1_RowDeleting" Width="629px">
                        <PagerSettings FirstPageText="第一条" LastPageText="最后一条" NextPageText="下一条" PreviousPageText="上一条" Mode="NextPreviousFirstLast" />
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="title" HeaderText="标题" />
                            <asp:BoundField DataField="content" HeaderText="内容">
                                <ItemStyle Width="260px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="notetime" HeaderText="记事时间">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:CommandField DeleteText="删除记事"
                                HeaderText="删除信息" ShowDeleteButton="True">
                                <ItemStyle Width="80px" />
                            </asp:CommandField>
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
