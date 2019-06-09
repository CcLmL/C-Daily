<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userBulletinInfo.ascx.cs" Inherits="userBulletinInfo" %>
  <script>
     function openPWD(i)
   {
      window.showModalDialog("bulletinInfo.aspx?ID="+i,"公告信息","dialogHeight: 280px; dialogWidth: 370px;dialogTop:px; dialogLeft:px; edge: Raised; center: Yes; help: No; resizable: No; status: No;scroll:No");
   }
    
    </script>
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
<table cellpadding="0" cellspacing="0" style="height: 5px; width: 136px;">
    <tr>
        <td style="width: 281px">
            <img height="29" src="images/gonggao.gif" width="239" /></td>
    </tr>
    <tr>
        <td style="width: 281px">
            <table bgcolor="#654937" cellpadding="1" cellspacing="1" >
                <tr>
                    <td bgcolor="#fbf5ec" style="height: 158px; width: 236px;">
                        <marquee direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="4"
                            style="width: 236px; height: 133px"><asp:GridView id="gvBulletin" runat="server" CssClass="chengse" BorderWidth="0px" ShowHeader="False" AutoGenerateColumns="False" Width="228px" __designer:wfdid="w16"><Columns>
<asp:TemplateField><ItemTemplate>
<a href="#" class="heihei" onclick="openPWD(<%#Eval("ID")%>)"><%#Eval("Title")%></a>


</ItemTemplate>
</asp:TemplateField>
<asp:BoundField HtmlEncode="False" DataFormatString="{0:yy-MM-dd}" DataField="Date"></asp:BoundField>
</Columns>
</asp:GridView></marquee>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
