<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userVideo.ascx.cs" Inherits="userVideo" %>
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
    <link href="css/css.css" rel="stylesheet" type="text/css">
<table cellpadding="0" cellspacing="0" height="29" width="239">
    <tr>
        <td style="width: 241px">
            <img height="29" src="images/spph.gif" width="239" /></td>
    </tr>
    <tr>
        <td style="width: 241px" valign="top">
            <table cellpadding="0" cellspacing="0" height="4" width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="gvVideoP" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                            CssClass="chengse" ShowHeader="False" Width="236px">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a class="heihei" href='seeVideo.aspx?VideoID=<%#Eval("VideoID") %>' target="_self">
                                            <%#Eval("VideoName") %>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="TypeName" />
                                <asp:BoundField DataField="ClickSum" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
