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

		#region 获取数据

		public static DataTable GetData(string path,string tableName)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			DataTable dt = new DataTable();
			///获取根节点
			XmlNode rootNode = doc.SelectSingleNode("/" + tableName + "s");
			if(rootNode == null) return null;
			if(rootNode.ChildNodes.Count <= 0) return null;
			///创建保存记录的数据列
			foreach(XmlAttribute attr in rootNode.ChildNodes[0].Attributes)
			{
				dt.Columns.Add(new DataColumn(attr.Name,typeof(string)));
			}

			///创新获取数据节点的XPath
			string xmlPath = "/" + tableName + "s/" + tableName;
			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			///添加节点的数据
			foreach(XmlNode node in nodeList)
			{
				DataRow row = dt.NewRow();
				foreach(DataColumn column in dt.Columns)
				{   ///读取每一个属性
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
			{   ///导入XML文档
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			DataTable dt = new DataTable();
			///获取根节点
			XmlNode rootNode = doc.SelectSingleNode("/" + tableName + "s");
			if(rootNode == null) return null;
			if(rootNode.ChildNodes.Count == 0) return null;
			///创建保存记录的数据列
			foreach(XmlAttribute attr in rootNode.ChildNodes[0].Attributes)
			{
				dt.Columns.Add(new DataColumn(attr.Name,typeof(string)));
			}

			///创新获取数据节点的XPath
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
				///创建条件表达式
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
			{   ///修正XPath
				operation.Remove(operation.Length - 5,5);
				xmlPath += "[" + operation.ToString() + "]";
			}

			XmlNodeList nodeList = doc.SelectNodes(xmlPath);
			///添加节点的数据
			foreach(XmlNode node in nodeList)
			{
				DataRow row = dt.NewRow();
				foreach(DataColumn column in dt.Columns)
				{   ///读取每一个属性
					row[column.ColumnName] = node.Attributes[column.ColumnName].Value;
				}
				dt.Rows.Add(row);
			}
			return dt;
		}

		#endregion

		#region 添加数据

		public static int AddData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}			

			///选择根节点
			XmlNode node = doc.SelectSingleNode("/" + tableName + "s");
			if(node == null) return -1;
			///创建新记录的ID值
			int newID = DataTypeConvert.ConvertToInt(node.LastChild.Attributes["ID"].Value) + 1;
			if(newID < 1) return -1;
			///创建一个新节点
			XmlNode newNode = doc.CreateNode(XmlNodeType.Element,tableName,null);
			if(newNode == null)return -1;
			///添加ID的值
			newNode.Attributes.Append(CreateNodeAttribute(doc,"ID",newID.ToString()));
			///添加新节点的属性
			foreach(XmlParamter p in param)
			{
				newNode.Attributes.Append(CreateNodeAttribute(doc,p.Name,p.Value));
			}
			///将新节点追加到根节点中
			node.AppendChild(newNode);

			try
			{   ///保存XML文档
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return newID;
		}

		#endregion

		#region 更新数据

		public static int UpdateData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///创新选择被修改节点的XPath
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
			///修改节点的属性
			foreach(XmlNode node in nodeList)
			{	///修改单个节点的属性
				foreach(XmlParamter p in param)
				{
					if(p.Direction == ParameterDirection.Update)
					{
						node.Attributes[p.Name].Value = p.Value;
					}
				}
			}

			try
			{   ///保存XML文档
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return nodeList.Count;
		}

		#endregion

		#region 删除数据

		public static int DeleteData(string path,string tableName,params XmlParamter[] param)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///创新选择被修改节点的XPath
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
			///删除被选择的节点
			foreach(XmlNode node in nodeList)
			{	///删除单个节点
				XmlNode parentNode = node.ParentNode;
				parentNode.RemoveChild(node);
			}

			try
			{   ///保存XML文档
				doc.Save(path);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			return nodeList.Count;
		}

		#endregion 

		#region 创建参数

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
