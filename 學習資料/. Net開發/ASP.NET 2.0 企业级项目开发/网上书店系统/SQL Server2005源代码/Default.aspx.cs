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
    protected void Page_Load(object sender, EventArgs e)
    {
        //为DataList1控件设置数据源
        if (!Page.IsPostBack)
        {
            //初始化实体操作类
            Category cat = new Category();
            //为数据控件绑定数据源

            Repeater1.DataSource = cat.GetCategories();
            Repeater1.DataBind();
            // 判断当前选择的目录
            string categoryId =Request.QueryString["categoryId"];
            if (!string.IsNullOrEmpty(categoryId))
                SelectCategory(int.Parse(categoryId));
        }
    }
    // 选择当前目录
    private void SelectCategory(int categoryId)
    {
        string categoryID = categoryId.ToString();
        //遍历Repeater控件中的每个项目，并为链节赋值
        foreach (RepeaterItem item in Repeater1.Items)
        {
            //用一个隐藏控件保存ID值
            HiddenField hidCategoryId = (HiddenField)item.FindControl("hidCategoryId");
            if (hidCategoryId.Value.ToLower() == categoryID.ToLower())
            {
                HyperLink lnkCategory = (HyperLink)item.FindControl("lnkCategory");
                lnkCategory.ForeColor = System.Drawing.Color.FromArgb(199, 116, 3);
                break;
            }
        }
    }
}
