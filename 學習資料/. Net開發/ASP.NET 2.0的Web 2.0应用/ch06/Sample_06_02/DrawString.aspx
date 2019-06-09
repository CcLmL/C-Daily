<%@ Page Language="C#" %>
<%@ Import Namespace="System.Drawing"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected void Page_Load(object sender,EventArgs e)
	{	///创建Image
		System.Drawing.Image image = System.Drawing.Image.FromFile(
			Server.MapPath("~/Images/xp.jpg"));
		///创建Graphics对象g
		System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(image);
		///设置字体和画笔
		Font font = new Font("Tahoma",30f,FontStyle.Bold);
		Brush brush = new SolidBrush(Color.Red);	
		///在图片上绘制的水印，即文本
		g.DrawString("这是我需要绘制的文本水印……",font,brush,new Point(100,100));
		///将绘制后的图片输出到网页的输出流，并进行输出
		image.Save(Response.OutputStream,System.Drawing.Imaging.ImageFormat.Jpeg);		
		g.Dispose();   ///释放占用的资源
		Response.End();
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>创建水印</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
	</div>
    </form>
</body>
</html>
