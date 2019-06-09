using System;
using System.Text;
using System.Xml;
using System.Xml.XPath;
using System.Collections;
using System.Data;
using Web2ASPNET2.CommonOperation;

namespace Web2ASPNET2.OperateXmlDatabase
{
	public enum ParameterDirection
	{
		Insert,
		Update,
		Equal,
		NotEqual,
		Little,
		Great,
		Like
	}
		
	public sealed class XmlParamter
	{
		public XmlParamter(){}

		private string name;
		public string Name
		{
			get { return this.name; }
			set { this.name = value; }
		}

		private string value;
		public string Value
		{
			get { return this.value; }
			set { this.value = value; }
		}

		private ParameterDirection direction;
		public ParameterDirection Direction
		{
			get { return this.direction; }
			set { this.direction = value; }
		}
	}
	
	public class XmlDatabase
	{
		public XmlDatabase() { }

		#region ��ȡ����

		public static DataTable GetData(string path,string tableName)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///����XML�ĵ�
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			DataTable dt = new DataTable();
			///��ȡ���ڵ�
			XmlNode rootNode = doc.SelectSingleNode("/" + tableName + "s");
			if(rootNode == null) return null;
			if(rootNode.ChildNodes.Count <= 0) return null;
			///���������¼��������
			foreach(XmlAttribute attr in rootNode.ChildNodes[0].Attributes)
			{
				dt.Columns.Add(new DataColumn(attr.Name,typeof(string)));
			}

			///���»�ȡ���ݽڵ��XPath
			string xmlPath = "/" + tableName + "s/" + tableName;
			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			///��ӽڵ������
			foreach(XmlNode node in nodeList)
			{
				DataRow row = dt.NewRow();
				foreach(DataColumn column in dt.Columns)
				{   ///��ȡÿһ������
					row[column.ColumnName] = node.Attributes[column.ColumnName].Value;
				}
				dt.Rows.Add(row);
			}
			return dt;
		}

		public static DataTable GetData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///����XML�ĵ�
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			DataTable dt = new DataTable();
			///��ȡ���ڵ�
			XmlNode rootNode = doc.SelectSingleNode("/" + tableName + "s");
			if(rootNode == null) return null;
			if(rootNode.ChildNodes.Count == 0) return null;
			///���������¼��������
			foreach(XmlAttribute attr in rootNode.ChildNodes[0].Attributes)
			{
				dt.Columns.Add(new DataColumn(attr.Name,typeof(string)));
			}

			///���»�ȡ���ݽڵ��XPath
			string xmlPath = "/" + tableName + "s/" + tableName;
			int operationCount = 0;
			StringBuilder operation = new StringBuilder();
			foreach(XmlParamter p in param)
			{
				if(p.Direction == ParameterDirection.Insert
					|| p.Direction == ParameterDirection.Update)
				{
					continue;
				}
				///�����������ʽ
				switch(p.Direction)
				{
					case ParameterDirection.Equal:
						operation.Append("@" + p.Name + "='" + p.Value + "'");
						break;
					case ParameterDirection.NotEqual:
						operation.Append("@" + p.Name + "<>'" + p.Value + "'");
						break;
					case ParameterDirection.Little:
						operation.Append("@" + p.Name + "<'" + p.Value + "'");
						break;
					case ParameterDirection.Great:
						operation.Append("@" + p.Name + ">'" + p.Value + "'");
						break;
					case ParameterDirection.Like:
						operation.Append("contains(@" + p.Name + ",'" + p.Value + "')");
						break;
					default: break;
				}
				operationCount++;
				operation.Append(" and ");
			}
			if(operationCount > 0)
			{   ///����XPath
				operation.Remove(operation.Length - 5,5);
				xmlPath += "[" + operation.ToString() + "]";
			}

			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			///��ӽڵ������
			foreach(XmlNode node in nodeList)
			{
				DataRow row = dt.NewRow();
				foreach(DataColumn column in dt.Columns)
				{   ///��ȡÿһ������
					row[column.ColumnName] = node.Attributes[column.ColumnName].Value;
				}
				dt.Rows.Add(row);
			}
			return dt;
		}

		#endregion

		#region �������

		public static int AddData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///����XML�ĵ�
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}			

			///ѡ����ڵ�
			XmlNode node = doc.SelectSingleNode("/" + tableName + "s");
			if(node == null) return -1;
			///�����¼�¼��IDֵ
			int newID = DataTypeConvert.ConvertToInt(node.LastChild.Attributes["ID"].Value) + 1;
			if(newID < 1) return -1;
			///����һ���½ڵ�
			XmlNode newNode = doc.CreateNode(XmlNodeType.Element,tableName,null);
			if(newNode == null)return -1;
			///���ID��ֵ
			newNode.Attributes.Append(CreateNodeAttribute(doc,"ID",newID.ToString()));
			///����½ڵ������
			foreach(XmlParamter p in param)
			{
				newNode.Attributes.Append(CreateNodeAttribute(doc,p.Name,p.Value));
			}
			///���½ڵ�׷�ӵ����ڵ���
			node.AppendChild(newNode);

			try
			{   ///����XML�ĵ�
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return newID;
		}

		#endregion

		#region ��������

		public static int UpdateData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///����XML�ĵ�
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///����ѡ���޸Ľڵ��XPath
			string xmlPath = "/" + tableName + "s/" + tableName;
			int operationCount = 0;
			StringBuilder operation = new StringBuilder();
			foreach(XmlParamter p in param)
			{
				if(p.Direction == ParameterDirection.Insert
					|| p.Direction == ParameterDirection.Update)
				{
					continue;
				}				
				switch(p.Direction)
				{
					case ParameterDirection.Equal:
						operation.Append("@" + p.Name + "='" + p.Value + "'");
						break;
					case ParameterDirection.NotEqual:
						operation.Append("@" + p.Name + "<>'" + p.Value + "'");
						break;
					case ParameterDirection.Little:
						operation.Append("@" + p.Name + "<'" + p.Value + "'");
						break;
					case ParameterDirection.Great:
						operation.Append("@" + p.Name + ">'" + p.Value + "'");
						break;
					case ParameterDirection.Like:
						operation.Append("contains(@" + p.Name + ",'" + p.Value + "')");
						break;
					default: break;
				}
				operationCount++;
				operation.Append(" and ");
			}
			if(operationCount > 0)
			{				
				operation.Remove(operation.Length - 5,5);
				xmlPath += "[" + operation.ToString() + "]";
			}

			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			if(nodeList == null) return -1;
			///�޸Ľڵ������
			foreach(XmlNode node in nodeList)
			{	///�޸ĵ����ڵ������
				foreach(XmlParamter p in param)
				{
					if(p.Direction == ParameterDirection.Update)
					{
						node.Attributes[p.Name].Value = p.Value;
					}
				}
			}

			try
			{   ///����XML�ĵ�
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return nodeList.Count;
		}

		#endregion

		#region ɾ������

		public static int DeleteData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///����XML�ĵ�
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///����ѡ���޸Ľڵ��XPath
			string xmlPath = "/" + tableName + "s/" + tableName;
			int operationCount = 0;
			StringBuilder operation = new StringBuilder();
			foreach(XmlParamter p in param)
			{
				if(p.Direction == ParameterDirection.Insert
					|| p.Direction == ParameterDirection.Update)
				{
					continue;
				}
				switch(p.Direction)
				{
					case ParameterDirection.Equal:
						operation.Append("@" + p.Name + "='" + p.Value + "'");
						break;
					case ParameterDirection.NotEqual:
						operation.Append("@" + p.Name + "<>'" + p.Value + "'");
						break;
					case ParameterDirection.Little:
						operation.Append("@" + p.Name + "<'" + p.Value + "'");
						break;
					case ParameterDirection.Great:
						operation.Append("@" + p.Name + ">'" + p.Value + "'");
						break;
					case ParameterDirection.Like:
						operation.Append("contains(@" + p.Name + ",'" + p.Value + "')");
						break;
					default: break;
				}
				operationCount++;
				operation.Append(" and ");
			}
			if(operationCount > 0)
			{
				operation.Remove(operation.Length - 5,5);
				xmlPath += "[" + operation.ToString() + "]";
			}

			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			if(nodeList == null) return -1;
			///ɾ����ѡ��Ľڵ�
			foreach(XmlNode node in nodeList)
			{	///ɾ�������ڵ�
				XmlNode parentNode = node.ParentNode;
				parentNode.RemoveChild(node);
			}

			try
			{   ///����XML�ĵ�
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return nodeList.Count;
		}

		#endregion 

		#region ��������

		private static XmlAttribute CreateNodeAttribute(XmlDocument doc,String name,String value)
		{
			XmlAttribute attribute = doc.CreateAttribute(name,null);
			attribute.Value = value;
			return attribute;
		}

		private static XmlParamter CreateParameter(string name,string value,ParameterDirection direciton)
		{
			XmlParamter p = new XmlParamter();
			p.Name = name;
			p.Value = value;
			p.Direction = direciton;

			return p;
		}

		public static XmlParamter CreateInsertParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Insert);
		}
		public static XmlParamter CreateUpdateParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Update);
		}
		public static XmlParamter CreateEqualParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Equal);
		}
		public static XmlParamter CreateGreatParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Great);
		}
		public static XmlParamter CreateLittleParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Little);
		}
		public static XmlParamter CreateNotEqualParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.NotEqual);
		}
		public static XmlParamter CreateLikeParameter(string name,string value)
		{
			return CreateParameter(name,value,ParameterDirection.Like);
		}

		#endregion
	}
}
