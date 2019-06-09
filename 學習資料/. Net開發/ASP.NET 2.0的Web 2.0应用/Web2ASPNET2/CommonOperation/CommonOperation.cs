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
	/// ��������ת��
	/// </summary>
	public class DataTypeConvert
	{
		#region ��������ת��

		public DataTypeConvert(){}

		/// <summary>
		/// �ַ���ת��Ϊ����
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static int ConvertToInt(string value)
		{   ///����Ϊ�գ�����-1
			if(string.IsNullOrEmpty(value))return -1;
			int result = -1;
			///ִ��ת������
			Int32.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// �ַ���ת��Ϊʱ��
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static DateTime ConvertToDateTime(string value)
		{   ///�����ʼ��ֵ
			DateTime result = DateTime.Parse("1900-01-01");
			if(string.IsNullOrEmpty(value)) return result;
			///ִ��ת������
			DateTime.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// �ַ���ת��Ϊʵ��
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static decimal ConvertToDecimal(string value)
		{   ///�����ʼ��ֵ
			decimal result = 0.0M;
			if(string.IsNullOrEmpty(value)) return result;
			///ִ��ת������
			decimal.TryParse(value,out result);
			return result;
		}

		/// <summary>
		/// �ַ���ת��Ϊ��������
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static bool ConvertToBoolean(string value)
		{   ///�����ʼ��ֵ
			bool result = false;
			if(string.IsNullOrEmpty(value)) return result;
			///ִ��ת������
			bool.TryParse(value,out result);
			return result;
		}

		#endregion
	}

	public class DataBinder
	{
		#region �󶨿ؼ�������

		public DataBinder() { }

		/// <summary>
		/// ���б�ؼ������ݣ�����ԴΪSqlDataReader����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,SqlDataReader dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
			///�ر�����Դ
			dataSource.Close();
		}

		/// <summary>
		/// ���б�ؼ������ݣ�����ԴΪDataSet����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,DataSet dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
		}

		/// <summary>
		/// ���б�ؼ������ݣ�����ԴΪDataTable����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		/// <param name="dataTextField"></param>
		/// <param name="dataValueField"></param>
		public static void BindListData(ListControl list,DataTable dataSource,
			string dataTextField,string dataValueField)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataTextField = dataTextField;
			list.DataValueField = dataValueField;
			list.DataBind();
		}		

		/// <summary>
		/// ��GridView�ؼ������ݣ�����ԴΪSqlDataReader����
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,SqlDataReader dataSource)
		{
			if(dataSource == null) { return; }
			///������
			gv.DataSource = dataSource;
			gv.DataBind();
			///�ر�����Դ
			dataSource.Close();
		}
		
		/// <summary>
		/// ��GridView�ؼ������ݣ�����ԴΪDataSet����
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,DataSet dataSource)
		{
			if(dataSource == null) { return; }
			///������
			gv.DataSource = dataSource;
			gv.DataBind();
		}

		/// <summary>
		/// ��GridView�ؼ������ݣ�����ԴΪDataTable����
		/// </summary>
		/// <param name="gv"></param>
		/// <param name="dataSource"></param>
		public static void BindGridViewData(GridView gv,DataTable dataSource)
		{
			if(dataSource == null) { return; }
			///������
			gv.DataSource = dataSource;
			gv.DataBind();
		}

		/// <summary>
		/// ��DataList�ؼ������ݣ�����ԴΪSqlDataReader����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,SqlDataReader dataSource)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataBind();
			///�ر�����Դ
			dataSource.Close();
		}
		
		/// <summary>
		/// ��DataList�ؼ������ݣ�����ԴΪDataSet����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,DataSet dataSource)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataBind();
		}

		/// <summary>
		/// ��DataList�ؼ������ݣ�����ԴΪDataTable����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="dataSource"></param>
		public static void BindDataListData(DataList list,DataTable dataSource)
		{
			if(dataSource == null) { return; }
			///������
			list.DataSource = dataSource;
			list.DataBind();
		}

		#endregion
	}

	public class ButtonEnable
	{
		#region ���ð�ť�Ŀ�����

		public ButtonEnable() { }

		/// <summary>
		/// ���������б����ð�ť�Ŀ�����
		/// </summary>
		/// <param name="button"></param>
		/// <param name="idList"></param>
		public static void ControlButtonEnable(Button button,int[] idList)
		{   ///���㰴ť�Ŀ�����
			bool IsEnabled = true;
			///�б�Ϊ��
			if(idList == null)
			{
				button.Enabled = IsEnabled;
				return;
			}
			foreach(int id in idList)
			{   ///���idֵ����0����ť����
				IsEnabled = IsEnabled && (id > 0 ? true : false);
				if(IsEnabled == false) { break; }
			}
			button.Enabled = IsEnabled;
		}

		/// <summary>
		/// �����б�ؼ��б����ð�ť�Ŀ�����
		/// </summary>
		/// <param name="button"></param>
		/// <param name="listControl"></param>
		public static void ControlButtonEnable(Button button,
			params ListControl[] listControl)
		{			
			bool IsEnabled = true;
			///�б�Ϊ��
			if(listControl == null)
			{
				button.Enabled = IsEnabled;
				return;
			}
			foreach(ListControl control in listControl)
			{
				if(control != null)
				{   ///�б����ѡ�����ť����
					IsEnabled = IsEnabled && (control.Items.Count > 0 ? true : false);
					if(IsEnabled == false) { break; }
				}
			}
			button.Enabled = IsEnabled;
		}

		/// <summary>
		/// ���������б���б�ؼ��б�ͬ���ð�ť�Ŀ�����
		/// </summary>
		/// <param name="button"></param>
		/// <param name="idList"></param>
		/// <param name="listControl"></param>
		public static void ControlButtonEnable(Button button,int[] idList,
			params ListControl[] listControl)
		{   ///���ݲ���idList���ð�ť������
			ControlButtonEnable(button,idList);
			///���ݲ���listControl���ð�ť�Ŀ�����
			ControlButtonEnable(button,listControl);
		}

		#endregion
	}

	public class ListSelectedItem
	{
		#region �����б�ؼ���ѡ����

		public ListSelectedItem() { }

		/// <summary>
		///  ����Value���԰��б�ؼ���ѡ��������Ϊָ����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="value"></param>
		public static void ListSelectedItemByValue(ListControl list,string value)
		{
			if(list == null) return;
			///ѡ����Ϊ��
			if(list.Items.Count <= 0)
			{
				list.SelectedIndex = -1;
				return;
			}
		    ///������бȽϣ�����ѡ����
			for(int i = 0; i < list.Items.Count; i++)
			{
				if(list.Items[i].Value == value)
				{
					list.SelectedIndex = i;
					return;
				}
			}
			///û�з���������ѡ����
			list.SelectedIndex = -1;
		}

		/// <summary>
		/// ����Text���԰��б�ؼ���ѡ��������Ϊָ����
		/// </summary>
		/// <param name="list"></param>
		/// <param name="text"></param>
		public static void ListSelectedItemByText(ListControl list,string text)
		{
			if(list == null) return;
			///ѡ����Ϊ��
			if(list.Items.Count <= 0)
			{
				list.SelectedIndex = -1;
				return;
			}
			///������бȽϣ�����ѡ����
			for(int i = 0; i < list.Items.Count; i++)
			{
				if(list.Items[i].Text == text)
				{
					list.SelectedIndex = i;
					return;
				}
			}
			///û�з���������ѡ����
			list.SelectedIndex = -1;
		}

		#endregion
	}

	public class DealwithString
	{
		#region �ַ�������

		public DealwithString() { }

		/// <summary>
		/// ����ʱ�䴴���ַ���
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
		/// ��ʽ����ʾ�ַ����ĳ��ȣ��������ָ���ĳ��ȣ�����ʾ...
		/// </summary>
		/// <param name="str"></param>
		/// <param name="length"></param>
		/// <returns></returns>
		public static string FormatStringLength(string str,int length)
		{
			if(string.IsNullOrEmpty(str)) return string.Empty;

			///������������ַ��������ַ��ĳ��ȼӱ�
			if(Encoding.UTF8.GetByteCount(str) > str.Length)
			{   ///����Ϊ���ĵĳ��ȣ�����Ӣ�ĵ�һ��
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

		#region ��ʾ�Ի���

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
