<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
		
		///定义保存文件的二进制数据
		byte[] data = new byte[file.ContentLength];
		///读取文件的二进制数据
		file.InputStream.Read(data,0,file.ContentLength);

		///获取配置文件Web.config中的连接字符串
		string conString = ConfigurationManager.ConnectionStrings["WEB2ASPNET2DBConnectionString"].ConnectionString;
		///创建连接SQL Server数据库的SqlConnection对象
		SqlConnection myCon = new SqlConnection(conString);
		string cmdText = "INSERT INTO [Files] ([Name],[Type],[Data])VALUES('"
			+ vfilename + "','"
			+ file.ContentType + "',@Data)";		
		SqlCommand myCmd = new SqlCommand(cmdText,myCon);

		///添加SQL语句的参数
		SqlParameter pData = new SqlParameter();
		pData.ParameterName = "@Data";
		pData.Value = data;
		pData.Direction = System.Data.ParameterDirection.Input;
		myCmd.Parameters.Add(pData);

		try
		{   
			myCon.Open();            ///打开连接			
			myCmd.ExecuteNonQuery();///将数据库保存到数据库
			lbMessage.Text = "上载文件：“" + vfilename + "” 成功。";		
		}
		catch(SqlException sqlex)
		{   ///如果连接失败，则显示错误信息
			lbMessage.Text = sqlex.Message;
		}
		finally
		{   ///关闭已经打开的连接
			if(myCon != null)
			{
				myCon.Close();
			}
		}
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>上载文件到数据库</title>
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

