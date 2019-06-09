<%@ Control Language="C#" AutoEventWireup="true" CodeFile="navigate.ascx.cs" Inherits="userControl_navigate" %>
<table  style="width: 204px; height:448px; font-size: 9pt; font-family: 宋体; vertical-align :top ; background-image: url(../images/index_16.gif);  background-repeat :no-repeat"  border="0" cellpadding="0" cellspacing="0" >
<tr>
<td style="height: 39px">
</td>
</tr>
    <tr align =center style="width: 204px;  font-size: 9pt; font-family: 宋体; vertical-align :top ;">
        <td style="height: 304px">
         <asp:DataList ID="dlClass" runat="server"  OnItemCommand="dlClass_ItemCommand">
                <ItemTemplate>
                    <table >
                        <tr>
                        <td align =left  style ="width :28px; height :25px;vertical-align :bottom">
                        <asp:Image ID="imageIcon" runat="server"  ImageUrl =<%#DataBinder.Eval(Container.DataItem,"CategoryUrl")%> />
                        </td>
                      <td> </td>
                            <td align =left style ="width :80px;  height :25px; font-size: 9pt; font-family: 宋体; vertical-align :bottom " > 
                            <asp:LinkButton ID="lnkbtnClass" runat="server" CommandName="select" CausesValidation="False"  CommandArgument =<%#DataBinder.Eval(Container.DataItem,"ClassID") %>><%# DataBinder.Eval(Container.DataItem, "ClassName") %></asp:LinkButton>
                            </td>
                        </tr>
                        
                    </table> 
                </ItemTemplate>
            </asp:DataList>
            </td>
    </tr>
    </table>
    <table  style="width: 204px; height: 181px; font-size: 9pt; font-family: 宋体; vertical-align :top ;  text-align :center; background-image: url(../images/新品上市.jpg); background-repeat :no-repeat"  border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td style="height: 11px; width: 204px;"></td>
    </tr>
     <tr>
        <td  style="width: 204px; height: 169px;">
         <marquee direction="up" onmouseout="this.start()" onmouseover="this.stop()" scrollAmount="2" scrollDelay="4" style="width: 130px;height: 128px; font-size: 9pt; font-family: 宋体; vertical-align :top ;  text-align :center; " >本电子商城欢迎您的光临！我们将为您展示各种最新商品，让您的生活更加丰富，购物更加愉快！如果你有什么所需要的，请给本网站留言！</marquee>
        </td>
    </tr>
    
</table>