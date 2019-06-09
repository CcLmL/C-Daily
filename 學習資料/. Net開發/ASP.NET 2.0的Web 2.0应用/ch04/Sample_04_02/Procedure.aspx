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
		///定义执行读取数据的命令
		SqlCommand sqlCom = new SqlCommand("Pr_GetUsers",sqlCon);
		///设置执行类型为存储过程
		sqlCom.CommandType = System.Data.CommandType.StoredProcedure;
		
		try
		{   ///打开连接
			sqlCon.Open();

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
    <title>调用存储过程</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
