using System;
using System.Data;
using System.Collections;
using System.Xml;

namespace Web2ASPNET2.OperateXmlDatabase
{
	/// <summary>
	/// DataCommon 的摘要说明
	/// </summary>
	public class DataCommon
	{
		private const string IDPARAM = "ID";

		public DataCommon() { }
		
		/// <summary>
		/// 执行不携带参数的查询
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <returns></returns>
		public static DataTable GetDataByNoParam(string path,string tableName)
		{   ///返回执行结果
			return XmlDatabase.GetData(path,tableName);
		}

		/// <summary>
		/// 执行携带ID参数的查询
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static DataTable GetDataByIDParam(string path,string tableName,
			int idValue)
		{   ///创建ID参数
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter(DataCommon.IDPARAM,idValue.ToString())
			};
			///返回执行结果
			return (XmlDatabase.GetData(path,tableName,param));		
		}

		/// <summary>
		/// 执行携带ID的删除操作
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static int DeleteDataIDParam(string path,string tableName,int idValue)
		{	///创建ID参数
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter(DataCommon.IDPARAM,idValue.ToString())
			};
			///返回执行结果
			return (XmlDatabase.DeleteData(path,tableName,param));
		}
	}
}
