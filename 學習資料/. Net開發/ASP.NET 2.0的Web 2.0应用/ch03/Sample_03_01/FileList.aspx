<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void btnFile_Click(object sender,EventArgs e)
	{
		if(Request.Files != null)
		{   ///获取上载文件集合Files
			HttpFileCollection files = Request.Files;
			
			string fileName;
			///上载每一个文件
			for(int i = 0; i < files.Count; i++)
			{   ///如果上载文件的内容为空，则跳过该文件
				if(files[i].ContentLength <= 0) continue;
				///获取文件的名称和扩展名
				fileName = Path.GetFileName(files[i].FileName);
				///上载文件到服务器
				files[i].SaveAs(Request.MapPath("Images/" + fileName));
			}
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>获取上载文件集合Files</title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
		<input id="File1" type="file" name="File1" /><br />
		<input id="File2" type="file" name="File2" /><br />
		<asp:Button ID="btnFile" runat="server" Text="上载文件" OnClick="btnFile_Click" />
    </div>
    </form>
</body>
</html>
