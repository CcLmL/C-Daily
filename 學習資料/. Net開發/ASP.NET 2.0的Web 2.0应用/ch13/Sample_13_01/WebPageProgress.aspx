<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebPageProgress.aspx.cs" Inherits="WebPageProgress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>显示Web窗体页更新进度</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="smForm" runat="server" />
		<script language="javascript" type="text/javascript">
		<!-- 
		var prm = Sys.WebForms.PageRequestManager.getInstance();
		function CancelProgress()
		{   ///如果是异步回发
			if(prm.get_isInAsyncPostBack() == true)
			{
				prm.abortPostBack();   ///取消当前的回发
				///并启用按钮
				var btnClick = document.getElementById("btnClick");
				if(btnClick)
				{
					btnClick.disabled = false;
				}
			}
		}
		// -->
		</script>
		<asp:UpdatePanel ID="upForm" runat="server">
			<ContentTemplate>
				<asp:Button ID="btnClick" runat="server" Text="单击我，将开始加载Web窗体的数据" OnClick="btnClick_Click" OnClientClick="ControlButtonEnabled" />
			</ContentTemplate>
		</asp:UpdatePanel>
		<asp:UpdateProgress ID="progressCtrl" runat="server" AssociatedUpdatePanelID="upForm" DisplayAfter="0">
			<ProgressTemplate>
				Web窗体页正在加载数据，请等待……
				<input id="btnCancel" type="button" onclick="CancelProgress()" value="取消" name="btnCancel" />
			</ProgressTemplate>
		</asp:UpdateProgress>		
    </form>
</body>
</html>
