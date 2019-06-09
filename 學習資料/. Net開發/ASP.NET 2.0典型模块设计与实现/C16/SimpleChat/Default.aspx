<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        			<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 268px; POSITION: absolute; TOP: 155px; height: 123px; width: 439px;" cellSpacing="1"
				cellPadding="1" border="0">
				<TR>
					<TD style="width: 119px">
                        聊天频道：</TD>
					<TD>
						<asp:TextBox id="TB_Channel" runat="server" Width="248px"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TB_Channel"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="width: 119px">
                        用户姓名：</TD>
					<TD>
						<asp:TextBox id="TB_Username" runat="server" Width="247px"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TB_Username"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="width: 119px"></TD>
					<TD>
						<asp:Button id="BT_Enter" runat="server" Text="进入聊天室" OnClick="BT_Enter_Click"></asp:Button></TD>
				</TR>
			</TABLE>
    </div>
    </form>
</body>
</html>
