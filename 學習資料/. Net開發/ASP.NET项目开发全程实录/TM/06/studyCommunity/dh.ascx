<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dh.ascx.cs" Inherits="dh" %>
<asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="~/images/index_01.jpg" HotSpotMode="Navigate">
    <asp:RectangleHotSpot Bottom="39" Left="408" NavigateUrl="~/issuance.aspx" Right="467"
        Top="57" />
    <asp:RectangleHotSpot Bottom="38" Left="509" Right="571" Top="56" NavigateUrl="~/typeInfo.aspx?Type=VideoList" />
    <asp:RectangleHotSpot Bottom="38" Left="614" NavigateUrl="~/typeInfo.aspx?Type=SoundList"
        Right="674" Top="57" />
    <asp:RectangleHotSpot Bottom="38" Left="703" NavigateUrl="~/login.aspx" Right="766"
        Top="56" />
    <asp:RectangleHotSpot Bottom="38" Left="325" NavigateUrl="~/index.aspx" Right="369"
        Top="57" />
</asp:ImageMap>