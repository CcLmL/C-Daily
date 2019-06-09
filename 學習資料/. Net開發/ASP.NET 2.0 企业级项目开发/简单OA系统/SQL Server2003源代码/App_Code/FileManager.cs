using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// 获取服务器上的文件
/// </summary>
public class FileManager
{
	public FileManager()
	{
    }
    /// <summary>
    /// 获取服务器上的文件列表
    /// </summary>
    /// <param name="path">服务器的目录路径</param>
    /// <returns>返回一个数据Table</returns>
    public DataTable  GetFileInfo(string path)
    {
        //新建一个Table用来存储数据
        DataTable mytable = new DataTable();
        DataRow row;
        //创建两个列，一个表示文件名，一个表示文件大小
        DataColumn col = new DataColumn();
        col.DataType = System.Type.GetType("System.String");
        col.ColumnName = "filename"; 
        DataColumn col2 = new DataColumn();
        col2.DataType = System.Type.GetType("System.Int32");
        col2.ColumnName = "filesize"; 
        //将两个新列添加到表中。
        mytable.Columns.Add(col);
        mytable.Columns.Add(col2);
        //首先获取服务器目录下的路径
        DirectoryInfo mydir = new DirectoryInfo(path);
        //遍历这个目录下的所有文件
        foreach (FileInfo myfile in mydir.GetFiles())
        {
            //为每行的列赋值
            row = mytable.NewRow();
            row["filename"] = myfile.Name;
            row["filesize"]=myfile.Length;
            //将行添加到Table中
            mytable.Rows.Add(row);
        }
        return mytable;
    }
    /// <summary>
    /// 搜索文件的方法
    /// </summary>
    /// <param name="path">目录的路径</param>
    /// <param name="searchPattern">搜索匹配模式，例如“*.txt”</param>
    /// <returns>搜索结果表</returns>
    public DataTable SeekFileInfo(string path,string searchPattern)
    {
        //新建一个Table用来存储数据
        DataTable mytable = new DataTable();
        DataRow row;
        //创建两个列，一个表示文件名，一个表示文件大小
        DataColumn col = new DataColumn();
        col.DataType = System.Type.GetType("System.String");
        col.ColumnName = "filename";
        DataColumn col2 = new DataColumn();
        col2.DataType = System.Type.GetType("System.Int32");
        col2.ColumnName = "filesize";
        //将两个新列添加到表中。
        mytable.Columns.Add(col);
        mytable.Columns.Add(col2);
        //首先获取服务器目录下的路径
        DirectoryInfo mydir = new DirectoryInfo(path);
        //遍历这个目录下的所有符合条件的文件
        foreach (FileInfo myfile in mydir.GetFiles(searchPattern))
        {
            //为每行的列赋值
            row = mytable.NewRow();
            row["filename"] = myfile.Name;
            row["filesize"] = myfile.Length;
            //将行添加到Table中
            mytable.Rows.Add(row);
        }
        return mytable;
    }
}
