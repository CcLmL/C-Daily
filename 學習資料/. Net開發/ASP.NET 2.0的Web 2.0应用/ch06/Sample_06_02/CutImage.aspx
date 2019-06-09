<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void Page_Load(object sender,EventArgs e)
	{
		MakeThumbImage(Server.MapPath("Images/xp.jpg"),Server.MapPath("Images/xp_01.jpg"),80,60,"CUT");
	}
	
	/// <summary>
	/// 生成缩略图
	/// </summary>
	/// <param name="sPath">源图路径（物理路径）</param>
	/// <param name="stPath">缩略图路径（物理路径）</param>
	/// <param name="nWidth">缩略图宽度</param>
	/// <param name="nHeight">缩略图高度</param>
	/// <param name="sMode">生成缩略图的方式</param>
	private void MakeThumbImage(string path,string stpath,int width,int height,string mode)
	{
		System.Drawing.Image image = System.Drawing.Image.FromFile(path);
		int tw = width;
		int th = height;
		///原始图片的宽度和高度
		int sw = image.Width;
		int sh = image.Height;
		int x = 0,y = 0;
		switch(mode)
		{
			case "HW": ///指定高宽缩放
				break;
			case "W":  ///指定图片的宽度，计算图片的高度
				th = image.Height * width / image.Width; break;
			case "H":  ///指定图片的高度，计算图片的宽度
				tw = image.Width * height / image.Height; break;
			case "CUT":
				///计算缩略图的大小
				if((double)tw / (double)th < (double)width / (double)height)
				{
					sw = image.Width;
					sh = image.Width * height / tw;
					x = 0;
					y = (image.Height - sh) / 2;
				}
				else
				{
					sh = image.Height;
					sw = image.Height * tw / th;
					y = 0;
					x = (image.Width - sw) / 2;
				}
				break;
			default: break;
		}

		///创建bmp图片
		System.Drawing.Image bitmap = new System.Drawing.Bitmap(tw,th);
		///创建Graphics对象g
		System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
		///设置图像的插补模式
		g.InterpolationMode
			= System.Drawing.Drawing2D.InterpolationMode.High;
		///设置图像的平滑程度
		g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
		///清空画布，并以透明背景色填充
		g.Clear(System.Drawing.Color.Transparent);
		///在指定位置并且按指定大小绘制原图片的指定部分
		g.DrawImage(image,new System.Drawing.Rectangle(0,0,tw,th),
			new System.Drawing.Rectangle(x,y,sw,sh),
		System.Drawing.GraphicsUnit.Pixel);
		try
		{   ///采用jpg格式保存缩略图
			bitmap.Save(stpath,System.Drawing.Imaging.ImageFormat.Jpeg);
		}
		catch(Exception ex)
		{
			Response.Write(ex.Message); return;
		}
		finally
		{   ///释放资源
			image.Dispose();
			bitmap.Dispose();
			g.Dispose();
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>创建缩略图</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
