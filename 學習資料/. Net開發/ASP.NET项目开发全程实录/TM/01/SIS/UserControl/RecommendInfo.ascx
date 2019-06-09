<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RecommendInfo.ascx.cs" Inherits="UserControl_RecommendInfo" %>
<table cellpadding="0" cellspacing="0" height="149" width="194">
  <tr>
     <td align="left" class="huise" width="194" style="vertical-align: top">
        <asp:DataList ID="DataList1" runat="server">
          <ItemTemplate>
           <span class="tuijian">
             ·<a class="huise" href="#" 
             onClick="window.open('ShowLeaguerInfo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"id") %>','','height=258, width=479, top=200, left=200')">
             <%#DataBinder.Eval(Container.DataItem,"title") %>
             </a>
             </span>
          </ItemTemplate>
         </asp:DataList></td>
  </tr>
</table>
