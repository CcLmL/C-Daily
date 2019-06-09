using System;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;

namespace Web2ASPNET2.OperateSqlServer
{
	public class OperateDatabase
	{
		#region  定义属性

		/// <summary>
		/// 定义在web.config中标识连接字符串的Name属性的值
		/// </summary>
		private static string connectionStringNameInWebConfig = "SQLSERVERCONNECTIONSTRING";
		public static string ConnectionStringNameInWebConfig
		{
			get
			{
				return connectionStringNameInWebConfig;
			}
			set
			{   ///字符串不能为空或空引用
				if(!string.IsNullOrEmpty(value))
				{
					connectionStringNameInWebConfig = value;
				}
			}
		}

		/// <summary>
		/// 保存执行数据库操作返回值的参数标识
		/// </summary>
		private static string returnValueString = "RETURNVALUESTRING";
		public static string ReturnValueString
		{
			get
			{
				return returnValueString;
			}			
		}

		#endregion

		#region 创建参数

		/// <summary>
		/// 创建参数
		/// </summary>
		/// <param name="ParamName">存储过程名称</param>
		/// <param name="DbType">参数类型</param>
		/// <param name="Size">参数大小</param>
		/// <param name="Direction">参数方向</param>
		/// <param name="Value">参数值</param>
		/// <returns>新的 parameter 对象</returns>
		private static SqlParameter CreateParam(string ParamName,SqlDbType DbType,
			Int32 Size,ParameterDirection Direction,object Value)
		{
			SqlParameter param;			
			if(Size > 0)
			{   ///使用size创建大小不为0的参数
				param = new SqlParameter(ParamName,DbType,Size);
			}
			else
			{
				param = new SqlParameter(ParamName,DbType);
			}
			///创建输出类型参数
			param.Direction = Direction;
			if(!(Direction == ParameterDirection.Output && Value == null))
			{
				param.Value = Value;
			}
			///返回参数
			return param;
		}

		/// <summary>
		/// 创建输入类型参数
		/// </summary>
		/// <param name="ParamName">存储过程名称</param>
		/// <param name="DbType">参数类型</param></param>
		/// <param name="Size">参数大小</param>
		/// <param name="Value">参数值</param>
		/// <returns>新的parameter 对象</returns>
		public static SqlParameter CreateInParam(string ParamName,
			SqlDbType DbType,int Size,object Value)
		{
			return CreateParam(ParamName,DbType,Size,ParameterDirection.Input,Value);
		}

		/// <summary>
		/// 创建输出类型参数
		/// </summary>
		/// <param name="ParamName">存储过程名称</param>
		/// <param name="DbType">参数类型</param>
		/// <param name="Size">参数大小</param>
		/// <returns>新的 parameter 对象</returns>
		public static SqlParameter CreateOutParam(string ParamName,
			SqlDbType DbType,int Size)
		{
			return CreateParam(ParamName,DbType,Size,ParameterDirection.Output,null);
		}

		/// <summary>
		/// 创建返回类型参数
		/// </summary>
		/// <param name="ParamName">存储过程名称</param>
		/// <param name="DbType">参数类型</param>
		/// <param name="Size">参数大小</param>
		/// <returns>新的 parameter 对象</returns>
		public static SqlParameter CreateReturnParam(string ParamName,
			SqlDbType DbType,int Size)
		{
			return CreateParam(ParamName,DbType,Size,ParameterDirection.ReturnValue,null);
		}

		#endregion

		#region 创建SqlCommand和SqlDataAdapter

		/// <summary>
		/// 创建SqlCommand对象
		/// </summary>
		/// <param name="procName">存储过程的名称</param>
		/// <param name="prams">存储过程所需参数</param>
		/// <returns>返回SqlCommand对象</returns>
		private static SqlCommand CreateSqlCommand(string procName,
			params SqlParameter[] prams)
		{   ///创建数据库连接
			SqlConnection sqlCon = CreateSqlConnection();
			///打开数据库连接
			if(sqlCon == null) return null;
			if(sqlCon.State == ConnectionState.Closed)
			{
				sqlCon.Open();
			}
			///设置SqlCommand的属性
			SqlCommand cmd = new SqlCommand(procName,sqlCon);
			cmd.CommandType = CommandType.StoredProcedure;

			///添加存储过程参数
			if(prams != null)
			{
				foreach(SqlParameter parameter in prams)
				{
					cmd.Parameters.Add(parameter);
				}
			}

			///添加返回参数
			cmd.Parameters.Add(new SqlParameter(returnValueString,
				SqlDbType.Int,4,ParameterDirection.ReturnValue,
				false,0,0,string.Empty,DataRowVersion.Default,null));

			///返回SqlCommand对象
			return cmd;
		}

		/// <summary>
		/// 创建SqlDataAdapter对象
		/// </summary>
		/// <param name="procName">存储过程的名称</param>
		/// <param name="prams">存储过程所需参数</param>
		/// <returns>返回SqlDataAdapter对象</returns>
		private static SqlDataAdapter CreateSqlDataAdapter(string procName,
			params SqlParameter[] prams)
		{   ///创建数据库连接
			SqlConnection sqlCon = CreateSqlConnection();
			///打开数据库连接
			if(sqlCon == null) return null;
			if(sqlCon.State == ConnectionState.Closed)
			{
				sqlCon.Open();
			}
			///设置SqlDataAdapter的属性
			SqlDataAdapter da = new SqlDataAdapter(procName,sqlCon);
			da.SelectCommand.CommandType = CommandType.StoredProcedure;

			///添加存储过程参数
			if(prams != null)
			{
				foreach(SqlParameter parameter in prams)
				{
					da.SelectCommand.Parameters.Add(parameter);
				}
			}

			///添加返回参数
			da.SelectCommand.Parameters.Add(new SqlParameter(returnValueString,
				SqlDbType.Int,4,ParameterDirection.ReturnValue,
				false,0,0,string.Empty,DataRowVersion.Default,null));

			///返回SqlDataAdapter对象
			return da;
		}

		#endregion

		#region 管理连接

		/// <summary>
		/// 创建连接.
		/// </summary>
		private static SqlConnection CreateSqlConnection()
		{   ///获取连接字符串
			string conStr = (string)Cache.GetData(connectionStringNameInWebConfig);

			if(string.IsNullOrEmpty(conStr))
			{   
				try
				{   ///如果连接字符串为空，则从配置文件中获取连接字符串
					conStr = ConfigurationManager.ConnectionStrings[connectionStringNameInWebConfig].ConnectionString;
				}
				catch(Exception ex)
				{
					throw new Exception(ex.Message,ex);
				}
				///把字符串添加到缓存中
				Cache.CachingData(connectionStringNameInWebConfig,conStr);				
			}
			if(!string.IsNullOrEmpty(conStr))
			{	/// 创建数据库连接
				return(new SqlConnection(conStr));
			}
			return null;
		}

		#endregion

		#region 执行存储过程

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程的名称</param>
		/// <returns></returns>
		public static int RunProc(string procName)
		{   ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,null);
			if(cmd == null) return -1;
			try
			{   ///执行存储过程
				cmd.ExecuteNonQuery();
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(cmd.Connection.State == ConnectionState.Open)
				{
					cmd.Connection.Close();
				}
			}

			///返回执行结果
			return (int)cmd.Parameters[returnValueString].Value;
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="prams">存储过程参数</param>
		/// <returns></returns>
		public static int RunProc(string procName,params SqlParameter[] prams)
		{   ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,prams);
			if(cmd == null) return -1;
			try
			{   ///执行存储过程
				cmd.ExecuteNonQuery();
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(cmd.Connection.State == ConnectionState.Open)
				{
					cmd.Connection.Close();
				}
			}

			///返回执行结果
			return (int)cmd.Parameters[returnValueString].Value;		
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="dr">返回SqlDataReader对象</param>
		public static void RunProc(string procName,out SqlDataReader dr)
		{   ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,null);
			if(cmd == null)
			{
				dr = null;
				return;
			}
			try
			{   ///读取数据
				dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
			}		
			catch(Exception ex)
			{
				dr = null;
				throw new Exception(ex.Message,ex);
			}
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="dr">返回SqlDataReader对象</param>
		/// <param name="prams">存储过程参数</param>		
		public static void RunProc(string procName,out SqlDataReader dr,params SqlParameter[] prams)
		{   ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,prams);
			if(cmd == null)
			{
				dr = null;
				return;
			}
			try
			{   ///读取数据
				dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
			}		
			catch(Exception ex)
			{
				dr = null;
				throw new Exception(ex.Message,ex);
			}
		}	

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="ds">返回DataSet对象</param>
		public static void RunProc(string procName,ref DataSet ds)
		{   ///初始化ds
			if(null == ds) ds = new DataSet();
			///创建SqlDataAdapter
			SqlDataAdapter da = CreateSqlDataAdapter(procName,null);
			if(da == null) return;
			try
			{   ///填充数据
				da.Fill(ds);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(da.SelectCommand.Connection.State == ConnectionState.Open)
				{
					da.SelectCommand.Connection.Close();
				}
			}
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="ds">返回DataSet对象</param>
		/// <param name="prams">存储过程参数</param>		
		public static void RunProc(string procName,ref DataSet ds,params SqlParameter[] prams)
		{   ///初始化ds
			if(null == ds) ds = new DataSet();
			///创建SqlDataAdapter
			SqlDataAdapter da = CreateSqlDataAdapter(procName,prams);
			if(da == null) return;
			try
			{   ///填充数据
				da.Fill(ds);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(da.SelectCommand.Connection.State == ConnectionState.Open)
				{
					da.SelectCommand.Connection.Close();
				}
			}
		}
		
		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="ds">返回DataSet对象</param>
		/// <param name="start">开始的记录</param>
		/// <param name="max">最大记录数量</param>
		public static void RunProc(string procName,ref DataSet ds,
			int start,int max)
		{   ///初始化ds
			if(null == ds) ds = new DataSet();
			///创建SqlDataAdapter
			SqlDataAdapter da = CreateSqlDataAdapter(procName,null);
			if(da == null) return;
			try
			{   ///填充数据
				da.Fill(ds,start,max,"TableName");
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(da.SelectCommand.Connection.State == ConnectionState.Open)
				{
					da.SelectCommand.Connection.Close();
				}
			}
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="ds">返回DataSet对象</param>
		/// <param name="start">开始的记录</param>
		/// <param name="max">最大记录数量</param>
		/// <param name="prams">存储过程参数</param>
		public static void RunProc(string procName,ref DataSet ds,
			int start,int max,params SqlParameter[] prams)
		{   ///初始化ds
			if(null == ds) ds = new DataSet();
			///创建SqlDataAdapter
			SqlDataAdapter da = CreateSqlDataAdapter(procName,prams);
			if(da == null) return;
			try
			{   ///填充数据
				da.Fill(ds,start,max,"TableName");
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(da.SelectCommand.Connection.State == ConnectionState.Open)
				{
					da.SelectCommand.Connection.Close();
				}
			}
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <returns>返回存储过程返回值</returns>
		public static int RunProcScalar(string procName)
		{   ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,null);
			if(cmd == null) return -1;
			int result;
			try
			{
				///执行存储过程
				result = (int)cmd.ExecuteScalar();
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(cmd.Connection.State == ConnectionState.Open)
				{
					cmd.Connection.Close();
				}
			}
			///返回查询结果
			return result;
		}

		/// <summary>
		/// 执行存储过程
		/// </summary>
		/// <param name="procName">存储过程名称</param>
		/// <param name="prams">存储过程所需参数</param>
		/// <returns>返回存储过程返回值</returns>
		public static int RunProcScalar(string procName,params SqlParameter[] prams)
		{    ///创建SqlCommand对象
			SqlCommand cmd = CreateSqlCommand(procName,prams);
			if(cmd == null) return -1;
			int result;
			try
			{
				///执行存储过程
				result = (int)cmd.ExecuteScalar();
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			finally
			{   ///关闭连接
				if(cmd.Connection.State == ConnectionState.Open)
				{
					cmd.Connection.Close();
				}
			}
			///返回查询结果
			return result;
		}

		#endregion	
	}

	internal class Cache
	{
		#region 缓存数据

		/// <summary>
		/// 定义缓存区
		/// </summary>
		private static Hashtable cache = Hashtable.Synchronized(new Hashtable());

		/// <summary>
		/// 缓存数据到Cache中，如果已经存在缓存项，则重写缓存的数据。
		/// </summary>
		/// <param name="key"></param>
		/// <param name="value"></param>
		public static void CachingData(string key,object value)
		{
			cache[key] = value;			
		}

		/// <summary>
		/// 获取缓存的数据
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public static object GetData(string key)
		{
			return (object)cache[key];
		}

		#endregion
	}
}
