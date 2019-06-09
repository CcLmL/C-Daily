using System;
using System.Data;
using System.Data.SqlClient;

namespace Web2ASPNET2.OperateSqlServer
{
	public class DBParameter
	{
		public string ParamName;
		public SqlDbType DBType;
		public int Size;
		public object Value;

		/// <summary>
		/// 构造函数初始化成员变量
		/// </summary>
		/// <param name="paramName"></param>
		/// <param name="dbType"></param>
		/// <param name="size"></param>
		/// <param name="value"></param>
		public DBParameter(string paramName,SqlDbType dbType,int size,
			object value)
		{
			ParamName = paramName;
			DBType = dbType;
			Size = size;
			Value = value;
		}
	}

	/// <summary>
	/// DataCommon 的摘要说明
	/// </summary>
	public class DataCommon
	{
		private const string IDPARAM = "@ID";

		public DataCommon() { }

		/// <summary>
		/// 执行不带参数的存储过程，并返回SqlDataReader对象
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static SqlDataReader GetDataByReader(string procName)
		{
			///定义SqlDataReader对象
			SqlDataReader dr = null;

			///执行存储过程
			OperateDatabase.RunProc(procName,out dr);

			///返回结果
			return dr;
		}

		/// <summary>
		/// 执行不带参数的存储过程，并返回DataSet对象
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static DataSet GetDataByDataSet(string procName)
		{
			///定义DataSet对象
			DataSet ds = new DataSet();

			///执行存储过程
			OperateDatabase.RunProc(procName,ref ds);

			///返回结果
			return ds;
		}

		/// <summary>
		/// 执行参数名称为@ID的存储过程，并返回SqlDataReader对象
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static SqlDataReader GetDataByReaderIDParam(string procName,
			int idValue)
		{
			///定义SqlDataReader
			SqlDataReader dr = null;

			///添加存储过程的参数
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(DataCommon.IDPARAM,SqlDbType.Int,4,idValue)
			};

			///执行存储过程
			OperateDatabase.RunProc(procName,out dr,param);

			///返回结果
			return dr;
		}

		/// <summary>
		/// 执行参数名称为@ID的存储过程，并返回DataSet对象的实例
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static DataSet GetDataByDataSetIDParam(string procName,
			int idValue)
		{
			///定义DataSet对象
			DataSet ds = new DataSet();

			///添加存储过程的参数
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(IDPARAM,SqlDbType.Int,4,idValue)
			};

			///执行存储过程
			OperateDatabase.RunProc(procName,ref ds,param);

			///返回结果
			return ds;
		}

		/// <summary>
		/// 执行不带参数的存储过程
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static int QueryData(string procName)
		{
			///执行存储过程
			return (OperateDatabase.RunProc(procName));
		}

		/// <summary>
		/// 执行参数名称为@ID的存储过程
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static int QueryDataIDParam(string procName,int idValue)
		{
			///添加存储过程的参数
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(IDPARAM,SqlDbType.Int,4,idValue)
			};

			///执行存储过程
			return (OperateDatabase.RunProc(procName,param));
		}

		public static int QueryData(string procName,DBParameter[] dbParam)
		{
			///添加存储过程的参数
			SqlParameter[] param = new SqlParameter[dbParam.Length];
			for(int i = 0; i < dbParam.Length; i++)
			{
				param[i] = OperateDatabase.CreateInParam(
					dbParam[i].ParamName,
					dbParam[i].DBType,
					dbParam[i].Size,
					dbParam[i].Value
				);
			}
			///执行存储过程
			return (OperateDatabase.RunProc(procName,param));
		}
	}
}
