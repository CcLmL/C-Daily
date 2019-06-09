using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ExamView : System.Web.UI.Page
{
    //定义一个变量，表示题号
    protected int count = 0;
    ArrayList mysrc = new ArrayList();
    ArrayList mynew = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //保存系统的答案
        try
        {
            //在加载数据时就将答案保存在数组中
            mysrc.Add( ((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[5].ToString());
            Session["mysrc"] = mysrc;
        }
        catch
        {}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ArrayList mylist1 = (ArrayList)Session["mysrc"];
        ArrayList mylist = new ArrayList();
        for (int i = 0; i < 5; i++)
        {
            //获取textbox的值
            TextBox mybox = (TextBox)DataList1.Controls[i+1].FindControl("txtresult");
            //添加到数组中
            mynew.Add(mybox.Text);
            //两个结果对比
            if (mylist1[i].ToString() == mynew[i].ToString())
            {
                mylist.Add("正确");
            }
            else
            {
                mylist.Add("错误");
            }
        }
        //保存对比答案
        Session["list"] = mylist;
        //转到结果页
        Response.Redirect("ViewResult.aspx");
    }
}
