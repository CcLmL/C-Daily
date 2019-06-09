<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MsgRec.ascx.cs" Inherits="controls_MsgRec" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MsgID"
    DataSourceID="SqlDataSource1" Width="460px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="MsgID" HeaderText="MsgID" InsertVisible="False" ReadOnly="True"
            SortExpression="MsgID" />
        <asp:BoundField DataField="Send" HeaderText="发件人" SortExpression="Send" />
        <asp:BoundField DataField="MsgTitle" HeaderText="主题" SortExpression="MsgTitle" />
        <asp:BoundField DataField="MsgContent" HeaderText="内容" SortExpression="MsgContent" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
    SelectCommand="SELECT [IsRead], [MsgID], [Receive], [Send], [MsgTitle], [MsgContent] FROM [Message] WHERE ([Receive] = @Receive And [IsRead]=0)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField1" Name="Receive" PropertyName="Value"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="MsgID"
    DataSourceID="SqlDataSource2" Height="50px" Width="462px">
    <Fields>
        <asp:BoundField DataField="MsgContent" HeaderText="信息内容" SortExpression="MsgContent" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SimpleOAConnectionString %>"
    SelectCommand="SELECT [MsgID], [MsgContent] FROM [Message] WHERE ([MsgID] = @MsgID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="MsgID" PropertyName="SelectedValue"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:HiddenField ID="HiddenField1" runat="server" />
