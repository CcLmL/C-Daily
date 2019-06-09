<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckInfo.aspx.cs" Inherits="BackGround_CheckInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 800px; height: 294px" cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 755px; height: 13px" align="right">
                    <asp:Label ID="lblPageSum" runat="server" Style="left: 428px; top: 23px;" ></asp:Label>
                    <asp:RadioButton ID="rdoBtnCheckTrue" runat="server" AutoPostBack="True" GroupName="checkState"
                        OnCheckedChanged="rdoBtnCheckTrue_CheckedChanged" Text="已经审核供求信息" />
                    <asp:RadioButton ID="rdoBtnCheckFalse" runat="server" AutoPostBack="True" GroupName="checkState"
                        OnCheckedChanged="rdoBtnCheckFalse_CheckedChanged" Text="未审核供求信息" />
                    <asp:RadioButton ID="rdoBtnCheckAll" runat="server" AutoPostBack="True" Checked="True"
                        GroupName="checkState" OnCheckedChanged="rdoBtnCheckAll_CheckedChanged" Text="显示同类型所有供求信息" />
                    </td>
            </tr>
            <tr>
                <td style="vertical-align: top; width: 755px; height: 1px" align="center">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="3" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting"
            OnSelectedIndexChanging="GridView1_SelectedIndexChanging" Width="800px" PageSize="24">
            <PagerSettings FirstPageText="第一页" LastPageText="末一页" Mode="NextPreviousFirstLast"
                NextPageText="下一页" PreviousPageText="上一页" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                            <asp:BoundField DataField="type" HeaderText="信息类型">
                                <ItemStyle Width="60px" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="title" HeaderText="信息标题">
                                <ItemStyle Width="100px" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="info" HeaderText="信息内容" >
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LinkMan" HeaderText="联系人">
                                <ItemStyle Width="60px" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tel" HeaderText="联系电话">
                                <ItemStyle Width="80px" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="checkState" HeaderText="审核状态">
                                <ItemStyle Width="60px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CommandField DeleteText="详细信息" ShowDeleteButton="True">
                                <ItemStyle Width="60px" />
                            </asp:CommandField>
                            <asp:CommandField SelectText="通过/取消" ShowSelectButton="True">
                                <ItemStyle Width="60px" />
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
