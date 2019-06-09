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

public partial class fileManage_FileIncept : System.Web.UI.Page
{
    BaseClass bc = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginName"] == null)　//用户非法登录，跳转的系统主页。
        {
            Response.Write("<script>this.parent.location.href='../Default.aspx'</script>");
            return;
        }
        if (!IsPostBack)
        {
            //如果系统登录身份为系统管理员，那么显示所有职员的文件列表
            if (Session["loginName"].ToString().Trim().ToUpper() == "tsoft")
            {
                DataList1.DataSource = bc.GetDataSet("select * from tb_file order by fileTime desc", "tb_file");
                DataList1.DataKeyField = "fileid";
                DataList1.DataBind();
                rdoBtnInpceptFalse.Enabled = false;
                rdoBtnInpceptTrue.Enabled = false;
                return;
            }
            else　　//显示操作员自己的文件列表
            {
                DataList1.DataSource = bc.GetDataSet("select * from tb_file where examine='已接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "tb_file");
                DataList1.DataKeyField = "fileid";
                DataList1.DataBind();
            }
        }
        //显示未接收文件
        if (rdoBtnInpceptFalse.Checked)
        {
            DataList1.DataSource = bc.GetDataSet("select * from tb_file where examine='未接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "tb_file");
            DataList1.DataKeyField = "fileid";
            DataList1.DataBind();
        }
        //显示已接收文件
        if (rdoBtnInpceptTrue.Checked)
        {
            DataList1.DataSource = bc.GetDataSet("select * from tb_file where examine='已接收' and fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "tb_file");
            DataList1.DataKeyField = "fileid";
            DataList1.DataBind();
        }
    }
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        //修改文件接收状态
        bc.ExecSQL("UPDATE tb_file SET examine = '已接收' WHERE fileID ='" + (int)DataList1.DataKeys[e.Item.ItemIndex] + "'");
        DataList1.DataSource = bc.GetDataSet("select * from tb_file where fileAccepter='" + Session["loginName"].ToString() + "' order by fileTime desc", "tb_file");
        DataList1.DataKeyField = "fileid";
        DataList1.DataBind();
    }
}
