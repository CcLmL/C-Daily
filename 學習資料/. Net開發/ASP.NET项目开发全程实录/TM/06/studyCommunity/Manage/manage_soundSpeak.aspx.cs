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

public partial class Manage_manage_soundSpeak : System.Web.UI.Page
{
    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        seeSpeak();
    }
    protected void seeSpeak()
    {
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();                 
            string selectSql = "select * from tb_Speak  where [TutorialID]=" + Request.QueryString["SoundID"] + " and [TutorialType]='Sound' ORDER BY SpeakID DESC ";
            string table = "tb_Speak";
            ps.DataSource = mydo.rows(selectSql, table).DefaultView;
            //启用分页
            ps.AllowPaging = true;            
            ps.PageSize = 10;
            //设置当前页的索引
            ps.CurrentPageIndex = curpage - 1;
            this.lnkbtnFront.Enabled = true;
            this.lnkbtnNext.Enabled = true;
            this.lnkbtnLast.Enabled = true;
            this.lnkbtnFirst.Enabled = true;
            if (curpage == 1) //等于第一页
            {
                this.lnkbtnFirst.Enabled = false;//不显示第一页按钮
                this.lnkbtnFront.Enabled = false;//不显示上一页按钮
            }
            if (curpage == ps.PageCount) //等于最后一页
            {
                this.lnkbtnNext.Enabled = false;//不显示下一页
                this.lnkbtnLast.Enabled = false;//不显示最后一页
            }
            this.labBackPage.Text = Convert.ToString(ps.PageCount);
            this.DataList1.DataSource = ps;
            //设置数据源的关键字段
            this.DataList1.DataKeyField = "SpeakID";
            DataList1.DataSource = ps;
            DataList1.DataBind();  
        
    }

    protected void lnkbtnFirst_Click(object sender, EventArgs e)
    {
        labPage.Text = "1";//设置当前页为１
        this.seeSpeak();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)
    {
        //设置当前页减１
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        this.seeSpeak();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        //设置当前页加１
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1);
        this.seeSpeak();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
        //设置当前页为最后一页
        labPage.Text = labBackPage.Text;
        this.seeSpeak();//调用自定义方法重新绑定数据
    }



    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string id = this.DataList1.DataKeys[e.Item.ItemIndex].ToString();
        string sql = "delete from tb_Speak where SpeakID=" + id;
        if (mydo.adlData(sql))
        {
            Page.RegisterStartupScript("true", "<script>alert('删除成功！')</script>");
        }
        else
        {
            Page.RegisterStartupScript("false", "<script>alert('删除失败！')</script>");
        }
        this.seeSpeak();
    }
}
