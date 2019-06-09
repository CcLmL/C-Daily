<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu.ascx.cs" Inherits="userControl_menu" %>
 <table style="width :778px; height :89px;　font-size: 9pt; font-family: 宋体; vertical-align :top; background-image: url(../images/banner.jpg); background-repeat:no-repeat "  border="0" cellpadding="0" cellspacing="0">
    <tr valign =top >
    <td  align =left style="width: 778px; height: 51px; "  valign =top><br />
     <p align="right">
     <a href="mailto:www.bcty365.com" style=" color:Black; font-size: 9pt; font-family: 宋体;  text-decoration :none;">
         <span style="color: #ffffff; background-color: darkred">联系客服</span></a><span style="color: #ffffff;
             background-color: darkred"> |</span><a href="#" style=" color:Black; font-size: 9pt; font-family: 宋体;  text-decoration :none;" onclick ="this.style.behavior='url(#default#homepage)';this.sethomepage('hppt://www.bc110.com')"><span
                     style="color: #ffffff; background-color: darkred">设置主页</span></a><span style="color: #ffcc99;
                         background-color: darkred"> |</span><a href="#" onclick="window.external.addFavorite('http://www.mrbccd.com','XXX科技有限公司');"><font color="white" style=" color:Black; font-size: 9pt; font-family: 宋体;  text-decoration :none;"><span
                             style="color: #ffffff; background-color: darkred">收藏本站</span></font></a>&nbsp;&nbsp;
        </p>
    <P align=right>
    <a href="~/shopCart.aspx" style=" color:Black; font-size: 9pt; font-family: 宋体;  text-decoration :none;"></a>&nbsp;&nbsp;&nbsp;
    </p>
   
        <p align="center">
        
            &nbsp; &nbsp;</td> 
     </tr> 
     <tr valign="top">
         <td align="center" style="width: 778px; height: 7px" valign="top">
             <asp:Label ID="labDate"
                runat="server" Text="Label" Height="7px" Width="146px"></asp:Label> |<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" Font-Underline="False" Height="3px" >首页</asp:HyperLink>|<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/goodsList.aspx?id=2&&var=1" Font-Underline="False" Height="2px">推荐商品</asp:HyperLink>|<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/goodsList.aspx?id=3&&var=1" Font-Underline="False" Height="4px">最新商品</asp:HyperLink>|<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/goodsList.aspx?id=4&&var=1" Font-Underline="False" Height="7px">热门商品</asp:HyperLink>|<asp:HyperLink
            ID="HyperLink6" runat="server" NavigateUrl="~/shopCart.aspx" Height="1px" Font-Overline="False">购物车</asp:HyperLink>|<asp:HyperLink
                ID="HyperLink7" runat="server" NavigateUrl="~/buyFlow.aspx" Height="1px" Font-Overline="False">购物流程</asp:HyperLink>|<asp:HyperLink
                    ID="HyperLink8" runat="server" NavigateUrl="~/feedback.aspx" Height="6px" Font-Overline="False">网站留言</asp:HyperLink>|<asp:HyperLink
                        ID="HyperLink9" runat="server" NavigateUrl="~/MyWord.aspx" Height="7px" Font-Overline="False">我的留言</asp:HyperLink>|
             &nbsp;<asp:LinkButton ID="lnkbtnOut" runat="server" Font-Underline=false ForeColor =black OnClick="lnkbtnOut_Click" CausesValidation="False" Height="8px" >退出登录</asp:LinkButton></td>
     </tr>
     <tr>
    </table>
