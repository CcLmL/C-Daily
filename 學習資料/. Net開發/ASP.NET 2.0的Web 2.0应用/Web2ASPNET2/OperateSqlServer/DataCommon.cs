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
		/// ���캯����ʼ����Ա����
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
	/// DataCommon ��ժҪ˵��
	/// </summary>
	public class DataCommon
	{
		private const string IDPARAM = "@ID";

		public DataCommon() { }

		/// <summary>
		/// ִ�в��������Ĵ洢���̣�������SqlDataReader����
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static SqlDataReader GetDataByReader(string procName)
		{
			///����SqlDataReader����
			SqlDataReader dr = null;

			///ִ�д洢����
			OperateDatabase.RunProc(procName,out dr);

			///���ؽ��
			return dr;
		}

		/// <summary>
		/// ִ�в��������Ĵ洢���̣�������DataSet����
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static DataSet GetDataByDataSet(string procName)
		{
			///����DataSet����
			DataSet ds = new DataSet();

			///ִ�д洢����
			OperateDatabase.RunProc(procName,ref ds);

			///���ؽ��
			return ds;
		}

		/// <summary>
		/// ִ�в�������Ϊ@ID�Ĵ洢���̣�������SqlDataReader����
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static SqlDataReader GetDataByReaderIDParam(string procName,
			int idValue)
		{
			///����SqlDataReader
			SqlDataReader dr = null;

			///��Ӵ洢���̵Ĳ���
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(DataCommon.IDPARAM,SqlDbType.Int,4,idValue)
			};

			///ִ�д洢����
			OperateDatabase.RunProc(procName,out dr,param);

			///���ؽ��
			return dr;
		}

		/// <summary>
		/// ִ�в�������Ϊ@ID�Ĵ洢���̣�������DataSet�����ʵ��
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static DataSet GetDataByDataSetIDParam(string procName,
			int idValue)
		{
			///����DataSet����
			DataSet ds = new DataSet();

			///��Ӵ洢���̵Ĳ���
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(IDPARAM,SqlDbType.Int,4,idValue)
			};

			///ִ�д洢����
			OperateDatabase.RunProc(procName,ref ds,param);

			///���ؽ��
			return ds;
		}

		/// <summary>
		/// ִ�в��������Ĵ洢����
		/// </summary>
		/// <param name="procName"></param>
		/// <returns></returns>
		public static int QueryData(string procName)
		{
			///ִ�д洢����
			return (OperateDatabase.RunProc(procName));
		}

		/// <summary>
		/// ִ�в�������Ϊ@ID�Ĵ洢����
		/// </summary>
		/// <param name="procName"></param>
		/// <param name="idValue"></param>
		/// <returns></returns>
		public static int QueryDataIDParam(string procName,int idValue)
		{
			///��Ӵ洢���̵Ĳ���
			SqlParameter[] param = {
				OperateDatabase.CreateInParam(IDPARAM,SqlDbType.Int,4,idValue)
			};

			///ִ�д洢����
			return (OperateDatabase.RunProc(procName,param));
		}

		public static int QueryData(string procName,DBParameter[] dbParam)
		{
			///��Ӵ洢���̵Ĳ���
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
			///ִ�д洢����
			return (OperateDatabase.RunProc(procName,param));
		}
	}
}
