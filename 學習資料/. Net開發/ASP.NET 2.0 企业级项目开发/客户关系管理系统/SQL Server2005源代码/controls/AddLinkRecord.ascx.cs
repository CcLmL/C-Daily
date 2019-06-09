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

public partial class controls_AddLinkRecord : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //初始化联系记录实体，并赋值。
        LinkRecordEntity record = new LinkRecordEntity();
        record.Name = txtname.Text;
        record.UserName = txtusername.Text;
        record.Note = txtnote.Text;
        //判断日期是否选择，如果未选择，使用默认日期
        if(Calendar1.SelectedDate.Year !=1)
            record.LinkDate = Calendar1.SelectedDate;
        //调用实体的添加方法
        LinkRecordDA myda = new LinkRecordDA();
        bool result=myda.InsertLinkRecord(record);
        if (result)
            Label1.Text = "添加成功";
    }
}
