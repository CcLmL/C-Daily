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
using System.Data.SqlClient;

public partial class bookReturn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (!getSet())                               //判断是否拥有权限  

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");
        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }        
    }
    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["bookBorrow"]);                             //返回是否拥有权限
    }
    protected void btnReaderSearch_Click(object sender, EventArgs e)
    {
        string readerBarCode = txtReaderBarCode.Text;
        string readerSql = "select * from tb_readerInfo where readerBarCode='" + readerBarCode + "'";
        SqlDataReader sdr = dataOperate.getRow(readerSql);
        if (sdr.Read())
        {
            txtReaderName.Text = sdr["readerName"].ToString();
            txtReaderSex.Text = sdr["Sex"].ToString();
            txtCertificateType.Text = sdr["certificateType"].ToString();
            txtCertificate.Text = sdr["certificate"].ToString();
            string readerTypeSql = "select * from tb_readerType where id=" + sdr["readerType"].ToString();
            SqlDataReader typeSdr = dataOperate.getRow(readerTypeSql);
            typeSdr.Read();
            txtReaderType.Text = typeSdr["type"].ToString();
            int borrowNum = Convert.ToInt32(typeSdr["num"]);
            string selSql = "select count(*) from tb_bookBorrow where readerBarCode='" + readerBarCode + "' and isReturn ='0'";
            int alreadyNum = dataOperate.seleSQL(selSql);
            txtNum.Text = Convert.ToString(borrowNum - alreadyNum);
            string sql = "select * from tb_bookBorrow where  readerBarCode='" + txtReaderBarCode.Text + "'and isReturn='0'";
            bindGridView(sql);
        }
        else
            RegisterStartupScript("", "<script>alert('图书条形码输入错误！')</script>");
    }
    protected void btnBookSearch_Click(object sender, EventArgs e)
    {
        if (txtBookBarCode.Text.Trim() != "")
        {
            string bookBarCode = txtBookBarCode.Text;
            string sql = "select * from tb_bookBorrow where bookBarCode='" + bookBarCode + "'and readerBarCode='" + txtReaderBarCode.Text + "'and isReturn='0'";
            bindGridView(sql);
        }
        else
        {
            RegisterStartupScript("", "<script>alert('图书条形码不能为空')</script>");
        }
    }
    protected void gvBookReturn_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取当前选择图书条形码
        string bookBarCode = gvBookReturn.DataKeys[e.NewSelectedIndex].Value.ToString();
            //创建SQL语句更新图书借阅表中是否归还字段
        string updateSql = "update tb_bookBorrow set isReturn='1' where bookBarCode='" + bookBarCode + "'and readerBarCode='" + txtReaderBarCode.Text + "'";
        if (dataOperate.execSQL(updateSql)) //判断是否归还成功
        {
            RegisterStartupScript("", "<script>alert('归还成功！')</script>");
            gvBookReturn.DataSource = null;     //将GridView控件数据源设置为空
            gvBookReturn.DataBind();            //绑定GridView控件
            txtBookBarCode.Text = null;         //将显示图书条形码设置为空
        }
        else
        {
            RegisterStartupScript("", "<script>alert('归还失败！')</script>");
        }
    }

    public void bindGridView(string sql)
    {

        gvBookReturn.DataSource = dataOperate.getRow(sql);
        gvBookReturn.DataKeyNames = new string[] { "bookBarCode" };
        gvBookReturn.DataBind();
        
    }
}
