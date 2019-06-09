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
using System.Text.RegularExpressions;
using System.Text;
using System.Web.Configuration;

public partial class test2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
        Button1.Text= DateTime.Now.ToShortDateString();
        Label2.Text = DateTime.Now.ToString("yyyy-mm-dd");
        Regex rx = new Regex(@"^-?\d+(\.\d{2})?$");
        string[] tests = { "-65", "22.01", "1.0009", "600 EUR" };
        foreach (string test in tests)
        {
            if (rx.IsMatch(test))
            {
               sb.Append(test +"是货币");
            }
            else
            {
                sb.Append(test +"非货币");
            }
        }
        Response.Write(sb);

        ////添加命令类型
        //SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
        ////添加命令
        //SqlDataSource1.InsertCommand = "insert into stock values(@stockid,@stockname,@stockprice,@stockcount)";
        ////自定义4个添加命令中需要的参数
        //Parameter stockid=new Parameter("@stockid",TypeCode.String,"1008");
        //Parameter stockname=new Parameter("@stockname",TypeCode.String,"空调");
        //Parameter stockprice=new Parameter("@stockprice",TypeCode.Double,"1500");
        //Parameter stockcount=new Parameter("@stockcount",TypeCode.Int32,"100");
        ////给Insert操作添加参数
        //SqlDataSource1.InsertParameters.Add(stockid);
        //SqlDataSource1.InsertParameters.Add(stockname);
        //SqlDataSource1.InsertParameters.Add(stockprice);
        //SqlDataSource1.InsertParameters.Add(stockcount);
        ////执行添加操作
        //SqlDataSource1.Insert();
        //





    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ArrayList mylist = new ArrayList();
        mylist.Add("china");
        mylist.Add("London");
        mylist.Add("english");
        GridView1.DataSource = mylist;
        GridView1.DataBind();
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Response.Write("添加完成");
    }
    protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        Response.Write("正在添加");
    }
}
