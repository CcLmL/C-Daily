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

public partial class Rule_RulePreview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BaseClass bc = new BaseClass();
            DataSet ds = bc.GetDataSet("select * from tb_rule", "tb_rule");
            DataRow[] row = ds.Tables[0].Select();
            foreach (DataRow rs in row)  //将检索到的数据逐一,循环添加到Listbox1中
            {
                Table1.Caption = rs["content"].ToString();
            }
        }
    }
}
