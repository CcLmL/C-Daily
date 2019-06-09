<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{   
		///指定被输出图像的地址
		string path = Request.MapPath("~/Images/xp.jpg");
		///创建文件流，以读取图像
		FileStream fs = new FileStream(path,FileMode.Open,FileAccess.Read);
		///定义保存图像数据的二进制数组
		byte[] imageData = new byte[(int)fs.Length];
		///读取文件的二进制数据
		fs.Read(imageData,0,(int)fs.Length);
		///输出图像的二进制数据
		Response.BinaryWrite(imageData);
		///设置页面的输出格式，【注意】：在此只能输出jpg图片
		Response.ContentType = "image/pjpeg";
		Response.End();   ///中止页面的其他输出
	}	
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>以二进制方式输出图像</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
