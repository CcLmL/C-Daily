<%@ Page Language="C#" AutoEventWireup="true" CodeFile="soundList.aspx.cs" Inherits="soundList" %>

<%@ Register Src="bottomT.ascx" TagName="bottomT" TagPrefix="uc3" %>

<%@ Register Src="search.ascx" TagName="search" TagPrefix="uc1" %>
<%@ Register Src="dh.ascx" TagName="dh" TagPrefix="uc2" %>

<%--<%@ Register Src="fy.ascx" TagName="fy" TagPrefix="uc1" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 845px;
            height: 496px">
            <tr>
                <td colspan="3" style="height: 1%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 1%">
                    &nbsp;<uc2:dh ID="Dh1" runat="server" />
                </td>
            </tr>
            <tr style="font-weight: bold; font-size: 14pt">
                <td align="center" colspan="3" style="height: 8%">
                    <img height="29" src="images/sousuolangif.gif" width="557" /><br />
                    <uc1:search ID="Search1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3" rowspan="2" style="text-align: center" valign="top">
                    <span style="font-size: 14pt"><strong>
                        <asp:DataList ID="dlSound" runat="server" Width="583px" CssClass="chengse">
                            <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 15px">
                                    <tr>
                                        <td align="center" style="width: 300px">
                                            <a href='playSound.aspx?SoundID=<%#Eval("SoundID") %>' target="_parent">
                                                <%#Eval("SoundName") %>
                                            </a>
                                        </td>
                                        <td style="width: 100px">
                                            <%#Eval("FBDate","{0:d}") %>
                                        </td>
                                        <td style="width: 85px">
                                            <%#Eval("Name") %>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 500px; height: 10px;">
                                    <tr>
                                        <td align="center" style="width: 300px; height: 22px;">
                                            语音名称</td>
                                        <td style="width: 100px; height: 22px;">
                                            发布日期</td>
                                        <td style="width: 63px; height: 22px;">
                                            发布人</td>
                                    </tr>
                                </table>
                            </HeaderTemplate>
                            <SeparatorTemplate>
                                &nbsp;<br />
                            </SeparatorTemplate>
                        </asp:DataList>
                        <table cellpadding="0" cellspacing="0" style="width: 500px">
                            <tr>
                                <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                    [
                                    <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                    &nbsp;]
                                    <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                    [
                                    <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                    &nbsp;]
                                    <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Red"
                                        OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Red"
                                        OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                        OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Red"
                                        OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </strong></span>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="3" style="height: 25px; text-align: center;">
                    <uc3:bottomT ID="BottomT1" runat="server" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
