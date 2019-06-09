<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileDelete.aspx.cs" Inherits="fileManage_FileDelete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" style="width: 645px; height: 1px" border="0" cellpadding="0">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="width: 685px; height: 31px">
                    －＝删除文件＝－</td>
            </tr>
            <tr>
                <td colspan="3" style="height: 17px; width: 685px;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px"
                        CellPadding="4" CssClass="css" Height="38px" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowDeleting="GridView1_RowDeleting" Width="682px" GridLines="Horizontal">
                        <PagerSettings FirstPageText="第一页" LastPageText="最后一页" Mode="NextPreviousFirstLast"
                            NextPageText="下一页" PreviousPageText="上一页" />
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="fileid" HeaderText="id" />
                            <asp:BoundField DataField="filesender" HeaderText="发送人" />
                            <asp:BoundField DataField="fileaccepter" HeaderText="接收人" />
                            <asp:BoundField DataField="filetitle" HeaderText="文件标题" />
                            <asp:BoundField DataField="filetime" HeaderText="发送时间" />
                            <asp:BoundField DataField="filecontent" HeaderText="文件说明" />
                            <asp:CommandField DeleteImageUrl="~/icon/del.gif" HeaderText="删除文件" ShowDeleteButton="True" />
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
