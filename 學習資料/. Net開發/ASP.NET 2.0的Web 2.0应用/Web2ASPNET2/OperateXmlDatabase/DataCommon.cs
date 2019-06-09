using System;
using System.Data;
using System.Collections;
using System.Xml;

namespace Web2ASPNET2.OperateXmlDatabase
{
	/// <summary>
	/// DataCommon ��ժҪ˵��
	/// </summary>
	public class DataCommon
	{
		private const string IDPARAM = "ID";

		public DataCommon() { }
		
		/// <summary>
		/// ִ�в�Я�������Ĳ�ѯ
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <returns></returns>
		public static DataTable GetDataByNoParam(string path,string tableName)
		{   ///����ִ�н��
			return XmlDatabase.GetData(path,tableName);
		}

		/// <summary>
		/// ִ��Я��ID�����Ĳ�ѯ
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static DataTable GetDataByIDParam(string path,string tableName,
			int idValue)
		{   ///����ID����
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter(DataCommon.IDPARAM,idValue.ToString())
			};
			///����ִ�н��
			return (XmlDatabase.GetData(path,tableName,param));		
		}

		/// <summary>
		/// ִ��Я��ID��ɾ������
		/// </summary>
		/// <param name="path"></param>
		/// <param name="tableName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static int DeleteDataIDParam(string path,string tableName,int idValue)
		{	///����ID����
			XmlParamter[] param = {
				XmlDatabase.CreateEqualParameter(DataCommon.IDPARAM,idValue.ToString())
			};
			///����ִ�н��
			return (XmlDatabase.DeleteData(path,tableName,param));
		}
	}
}
