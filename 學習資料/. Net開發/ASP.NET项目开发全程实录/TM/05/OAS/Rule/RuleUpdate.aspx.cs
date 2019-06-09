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

public partial class Rule_RuleUpdate : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = bc.GetDataSet("select * from tb_rule", "tb_rule");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row)
            {
                FreeTextBox1.Text = rs["content"].ToString();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (bc.ExecSQL("update tb_rule set content='" + FreeTextBox1.Text + "'where id=1"))
            Response.Write(bc.MessageBox("更新成功！"));
        else
            Response.Write(bc.MessageBox("更新失败！"));
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        FreeTextBox1.Text = "";
    }
}
