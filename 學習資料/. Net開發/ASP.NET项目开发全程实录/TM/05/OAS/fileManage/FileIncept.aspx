<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileIncept.aspx.cs" Inherits="fileManage_FileIncept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../CSS/CSS.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" class="css" style="width: 536px; height: 1px" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" class="csstitle" colspan="3" style="height: 1px">
                    －＝文件接收＝－</td>
            </tr>
            <tr>
                <td align="right" class="css" colspan="3" style="height: 1px">
                    <asp:RadioButton ID="rdoBtnInpceptFalse" runat="server" AutoPostBack="true" Checked="true"
                        GroupName="file" Text="显示未接受" />
                    <asp:RadioButton ID="rdoBtnInpceptTrue" runat="server" AutoPostBack="true" GroupName="file"
                        Text="显示已接收" />&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" rowspan="2">
                    <asp:DataList ID="DataList1" runat="server" BackColor="white" BorderColor="White"
                        BorderStyle="none" BorderWidth="1px" CellPadding="3" GridLines="horizontal" OnEditCommand="DataList1_EditCommand" Width="526px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <ItemTemplate>
                            <table border="0" style="width: 631px; height: 1px" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" style="width: 63px; height: 11px">
                                        文件标题：</td>
                                    <td align="center" class="csstitle" colspan="2" style="height: 11px">
                                        <%# DataBinder.Eval(Container.DataItem, "filetitle")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 63px; height: 13px">
                                        来自：</td>
                                    <td style="width: 237px">
                                        <%# DataBinder.Eval(Container.DataItem, "filesender")%>
                                    </td>
                                    <td align="center">
                                        接收状态：<%#DataBinder.Eval(Container.DataItem, "examine")%>&nbsp;
                                        <asp:LinkButton ID="linkbutton1" runat="server" CommandName="edit" CssClass="bluebuttoncss">确认接收</asp:LinkButton></td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 63px; height: 35px;">
                                        文件内容：</td>
                                    <td colspan="2" style="height: 35px">
                                        <%#DataBinder.Eval(Container.DataItem, "filecontent")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 63px; height: 18px;">
                                        附件：</td>
                                    <td align="center" style="width: 237px; height: 18px;">
                                        <%#DataBinder.Eval(Container.DataItem, "filename")%>
                                        <a href='<%#DataBinder.Eval(Container.DataItem, "path")%>'>下载</a>
                                    </td>
                                    <td style="height: 18px">
                                        时间：<%#DataBinder.Eval(Container.DataItem, "filetime", "{0:yyyy-MM-dd}")%></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#F7F7F7" />
                        <ItemStyle BackColor="White" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList></td>
            </tr>
            <tr>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
