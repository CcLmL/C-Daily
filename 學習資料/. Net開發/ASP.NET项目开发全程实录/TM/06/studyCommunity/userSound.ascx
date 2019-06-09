<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userSound.ascx.cs" Inherits="userSound" %>
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
        <td>
            <img height="29" src="images/yysp.gif" width="239" /></td>
    </tr>
    <tr>
        <td valign="top" style="text-align: left">
            <asp:GridView ID="gvSoundP" runat="server" AutoGenerateColumns="False" BorderWidth="0px"
                CssClass="chengse" ShowHeader="False" Width="237px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a class="heihei" href='playSound.aspx?SoundID=<%#Eval("SoundID") %>' target="_parent">
                                <%#Eval("SoundName") %>
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
