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

public partial class addBookInfo : System.Web.UI.Page
{
    private string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id= Request.QueryString["ID"].ToString();           //获取对图书操作的方式
        if (!IsPostBack)                                    //判断是否是首次加载
        {
            bindBookType();                                 //自定义方法绑定图书类型
            bindBookcase();                                 //自定义方法绑定书架
            if (id != "add")                                  //判断是否是添加操作
            {
                this.Title = "修改图书信息";
                bindBookInfo();                             //调用自定义方法显示图书信息
            }
            else
            {
                this.Title = "添加图书信息";
                txtBarCode.Text = barcode();                //调用自定义方法生成条形码
            }
        }       
    }
    public void bindBookInfo()
    {
        string sql = "select * from tb_bookInfo where bookBarCode='"  + id+"'";
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();                                                 //读取一条记录
        txtBarCode.Text = sdr["bookBarCode"].ToString();            //显示图书条形码信息
        txtBookName.Text = sdr["bookName"].ToString();              //显示图书名称信息
        ddlBookType.SelectedValue = sdr["bookType"].ToString();     //显示图书类型信息
        ddlBookcase.SelectedValue = sdr["bookcase"].ToString();     //显示书架信息
        txtBookConcern.Text = sdr["bookConcern"].ToString();        //显示图书出版社信息
        txtAuthor.Text = sdr["author"].ToString();                  //显示图书作者信息
        txtPrice.Text = sdr["Price"].ToString();                    //显示图书价格信息
    }


   
    //绑定图书类型下拉列表
    public void bindBookType()
    {
        string sql = "select * from tb_bookType";                               //获取所有图书类型
        ddlBookType.DataSource = dataOperate.getDataset(sql, "tb_bookType");    //将图书类型绑定到DropDownList控件上
        ddlBookType.DataTextField = "TypeName";                                 //设置DropDownList控件的显示文本
        ddlBookType.DataValueField = "TypeID";                                  //设置DropDownList控件的值
        ddlBookType.DataBind();
    }

    //绑定书架下拉列表
    public void bindBookcase()
    {
        string sql = "select * from tb_bookcase";                               
        ddlBookcase.DataSource = dataOperate.getDataset(sql, "tb_bookcase");
        ddlBookcase.DataTextField = "bookcaseName";
        ddlBookcase.DataValueField = "bookcaseID";
        ddlBookcase.DataBind();
    }
    //生成条形码
    public string barcode()
    {
        //获取当前日期的年，月，日转换成字符串类型用于表示条形码
        string date = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();
        //获取当前时间的小时，分钟转换成字符串类型用于表示条形码
        string time = DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() ;
        return "10"+date +time;　   //返回一个１３位的条形码
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string bookBarcode = txtBarCode.Text;                   //获取图书条形码信息
        string bookName = txtBookName.Text;                     //获取图书名称信息
        string bookType = ddlBookType.SelectedValue;            //获取图书类型信息
        string bookcase = ddlBookcase.SelectedValue;            //获取书架信息
        string bookConcern = txtBookConcern.Text;               //获取图书出版社信息
        string author = txtAuthor.Text;                         //获取图书作者信息
        string price = txtPrice.Text;                           //获取图书价格信息
        string sql = "";
            //判断当前对图书信息的操作
        if (id == "add") 
        {
            sql = "insert into tb_bookInfo(bookBarCode,bookName,bookType,bookcase,bookConcern,author,price) values('" + bookBarcode + "','" + bookName + "','" + bookType + "','" + bookcase + "','" + bookConcern + "','" +
               author + "'," + price + ")";
        }
        else
            sql = "update tb_bookInfo set bookName='" + bookName + "',bookType='" + bookType + "',bookcase='" + bookcase + "',bookConcern='" + bookConcern + "',author='" + author + "',price=" + price + " where bookBarcode='" + bookBarcode + "'";

        if (dataOperate.execSQL(sql))   //判断添加或修改是否成功
        {
            Response.Write("<script language=javascript>alert('添加成功！');window.opener.location.href=window.opener.location='bookInfoManage.aspx';window.close();</script>");
        }
        else
        {
            RegisterStartupScript("", "<script>alert('添加失败！')</script>");
        }
    }
}
