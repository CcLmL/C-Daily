using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    //定义表
    static DataTable mytb = new DataTable("testpdf");
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否是回发页面
        if (!Page.IsPostBack)
        {
            //设计Table的结构，共4列
            DataColumn mycol = new DataColumn("Name", typeof(System.String));
            DataColumn mycol1 = new DataColumn("Sex", typeof(System.String));
            DataColumn mycol2 = new DataColumn("Age", typeof(System.String));
            DataColumn mycol3 = new DataColumn("Address", typeof(System.String));
            //将创建的列插入到表中
            mytb.Columns.Add(mycol);
            mytb.Columns.Add(mycol1);
            mytb.Columns.Add(mycol2);
            mytb.Columns.Add(mycol3);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //将目标文件保存在此项目下
        //字体使用simsun
        //字号选择14
        TableToPDF.ConvertDataTableToPDF(mytb, Server.MapPath(".") + @"\Table.pdf", "g:\\WINDOWS\\FONTS\\simsun.ttc,1", 14);　
        //因为是静态方法，不用初始化类。
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //创建表的一条新行
        DataRow myrow = mytb.NewRow();
        //添加行数据
        myrow["Name"] = txtname.Text;
        myrow["Sex"] = txtsex.Text;
        myrow["Age"] = txtage.Text;
        myrow["Address"] = txtaddress.Text;
        //将完整的行添加到表中
        mytb.Rows.Add(myrow);
        //添加完成后，清空界面
        ClearTxt();
    }
    /// <summary>
    /// 清空表的行数据
    /// </summary>
    private void ClearTxt()
    {
        txtaddress.Text = "";
        txtage.Text = "";
        txtname.Text = "";
        txtsex.Text = "";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //设置数据表为控件的数据源
        DataList1.DataSource = mytb;
        //绑定
        DataList1.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        //导航到输出界面
        //如果需要传递参数，请使用注释掉的语句
        Response.Redirect("PDFToHTML.ASPX");
        //Response.Redirect("PDFToHTML.ASPX?filepath=c:\table.pdf");
    }
}
