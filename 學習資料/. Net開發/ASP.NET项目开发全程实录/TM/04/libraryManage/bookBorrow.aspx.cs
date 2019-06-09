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

public partial class bookBorrow : System.Web.UI.Page
{
	static int isSum=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)            　//判断管理员是否登录
        {
            if (!getSet())                               //判断是否拥有权限  
            {
                Response.Write("<script>alert('您没有此权限');location='index.aspx';</script>");
            }
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
        SqlDataReader sdr = dataOperate.getRow(sql);                            //获取管理员权限信息
        sdr.Read();                                                             //读取一条记录
        return Convert.ToBoolean(sdr["bookBorrow"]);                             //返回是否拥有权限
    }
    protected void btnReaderSearch_Click(object sender, EventArgs e)
    {
        bindReaderInfo();     //调用自定义方法显示读者信息
    }
    //自定义方法显示读者信息，
    public void bindReaderInfo()
    {
        string readerBarCode = txtReaderBarCode.Text;               //获取读者条形码
        //创建SQL语句在读者信息表中查询符合读者条形码条件的记录
        string readerSql = "select * from tb_readerInfo where readerBarCode='" + readerBarCode + "'";
        SqlDataReader sdr = dataOperate.getRow(readerSql);          //获取该读者详细信息
        if (sdr.Read())
        {                                                 //读取一条记录
            txtReaderName.Text = sdr["readerName"].ToString();          //显示读者姓名
            txtReaderSex.Text = sdr["Sex"].ToString();                  //显示读者性别
            txtCertificateType.Text = sdr["certificateType"].ToString();//显示证件类型
            txtCertificate.Text = sdr["certificate"].ToString();        //显示证件号
            //创建SQL语句在读者类型表中查询符合读者类型编号的记录
            string readerTypeSql = "select * from tb_readerType where id=" + sdr["readerType"].ToString();
            SqlDataReader typeSdr = dataOperate.getRow(readerTypeSql);  //获取读者类型信息
            typeSdr.Read();                                             //读取一条记录
            txtReaderType.Text = typeSdr["type"].ToString();            //显示读者类型
            int borrowNum = Convert.ToInt32(typeSdr["num"]);            //获取可借图书总数
            //创建SQL语句在图书借阅表中查询符合读者条形码条件的读者借了几本图书（图书未还的）
            string selSql = "select count(*) from tb_bookBorrow where readerBarCode='" + readerBarCode + "' and isReturn ='0'";
            int alreadyNum = dataOperate.seleSQL(selSql);               //获取图书已借数
            txtNum.Text = Convert.ToString(borrowNum - alreadyNum);     //显示可以借阅数
		isSum=1;
        }
        else
            RegisterStartupScript("", "<script>alert('读者条形码输入错误!')</script>");
    }
    protected void btnBookSearch_Click(object sender, EventArgs e)
    {
        if(isSum>0)
{
if (Convert.ToInt32(txtNum.Text.Trim()) > 0)                //判断读者是否还可以借书        
        {
		

            if (txtBookBarCode.Text.Trim() != "")                   //判断图书条形码是否为空
            {
                string bookBarCode = txtBookBarCode.Text;           //获取图书条形码
                //创建SQL语句在图书信息表中查询符合图书条形码条件的记录
                string sql = "select * from tb_bookInfo where bookBarCode='" + bookBarCode + "'";
                DataSet ds=dataOperate.getDataset(sql,"tb_bookInfo");
                if(ds.Tables["tb_bookInfo"].DefaultView.Count>0)
                {
                gvBookBorrow.DataSource = ds.Tables["tb_bookInfo"].DefaultView;  //获取数据源
                gvBookBorrow.DataKeyNames = new string[] { "bookBarCode" }; //设置主键
                gvBookBorrow.DataBind();                            //绑定GridView控件
                }else
                    RegisterStartupScript("","<script>alert('图书条形码错误！')</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('图书条形码不能为空')</script>");
            }
        }
        else
        {
            RegisterStartupScript("", "<script>alert('借阅数量已满！不可以再借阅')</script>");
        }
}else
RegisterStartupScript("", "<script>alert('请先输入正确的读者条形码!')</script>");
    }
    protected void gvBookBorrow_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {   //设置图书类型
            string bookType = e.Row.Cells[1].Text.ToString();               //获取图书类型编号
            //创建SQL语句在图书类型表中查询符合图书类型编号条件的记录
            string typeSql = "select * from tb_bookType where TypeID=" + bookType;
            SqlDataReader typeSdr = dataOperate.getRow(typeSql);
            typeSdr.Read();                                                 //读取一条记录
            e.Row.Cells[1].Text = typeSdr["typeName"].ToString();           //显示图书类型
            e.Row.Cells[5].Text = typeSdr["borrowDay"].ToString();          //显示图书可借天数
        }
    }
    protected void gvBookBorrow_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //获取选中图书条形码
        string bookBarCode = gvBookBorrow.DataKeys[e.NewSelectedIndex].Value.ToString();
        //创建SQL语句使用内联接连接条件为图书类型编号，查询条件为符合图书条形码的记录
        string sql = "select * from tb_bookInfo as a inner join tb_bookType as b on a.bookType=typeID where a.bookBarCode='" + bookBarCode + "'";
        SqlDataReader sdr = dataOperate.getRow(sql);                                    //获取图书信息
        sdr.Read();
                                                                            //读取一条记录
            int borrowDay = Convert.ToInt32(sdr["borrowDay"]);                              //获取借阅天数
            string bookName = sdr["bookName"].ToString();                                   //获取图书名称
            string borrowTime = DateTime.Now.Date.ToShortDateString();                     //获取借阅日期
            string readerBarCode = txtReaderBarCode.Text;                                   //获取读者条形码
            string returnTime = DateTime.Now.Date.AddDays(borrowDay).ToShortDateString();   //获取应还日期
            string readerName = txtReaderName.Text;                                         //获取读者姓名
            //创建SQL语句将图书借阅信息添加到图书借阅信息表中
            string addSql = "insert tb_bookBorrow values('" + bookBarCode + "','" + bookName + "','" + borrowTime + "','" + returnTime + "','" + readerBarCode + "','" + readerName + "','')";
            if (dataOperate.execSQL(addSql))        //判断是否添加成功
            {
                //创建SQL更新图书信息表中符合图书条形码条件记录的借阅数
                string updateSql = "update tb_bookInfo set borrowSum=borrowSum+1 where bookBarCode='" + bookBarCode + "'";
                dataOperate.execSQL(updateSql);
                bindReaderInfo();               //重新绑定读者信息
                gvBookBorrow.DataSource = null; //将数据源设置为空
                gvBookBorrow.DataBind();
                txtBookBarCode.Text = "";       //将图书条形码文本框清空

                RegisterStartupScript("", "<script>alert('添加成功！')</script>");
            }
            else
            {
                RegisterStartupScript("", "<script>alert('添加失败！')</script>");
            }
  
    }
}
