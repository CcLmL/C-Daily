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

public partial class AddExam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化考题操作类
        ExamManager myexam = new ExamManager();
        //调用类中添加考题的方法
       bool result= myexam.AddExamination(txttitle.Text, txtoption1.Text, 
            txtoption2.Text, txtoption3.Text, txtresult.Text);
        //判断执行结果
       if (result)
           //提示信息
           Literal1.Text = "考题添加成功！";
    }
}
