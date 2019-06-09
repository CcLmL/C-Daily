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

public partial class controls_AddWorkLog : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化日志实体类并赋值
        WorkLogEntity worklog = new WorkLogEntity();
        worklog.Name = txtname.Text;
        worklog.Title = txttitle.Text;
        worklog.Content = txtcontent.Text;
        //调用实体添加方法
        WorkLogDA myda = new WorkLogDA();
        bool result=myda.InsertWorkLog(worklog);
        //查看是否添加成功
        if (result)
            Label1.Text = "添加成功";
    }
}
