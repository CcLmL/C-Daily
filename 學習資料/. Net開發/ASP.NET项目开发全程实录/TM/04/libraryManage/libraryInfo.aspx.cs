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

public partial class libraryInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (getSet())                               //判断是否拥有权限  
            {
                if (!IsPostBack)
                {
                    bindLibrary();
                }
            }
            else

                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");

        }
        else
        {
            Response.Redirect("entry.aspx");            //返回到登录页面
        }       
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string libraryName = txtLibraryName.Text;
        string curator = txtCurator.Text;
        string tel = txtTel.Text;
        string address = txtAddress.Text;
        string email = txtEmail.Text;
        string net = txtNet.Text;
        string upbuildTime = txtUpbuildTime.Text;
        string remark = txtRemark.Text;
        string sql = "update tb_library set libraryName='" + libraryName + "',curator='" + curator + "',tel='" + tel + "',address='" + address + "',email='" + email + "',net='" +
            net + "',upbuildTime='" + upbuildTime + "',remark='" + remark + "'";
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("", "<script>alert('保存成功！')</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('保存失败！')</script>");
        }


    }
    //自定义方法判断当前管理员是否拥有管理此页面的权限
    public bool getSet()
    {
        string userName = Session["userName"].ToString();                       //获取管理员登录名
        string sql = "select * from tb_admSet where userName='" + userName + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["systemSet"]);                             //返回是否拥有权限
    }
    //自定义方法显示图书馆信息
    public void bindLibrary()
    {
        string sql = "select * from tb_library";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtLibraryName.Text = sdr["libraryName"].ToString();    //获取图书馆名称
        txtCurator.Text = sdr["curator"].ToString();            //获取馆长
        txtTel.Text = sdr["tel"].ToString();                    //获取电话
        txtAddress.Text = sdr["address"].ToString();            //获取地址
        txtEmail.Text = sdr["email"].ToString();                //获取电子邮件
        txtNet.Text = sdr["net"].ToString();                    //获取网址
        txtUpbuildTime.Text = sdr["upbuildTime"].ToString();    //获取建馆时间
        txtRemark.Text = sdr["remark"].ToString();              //获取备注    
    }
}
