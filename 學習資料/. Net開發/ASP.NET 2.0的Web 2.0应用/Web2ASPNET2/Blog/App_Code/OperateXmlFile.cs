using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Xml;
using Web2ASPNET2.CommonOperation;

namespace Web2ASPNET2.WebBlog
{
	public class OperateXmlFile
	{
		public OperateXmlFile()
		{

		}

		/// <summary>
		/// 获取系统所有皮肤的名称
		/// </summary>
		/// <returns></returns>
		public static ArrayList GetFaces()
		{
			ArrayList faces = new ArrayList();
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(WebBlog.BoardFilePath);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///根据XPath获取数据节点
			XmlNode rootNode = doc.SelectSingleNode("/Faces");
			if(rootNode == null) return null;
			foreach(XmlNode node in rootNode.ChildNodes)
			{
				faces.Add(node.Name);
			}
			return faces;			
		}

		//<Default>
		//    <Index>
		//        <ID>LeftPanel</ID>
		//        <Width>800</Width>
		//        <Height>200</Height>
		//        <BgColor>#DAEEEE</BgColor>
		//        <ForeColor>Black</ForeColor>
		//        <Modules>
		//            <!-- 必须以0开头进行排序 -->
		//            <Module>
		//                <Title>文章列表</Title>
		//                <ShowOrder>0</ShowOrder>
		//                <Src>~/Index/IndexUserControl/ArticleUC.ascx</Src>
		//                <CommandArgument></CommandArgument>				
		//            </Module>
		//        </Modules>
		//    </Index>
		//</Default>
		
		/// <summary>
		/// 获取页面的模块及其配置
		/// </summary>
		/// <param name="face"></param>
		/// <returns></returns>
		public static TableCellBase[] GetIndexPage(string face)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(WebBlog.BoardFilePath);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}
			
			///根据XPath获取数据节点
			XmlNodeList nodeList = doc.SelectNodes("/Faces/" + face + "/Index");
			if(nodeList.Count <= 0) return null;
			TableCellBase[] cellList = new TableCellBase[nodeList.Count];
			int i = 0;
			///添加节点的数据
			foreach(XmlNode node in nodeList)
			{   ///获取页面的基本配置
				TableCellBase cell = new TableCellBase();
				cell.ID = node.ChildNodes[0].InnerText;
				cell.Width = node.ChildNodes[1].InnerText;
				cell.Height = node.ChildNodes[2].InnerText;
				cell.BgColor = node.ChildNodes[3].InnerText;
				cell.ForeColor = node.ChildNodes[4].InnerText;
				
				XmlNodeList moduleNodeList = node.ChildNodes[5].SelectNodes("Module");
				if(moduleNodeList == null)
				{
					cellList[i++] = cell;
					cell.Modules = null; 
					continue;
				}
				cell.Modules = new System.Collections.ArrayList(moduleNodeList.Count);
				///初始化列表
				for(int j = 0; j < cell.Modules.Capacity; j++)
				{
					cell.Modules.Add(null);
				}
				foreach(XmlNode mNode in moduleNodeList)
				{   ///读取模块的配置
					UserControlBase uc = new UserControlBase();
					uc.Title = mNode.ChildNodes[0].InnerText;
					uc.ShowOrder = DataTypeConvert.ConvertToInt(mNode.ChildNodes[1].InnerText);
					uc.Src = mNode.ChildNodes[2].InnerText;
					cell.Modules[uc.ShowOrder] = uc;
				}
				cellList[i++] = cell;
			}
			return cellList;
		}

		/// <summary>
		/// 获取文章页面的模块及其配置
		/// </summary>
		/// <param name="face"></param>
		/// <returns></returns>
		public static TableCellBase[] GetShowArticlePage(string face)
		{
			XmlDocument doc = new XmlDocument();

			try
			{   ///导入XML文档
				doc.Load(WebBlog.BoardFilePath);
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message,ex);
			}

			///根据XPath获取数据节点
			XmlNodeList nodeList = doc.SelectNodes("/Faces/" + face + "/Article");
			if(nodeList.Count <= 0) return null;
			TableCellBase[] cellList = new TableCellBase[nodeList.Count];
			int i = 0;
			///添加节点的数据
			foreach(XmlNode node in nodeList)
			{   ///获取页面的基本配置
				TableCellBase cell = new TableCellBase();
				cell.ID = node.ChildNodes[0].InnerText;
				cell.Width = node.ChildNodes[1].InnerText;
				cell.Height = node.ChildNodes[2].InnerText;
				cell.BgColor = node.ChildNodes[3].InnerText;
				cell.ForeColor = node.ChildNodes[4].InnerText;

				XmlNodeList moduleNodeList = node.ChildNodes[5].SelectNodes("Module");
				if(moduleNodeList == null)
				{
					cellList[i++] = cell;
					cell.Modules = null;
					continue;
				}
				cell.Modules = new System.Collections.ArrayList(moduleNodeList.Count);
				///初始化列表
				for(int j = 0; j < cell.Modules.Capacity; j++)
				{
					cell.Modules.Add(null);
				}
				foreach(XmlNode mNode in moduleNodeList)
				{   ///读取模块的配置
					UserControlBase uc = new UserControlBase();
					uc.Title = mNode.ChildNodes[0].InnerText;
					uc.ShowOrder = DataTypeConvert.ConvertToInt(mNode.ChildNodes[1].InnerText);
					uc.Src = mNode.ChildNodes[2].InnerText;
					cell.Modules[uc.ShowOrder] = uc;
				}
				cellList[i++] = cell;
			}
			return cellList;
		}
	}
}
