<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CalendarUC.ascx.cs" Inherits="Index_IndexUserControl_CalendarUC" %>
<asp:Calendar ID="cDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="150px" ShowDayHeader="False" Width="200px" OnSelectionChanged="cDate_SelectionChanged">
	<SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
	<TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
	<SelectorStyle BackColor="#FFCC66" />
	<OtherMonthDayStyle ForeColor="#FFFFC0" />
	<NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
	<DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
	<TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
</asp:Calendar>
