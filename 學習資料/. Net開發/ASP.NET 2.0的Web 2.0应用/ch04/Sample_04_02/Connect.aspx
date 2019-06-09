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
		try
		{   ///打开连接
			sqlCon.Open();

			///显示连接对象的属性
			Response.Write("连接字符串：" + sqlCon.ConnectionString + "<br />");
			Response.Write("数据库：" + sqlCon.Database + "<br />");
			Response.Write("数据源：" + sqlCon.DataSource + "<br />");
			Response.Write("数据库版本：" + sqlCon.ServerVersion + "<br />");
			Response.Write("主机名称：" + sqlCon.WorkstationId + "<br />");
			Response.Write("连接超时等待时间：" + sqlCon.ConnectionTimeout + "<br />");			
			Response.Write("数据包：" + sqlCon.PacketSize.ToString() + "<br />");			
			Response.Write("连接状态：" + sqlCon.State.ToString());			
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
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>连接SQL Server数据库</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
