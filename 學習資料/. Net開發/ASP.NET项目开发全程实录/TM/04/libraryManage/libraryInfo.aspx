<%@ Page Language="C#" AutoEventWireup="true" CodeFile="libraryInfo.aspx.cs" Inherits="libraryInfo" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>
<%@ Register Src="bottom.ascx" TagName="bottom" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="css.css" rel="stylesheet" type="text/css" />
</head>
    <body style="text-align: center">
    <form id="form2" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="border-right: #669900 1px solid;
            border-top: #669900 1px solid; border-left: #669900 1px solid; width: 696px;
            border-bottom: #669900 1px solid; background-color: #ffffff">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left">
                    &nbsp;<span style="color: #cc0000">当前位置：系统设置&gt;图书馆信息</span></td>
            </tr>
            <tr>
                <td style="height: 64px">
                    &nbsp;<img src="Images/tushuguanxinxi.gif" width="815" /></td>
            </tr><tr>
                <td>
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 369px;
                        height: 295px">
                        <tr>
                            <td style="width: 111px; height: 16px">
                                <div align="right" style="text-align: right">
                                    图书馆名称：</div>
                            </td>
                            <td style="height: 16px; text-align: left" width="175">
                    <asp:TextBox ID="txtLibraryName" runat="server" ReadOnly="True" Width="113px" /></td>
                            <td style="height: 16px" width="76">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 111px;">
                                <div style="text-align: right" align="right">
                                    馆长：</div>
                            </td>
                            <td style="text-align: left">
                                <asp:TextBox width="114px" ID="txtCurator" runat="server" /></td>
            <td>
                &nbsp;</td>
                        </tr>
                <tr style="color: #000000;">
                    <td style="width: 111px; height: 20px;"><div style="text-align: right" align="right"  >
                        联系电话：</div><td style="height: 20px; text-align: left">
                        <asp:TextBox ID="txtTel" runat="server" Width="114px"></asp:TextBox></td>
                        <td style="height: 20px">
                        </td>
                </tr>
                        <tr style="color: #000000" >
                            <td style="width: 111px">
                                <div align="right" style="text-align: right">
                                    地址：</div>
                            </td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtAddress" runat="server" Width="114px"></asp:TextBox></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr style="color: #000000" >
                            <td style="width: 111px; height: 24px">
                                <div align="right" style="text-align: right">
                                    网址：</div>
                            </td>
                            <td style="height: 24px; text-align: left">
                                <asp:TextBox ID="txtNet" runat="server" Width="114px"></asp:TextBox></td>
                            <td style="height: 24px">
                                &nbsp;</td>
                        </tr>
                            &nbsp;
                            <tr >
                                <td style="width: 111px">
                                    <div align="right" style="text-align: right">
                                        E-mail：</div>
                                </td>
                                <td style="text-align: left">
                                    <asp:TextBox ID="txtEmail" runat="server" Width="114px"></asp:TextBox></td>
                                <td>
                                    &nbsp;</td>
                            </tr><tr>
              <td style="width: 111px"><div style="text-align: right" align="right" >
              建馆时间：</div>
                </td>
              <td style="text-align: left">
                  <asp:TextBox ID="txtUpbuildTime" runat="server" Width="115px"></asp:TextBox></td>
              <td>
                  &nbsp;</td>
          </tr>
                        <tr>
                            <td style="width: 111px; text-align: right">
                                备注：</td>
                            <td style="text-align: left">
                                <asp:TextBox ID="txtRemark" runat="server" Height="74px" TextMode="MultiLine" Width="155px"></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保　存" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                    <uc2:bottom ID="Bottom1" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>
