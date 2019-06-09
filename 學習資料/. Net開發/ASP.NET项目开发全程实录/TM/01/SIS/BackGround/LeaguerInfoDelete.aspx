<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaguerInfoDelete.aspx.cs" Inherits="BackGround_LeaguerInfoDelete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 764px; height: 56px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 759px; height: 12px" align="right">
                    <asp:RadioButton ID="rdoBtnFalse" runat="server" Text="过期信息" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdoBtnFalse_CheckedChanged" />
                    <asp:RadioButton ID="rdoBtnTrue" runat="server" Text="未过期信息" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdoBtnTrue_CheckedChanged" />
                    <asp:RadioButton ID="rdoBtnAll" runat="server" Text="显示全部信息" AutoPostBack="True" Checked="True" GroupName="info" OnCheckedChanged="rdoBtnAll_CheckedChanged" /></td>
            </tr>
            <tr>
                <td style="width: 759px; height: 67px">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        CellPadding="3" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
                        OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="775px" PageSize="20">
                        <PagerSettings FirstPageText="第一页" LastPageText="末一页" Mode="NextPreviousFirstLast"
                            NextPageText="下一页" PreviousPageText="上一页" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="type" HeaderText="信息类型">
                                <ItemStyle Width="60px" />
                                <HeaderStyle HorizontalAlign="Left" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title" HeaderText="信息标题">
                                <ItemStyle Width="100px" />
                                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="info" HeaderText="信息内容">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LinkMan" HeaderText="联系人">
                                <ItemStyle Width="60px" />
                                <HeaderStyle HorizontalAlign="Left" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tel" HeaderText="联系电话">
                                <ItemStyle Width="80px" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="showDay" HeaderText="有效时间">
                                <ItemStyle Width="60px" />
                                <HeaderStyle HorizontalAlign="Left" Width="80px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="checkState" HeaderText="推荐">
                                <HeaderStyle HorizontalAlign="Left" Width="40px" />
                            </asp:CheckBoxField>
                            <asp:CommandField SelectText="详细信息" ShowSelectButton="True">
                                <ItemStyle Width="60px" />
                                <HeaderStyle Width="60px" />
                            </asp:CommandField>
                            <asp:CommandField ShowDeleteButton="True">
                                <HeaderStyle HorizontalAlign="Left" Width="40px" />
                                <ItemStyle Width="40px" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="#E3EAEB" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="False" ForeColor="#333333" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
