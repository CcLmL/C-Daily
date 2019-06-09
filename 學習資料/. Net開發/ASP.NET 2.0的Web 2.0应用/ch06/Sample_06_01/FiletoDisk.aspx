<%@ Page Language="C#"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void btnupload_Click(object sender,EventArgs e)
	{
		if(fuFile.HasFile == false)
		{
			lbMessage.Text = "上载的文件不存在";
			return;
		}
		HttpPostedFile file = fuFile.PostedFile;
		if(file.ContentLength <= 0) 
		{
			lbMessage.Text = "上载的文件的内容为空，不能上载";
			return;
		}
		///获取文件的名称和扩展名
		string vfilename = System.IO.Path.GetFileName(file.FileName);
		string pfilename = Server.MapPath("Files/"  + vfilename);
		///判断文件是否存在
		if(System.IO.File.Exists(pfilename) == false)
		{
			try
			{   ///上载文件到硬盘
				file.SaveAs(pfilename);
			}
			catch(Exception ex)
			{   ///显示错误信息
				lbMessage.Text = ex.Message;
			}
		}
		lbMessage.Text = "上载文件：“" + vfilename + "” 成功。";		
			
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>上载文件到服务器硬盘</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:FileUpload ID="fuFile" runat="server" />
		<asp:Button ID="btnupload" runat="server" OnClick="btnupload_Click" Text="上载文件" /><br />
		<asp:Label ID="lbMessage" runat="server"></asp:Label>
	</div>
    </form>
</body>
</html>
