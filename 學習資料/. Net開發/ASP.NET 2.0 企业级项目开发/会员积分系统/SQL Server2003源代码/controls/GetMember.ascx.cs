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

public partial class controls_GetMember : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //通过会员卡号查询
        //设置数据源的查询方法
        ObjectDataSource1.SelectMethod = "GetMemberInfoByCardNum";
        //设置查询方法中的参数
        Parameter parm = new Parameter("cardnum");
        //为参数赋值，默认为0
        if (TextBox1.Text == "")
            parm.DefaultValue = "0";
        else
            parm.DefaultValue = TextBox1.Text;

        //清空参数列表
        ObjectDataSource1.SelectParameters.Clear();
        //将参数参加到对象数据源中
        ObjectDataSource1.SelectParameters.Add(parm);
        //通过select方法执行查询操作
        ObjectDataSource1.Select();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //通过会员姓名查询
        //设置数据源的查询方法
        ObjectDataSource1.SelectMethod = "GetMemberInfoByCustName";
        //设置查询方法中的参数
        Parameter parm = new Parameter("custname");
        //为参数赋值，默认为0
        if (TextBox2.Text == "")
            parm.DefaultValue = "0";
        else
            parm.DefaultValue = TextBox2.Text;

        //清空参数列表
        ObjectDataSource1.SelectParameters.Clear();
        //将参数参加到对象数据源中
        ObjectDataSource1.SelectParameters.Add(parm);
        //通过select方法执行查询操作
        ObjectDataSource1.Select();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //通过身份证号查询

        //设置数据源的查询方法
        ObjectDataSource1.SelectMethod = "GetMemberInfoByCustIdentity";
        //设置查询方法中的参数
        Parameter parm = new Parameter("custidentity");
        //为参数赋值，默认为0
        if (TextBox3.Text == "")
            parm.DefaultValue = "0";
        else
            parm.DefaultValue = TextBox3.Text;

        //清空参数列表
        ObjectDataSource1.SelectParameters.Clear();
        //将参数参加到对象数据源中
        ObjectDataSource1.SelectParameters.Add(parm);
        //通过select方法执行查询操作
        ObjectDataSource1.Select();
        
    }
}
