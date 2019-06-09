using System;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Web2ASPNET2.CommonOperation
{
	/// <summary>
	/// 数据类型转换
	/// </summary>
	public class DataTypeConvert
	{
		#region 数据类型转换

		public DataTypeConvert(){}

		/// <summary>
		/// 字符串转换为整数
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static int ConvertToInt(string value)
		{   ///数据为空，返回-1
			if(string.IsNullOrEmpty(value))return -1;
			int result = -1;
			///执行转换操作
			Int32.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// 字符串转换为时间
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static DateTime ConvertToDateTime(string value)
		{   ///定义初始化值
			DateTime result = DateTime.Parse("1900-01-01");
			if(string.IsNullOrEmpty(value)) return result;
			///执行转换操作
			DateTime.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// 字符串转换为实数
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static decimal ConvertToDecimal(string value)
		{   ///定义初始化值
			decimal result = 0.0M;
			if(string.IsNullOrEmpty(value)) return result;
			///执行转换操作
			decimal.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// 字符串转换为布尔类型
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static bool ConvertToBoolean(string value)
		{   ///定义初始化值
			bool result = false;
			if(string.IsNullOrEmpty(value)) return result;
			///执行转换操作
			bool.TryParse(value,out result);
			return result;
		}

		#endregion
	}

	public class DataBinder
	{
		#region 绑定控件的数据

		public DataBinder() { }

		/// <summary>
		/// 绑定列表控件的数据，数据源为SqlDataReader对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,SqlDataReader dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
			///关闭数据源
			dataSource.Close();
		}

		/// <summary>
		/// 绑定列表控件的数据，数据源为DataSet对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,DataSet dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
		}

		/// <summary>
		/// 绑定列表控件的数据，数据源为DataTable对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,DataTable dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
		}		

		/// <summary>
		/// 绑定GridView控件的数据，数据源为SqlDataReader对象
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,SqlDataReader dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			gv.DataSource = dataSource;
			gv.DataBind();
			///关闭数据源
			dataSource.Close();
		}
		
		/// <summary>
		/// 绑定GridView控件的数据，数据源为DataSet对象
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,DataSet dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			gv.DataSource = dataSource;
			gv.DataBind();
		}

		/// <summary>
		/// 绑定GridView控件的数据，数据源为DataTable对象
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,DataTable dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			gv.DataSource = dataSource;
			gv.DataBind();
		}

		/// <summary>
		/// 绑定DataList控件的数据，数据源为SqlDataReader对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,SqlDataReader dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataBind();
			///关闭数据源
			dataSource.Close();
		}
		
		/// <summary>
		/// 绑定DataList控件的数据，数据源为DataSet对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,DataSet dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataBind();
		}

		/// <summary>
		/// 绑定DataList控件的数据，数据源为DataTable对象
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,DataTable dataSource)
		{
			if(dataSource == null) { return; }
			///绑定数据
			list.DataSource = dataSource;
			list.DataBind();
		}

		#endregion
	}

	public class ButtonEnable
	{
		#region 设置按钮的可用性

		public ButtonEnable() { }

		/// <summary>
		/// 根据整数列表设置按钮的可用性
		/// </summary>
		/// <param name="button"></param>
		/// <param name="idList"></param>
		public static void ControlButtonEnable(Button button,int[] idList)
		{   ///计算按钮的可用性
			bool IsEnabled = true;
			///列表为空
			if(idList == null)
			{
				button.Enabled = IsEnabled;
				return;
			}
			foreach(int id in idList)
			{   ///如果id值大于0，则按钮可用
				IsEnabled = IsEnabled && (id > 0 ? true : false);
				if(IsEnabled == false) { break; }
			}
			button.Enabled = IsEnabled;
		}

		/// <summary>
		/// 根据列表控件列表设置按钮的可用性
		/// </summary>
		/// <param name="button"></param>
		/// <param name="listControl"></param>
		public static void ControlButtonEnable(Button button,
			params ListControl[] listControl)
		{			
			bool IsEnabled = true;
			///列表为空
			if(listControl == null)
			{
				button.Enabled = IsEnabled;
				return;
			}
			foreach(ListControl control in listControl)
			{
				if(control != null)
				{   ///列表包含选择项，则按钮可用
					IsEnabled = IsEnabled && (control.Items.Count > 0 ? true : false);
					if(IsEnabled == false) { break; }
				}
			}
			button.Enabled = IsEnabled;
		}

		/// <summary>
		/// 根据整数列表和列表控件列表共同设置按钮的可用性
		/// </summary>
		/// <param name="button"></param>
		/// <param name="idList"></param>
		/// <param name="listControl"></param>
		public static void ControlButtonEnable(Button button,int[] idList,
			params ListControl[] listControl)
		{   ///根据参数idList设置按钮可用性
			ControlButtonEnable(button,idList);
			///根据参数listControl设置按钮的可用性
			ControlButtonEnable(button,listControl);
		}

		#endregion
	}

	public class ListSelectedItem
	{
		#region 设置列表控件的选择项

		public ListSelectedItem() { }

		/// <summary>
		///  根据Value属性把列表控件的选择项设置为指定项
		/// </summary>
		/// <param name="list"></param>
		/// <param name="value"></param>
		public static void ListSelectedItemByValue(ListControl list,string value)
		{
			if(list == null) return;
			///选择项为空
			if(list.Items.Count <= 0)
			{
				list.SelectedIndex = -1;
				return;
			}
		    ///逐项进行比较，设置选择项
			for(int i = 0; i < list.Items.Count; i++)
			{
				if(list.Items[i].Value == value)
				{
					list.SelectedIndex = i;
					return;
				}
			}
			///没有符合条件的选择项
			list.SelectedIndex = -1;
		}

		/// <summary>
		/// 根据Text属性把列表控件的选择项设置为指定项
		/// </summary>
		/// <param name="list"></param>
		/// <param name="text"></param>
		public static void ListSelectedItemByText(ListControl list,string text)
		{
			if(list == null) return;
			///选择项为空
			if(list.Items.Count <= 0)
			{
				list.SelectedIndex = -1;
				return;
			}
			///逐项进行比较，设置选择项
			for(int i = 0; i < list.Items.Count; i++)
			{
				if(list.Items[i].Text == text)
				{
					list.SelectedIndex = i;
					return;
				}
			}
			///没有符合条件的选择项
			list.SelectedIndex = -1;
		}

		#endregion
	}

	public class DealwithString
	{
		#region 字符串处理

		public DealwithString() { }

		/// <summary>
		/// 根据时间创建字符串
		/// </summary>
		/// <returns></returns>
		public static string CreatedStringByTime()
		{
			DateTime now = DateTime.Now;
			string str = now.Year.ToString()
				+ now.Month.ToString()
				+ now.Day.ToString()
				+ now.Hour.ToString()
				+ now.Minute.ToString()
				+ now.Second.ToString()
				+ now.Millisecond.ToString();
			return (str);
		}

		/// <summary>
		/// 格式化显示字符串的长度，如果超过指定的长度，则显示...
		/// </summary>
		/// <param name="str"></param>
		/// <param name="length"></param>
		/// <returns></returns>
		public static string FormatStringLength(string str,int length)
		{
			if(string.IsNullOrEmpty(str)) return string.Empty;

			///如果包含中文字符，中文字符的长度加倍
			if(Encoding.UTF8.GetByteCount(str) > str.Length)
			{   ///调整为中文的长度，等于英文的一半
				length = length / 2;
			}
			if(str.Length > length)
			{
				return str.Substring(0,length) + "...";
			}
			return str;
		}

		#endregion
	}

	public class Dialog
	{
		public Dialog() { }

		#region 显示对话框

		public static void OpenDialog(HttpResponse response,string message)
		{
			response.Write("<script>alert('" + message + "')</script>");
		}

		public static void OpenDialogInAjax(Control c,string message)
		{
			ScriptManager.RegisterClientScriptBlock(
				c,
				c.GetType(),
				c.ID + DealwithString.CreatedStringByTime(),
				"alert('" + message + "')",
				true);
		}
		#endregion
	}
}
