<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table  cellpadding=0 cellspacing=0  style=" font-size: 9pt; font-family: 宋体;width :569px; height :177px; vertical-align :top ; border-top-style: none; border-right-style: none; border-left-style: none; text-align: left; border-bottom-style: none; background-repeat :no-repeat "  >
    <tr align="left">
        <td align="left" colspan="0" rowspan="0" style="vertical-align: top; width: 574px;
            text-align: left">
                 <asp:HyperLink ID="HyperLink1" runat="server" ImageUrl ="~/images/精品推荐.jpg" NavigateUrl="~/goodsList.aspx?id=2&&var=1" Font-Underline="False" Height="1px" Width="117px"></asp:HyperLink></td>
    </tr>
    <tr align="left">
        <td align="left" colspan="0" rowspan="0" style="vertical-align: top; width: 574px;
            height: 3px; text-align: left">
        </td>
    </tr>
        <tr align="left">
            <td  align="left" style="width :574px;height :3px; vertical-align: top; text-align: left;" colspan="0" rowspan="0" >
               <asp:DataList ID="dLRefine" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dLRefine_ItemCommand" >
                    <ItemTemplate>
                        <table style=" height: 120px">
                            <tr>
                                <td rowspan="5" style="width: 29px">
                                 <asp:Image ID="imageRefine" runat="server"  ImageUrl =<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>/>
                                </td>
                                <td colspan="2">
                                <asp:LinkButton ID="lnkbtnRName" runat="server" CommandName="detailSee"  Font-Underline=false  CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>>
                                <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                                </asp:LinkButton>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    市场价：</td>
                                <td>
                                 <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    热卖价：</td>
                                <td>
                                  <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="imagebtnRefine" runat="server" CommandName="buy" CommandArgument ='<%# DataBinder.Eval(Container.DataItem, "BookID") %>' ImageUrl="~/images/购买.jpg" OnClick="imagebtnRefine_Click" />
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>  
                <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl ="~/images/最新商品.jpg" NavigateUrl="~/goodsList.aspx?id=3&&var=1" Font-Underline="False" Height="1px" Width="30px">特价商品</asp:HyperLink><br />
             <p align =center style ="vertical-align :middle">
               <asp:DataList ID="dlDiscount" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlDiscount_ItemCommand"  >
                    <ItemTemplate>
                        <table style=" height: 120px">
                            <tr>
                                <td rowspan="5" style="width: 29px">
                                 <asp:Image ID="imageDiscount" runat="server"  ImageUrl =<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>/>
                                </td>
                                <td colspan="2">
                                <asp:LinkButton ID="lnkbtnDName" runat="server" CommandName="detailSee"  Font-Underline=false CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>>
                                <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                                </asp:LinkButton>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    市场价：</td>
                                <td>
                                 <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    热卖价：</td>
                                <td>
                                  <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="imagebtnDiscount" runat="server" CommandName="buy" ImageUrl="~/images/购买.jpg" CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>/>
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                 &nbsp;&nbsp;&nbsp;
             </p>
          </td>
        </tr>
        <tr>
            <td align="center" style="width :574px; vertical-align :middle  ; height: 12px;">
                &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" ImageUrl ="~/images/热门商品.jpg" NavigateUrl="~/goodsList.aspx?id=4&&var=1" Font-Underline="False" Height="1px" Width="99px">热门商品</asp:HyperLink>
               <asp:DataList ID="dlHot" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlHot_ItemCommand"  >
                    <ItemTemplate>
                        <table style=" height: 120px">
                            <tr>
                                <td rowspan="5" style="width: 29px">
                                 <asp:Image ID="imageHot" runat="server"  ImageUrl =<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>/>
                                </td>
                                <td colspan="2">
                                <asp:LinkButton ID="lnkbtnHName" runat="server" CommandName="detailSee"  Font-Underline=false CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>>
                                <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                                </asp:LinkButton>
                                </td>
                                
                            </tr>
                            <tr>
                                <td>
                                    市场价：</td>
                                <td>
                                 <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    热卖价：</td>
                                <td>
                                  <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <asp:ImageButton ID="imagebtnHot" runat="server" CommandName="buy" ImageUrl="~/images/购买.jpg"  CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>/>
                                    </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>&nbsp;</td>
        </tr>
        </table>
</asp:Content>
