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

public partial class addReaderInfo : System.Web.UI.Page
{
    string barcode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        barcode = Request.QueryString["readerBarCode"].ToString();           //获取对图书操作的方式
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            bindDdlReaderType();
            //自定义方法绑定书架
            if (barcode != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改读者信息";
                bindReaderInfo();
            }
            else
            {
                this.Title = "添加读者信息";
                this.txtReaderBarCode.Text = bindBarcode();
            }
        }
        
    }

    public string bindBarcode()
    {
        //获取当前日期的年，月，日转换成字符串类型用于表示条形码
        string date = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();
        //获取当前时间的小时，分钟转换成字符串类型用于表示条形码
        string time = DateTime.Now.Minute.ToString()+DateTime.Now.Second.ToString();
        return "0" + date + time;　   //返回一个１３位的条形码
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string readerBarCode = txtReaderBarCode.Text;
        string readerName = txtReaderName.Text;
        string sex = "";
        if (radbtnMan.Checked)
        {
            sex = "男";
        }
        else
        {
            sex = "女";
        }
        string readerType = ddlReaderType.SelectedValue;
        string certificateType = ddlCertificateType.SelectedValue;
        string certificate = txtCertificate.Text;
        string tel = txtTel.Text;
        string email = txtEmail.Text;
        string remark = txtRemark.Text;
        string sql = "";
        if (barcode == "add")
        {
             sql = "insert into tb_readerInfo values('" + readerBarCode + "','" + readerName + "','" + sex + "','" + readerType + "','" + certificateType + "','" +
                certificate + "','" + tel + "','" + email + "','" + remark + "')";
        }
        else
        {
            sql = "update tb_readerInfo set readerName='"+readerName+"',sex='"+sex+"',readerType='"+readerType+"',certificateType='"+certificateType+"',certificate='"+
                certificate+"',tel='"+tel+"',email='"+email+"',remark='"+remark+"' where readerBarCode='"+barcode+"'";
        }
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("", "<script>alert('保存成功！');window.opener.location.href=window.opener.location='readerInfo.aspx';window.close();</script>");
        }
        else
            RegisterStartupScript("", "<script>alert('保存失败！')</script>");


    }
    public void bindDdlReaderType()
    {
        string sql = "select * from tb_readerType";
        ddlReaderType.DataSource = dataOperate.getDataset(sql,"tb_readerType");
        ddlReaderType.DataTextField = "type";
        ddlReaderType.DataValueField = "id";
        ddlReaderType.DataBind();
    }

    public void bindReaderInfo()
    {
        string sql = "select * from tb_readerInfo  where readerBarCode='" + barcode + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        txtReaderBarCode.Text = sdr["readerBarCode"].ToString();
        txtReaderName.Text = sdr["readerName"].ToString();
        txtRemark.Text = sdr["remark"].ToString();
        txtTel.Text = sdr["tel"].ToString();
        txtEmail.Text = sdr["email"].ToString();
        txtCertificate.Text = sdr["certificate"].ToString();
        if (sdr["sex"].ToString().Trim() == "男")
        {
            radbtnMan.Checked = true;
        }
        else
        {
            radbtnWoman.Checked = true;
        }
        ddlCertificateType.SelectedValue = sdr["certificateType"].ToString();
        ddlReaderType.SelectedValue = sdr["readerType"].ToString();
                  
    }
}
