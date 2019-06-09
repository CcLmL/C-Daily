<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search.ascx.cs" Inherits="search" %>
<strong><span style="font-size: 14pt"> </span></strong>
            <table align="center" cellspacing="2" height="35" style="width: 501px">
                <tr>
                    <td style="width: 95px; height: 1px">
                        <p class="hese">
                            <span class="chengse">
    教程类型<span style="font-size: 12pt">
                                </span></span></p>
                    </td>
                    <td style="width: 52px; height: 1px">
                                <asp:DropDownList ID="ddlType" runat="server">
        <asp:ListItem Value="tb_Video">视频</asp:ListItem>
        <asp:ListItem Value="tb_Sound">语音</asp:ListItem>
    </asp:DropDownList></td>
                    <td class="chengse" style="width: 43px; height: 1px">
    语言<span style="font-size: 12pt">
                            </span></td>
                    <td class="chengse" style="width: 62px; height: 1px">
                            <asp:DropDownList ID="ddlLanguage" runat="server" DataTextField="TypeName" DataValueField="TypeID">
    </asp:DropDownList></td>
                    <td style="height: 1px; width: 90px;">
                        <span class="chengse">关键字<span
                            style="font-size: 12pt"></span></span></td>
                    <td style="width: 67px; height: 1px">
                        <asp:TextBox ID="txtKey" runat="server" Width="85px"></asp:TextBox></td>
                    <td style="width: 1px; height: 1px">
                        &nbsp;
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/sousuo.gif" OnClick="ImageButton1_Click" /></td>
                </tr>
            </table>
