<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Configuration" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	protected void Page_Load(object sender,EventArgs e)
	{   ///读取配置文件Web.Config中的连接字符串
		string connectiongString = ConfigurationManager.ConnectionStrings["WEB2ASPNET2DBConnectionString"].ConnectionString;
		///创建SqlConnection对象
		SqlConnection sqlCon = new SqlConnection(connectiongString);
		///定义读取数据的SQL语句
		string readercmdText = "SELECT TOP 2 * FROM [User] ORDER BY ID DESC";
		string insertcmdText = "INSERT INTO [User](Username,Password,Email,RoleID,CreateDate)VALUES('MyName','MyName','my@web2aspnet2.com',2,GETDATE())";
		string updatecmdText = "UPDATE [User] SET Username='MyOtherName' WHERE ID = (SELECT TOP 1 ID FROM [User]  ORDER BY ID DESC)";
		string deletecmdText = "DELETE [User] WHERE ID = (SELECT TOP 1 ID FROM [User]  ORDER BY ID DESC)";
		
		///定义执行读取数据的命令
		SqlCommand sqlCom = new SqlCommand(readercmdText,sqlCon);		
		
		try
		{  
			sqlCon.Open();                  ///打开连接
			ShowData(sqlCom,readercmdText); ///显示数据

			///执行插入操作
			sqlCom.CommandText = insertcmdText;
			sqlCom.ExecuteNonQuery();
			Response.Write("插入数据的结果：<br />");
			ShowData(sqlCom,readercmdText);  ///显示数据

			///执行修改操作
			sqlCom.CommandText = updatecmdText;
			sqlCom.ExecuteNonQuery();
			Response.Write("修改数据的结果：<br />");
			ShowData(sqlCom,readercmdText); ///显示数据
			
			///执行删除操作
			sqlCom.CommandText = deletecmdText;
			sqlCom.ExecuteNonQuery();
			Response.Write("删除数据的结果：<br />");
			ShowData(sqlCom,readercmdText); ///显示数据			
		}
		catch(SqlException sqlex)
		{   ///如果连接失败，则显示错误信息
			Response.Write(sqlex.Message);
		}
		finally
		{   ///关闭已经打开的连接
			if(sqlCon != null)
			{
				sqlCon.Close();
			}
		}
	}

	private void ShowData(SqlCommand sqlCom,string cmdText)
	{
		sqlCom.CommandText = cmdText;
		SqlDataReader dr = sqlCom.ExecuteReader();
		if(dr == null) return;
		while(dr.Read())
		{   ///显示读取的数据
			Response.Write(dr["UserName"].ToString()
				+ "," + dr["Email"].ToString()
				+ "," + dr["CreateDate"].ToString()
				+ "<br />");
		}
		dr.Close();
	}
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>添加、修改和删除数据</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
