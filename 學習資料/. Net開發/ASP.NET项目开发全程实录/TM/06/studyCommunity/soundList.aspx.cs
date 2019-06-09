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

public partial class soundList : System.Web.UI.Page
{

    dataOperate mydo = new dataOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        createSound();
    }
    protected void createSound()
    {
        int noncePage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        try
        {           
            string sql = "select * from tb_Sound where SoundType=" + Request.QueryString["TypeID"] + " ORDER BY SoundID DESC";
            ps.DataSource = mydo.rows(sql, "tb_Sound").DefaultView;        
            //启用分页
            ps.AllowPaging = true;
            //每页显示3条数据
            ps.PageSize = 10;
            //设置当前页的索引
            ps.CurrentPageIndex = noncePage - 1;
            this.lnkbtnFront.Enabled = true;
            this.lnkbtnNext.Enabled = true;
            this.lnkbtnLast.Enabled = true;
            this.lnkbtnFirst.Enabled = true;
            if (noncePage == 1) //等于第一页
            {
                this.lnkbtnFirst.Enabled = false;//不显示第一页按钮
                this.lnkbtnFront.Enabled = false;//不显示上一页按钮
            }
            if (noncePage == ps.PageCount) //等于最后一页
            {
                this.lnkbtnNext.Enabled = false;//不显示下一页
                this.lnkbtnLast.Enabled = false;//不显示最后一页
            }
            this.labBackPage.Text = Convert.ToString(ps.PageCount);
            this.dlSound.DataSource = ps;
            //设置数据源的关键字段
            this.dlSound.DataKeyField = "SoundID";            
            dlSound.DataBind();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    protected void lnkbtnFirst_Click(object sender, EventArgs e)
    {
        labPage.Text = "1";//设置当前页为１
        this.createSound();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnFront_Click(object sender, EventArgs e)
    {
        //设置当前页减１
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        this.createSound();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        //设置当前页加１
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1);
        this.createSound();//调用自定义方法重新绑定数据
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
        //设置当前页为最后一页
        labPage.Text = labBackPage.Text;
        this.createSound();//调用自定义方法重新绑定数据
    }
}
