using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Broken : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select Broken.device_name as 设备名称,Broken.reason as 损坏情况,Broken.broken_time as 损坏时间,Broken.person as 申报人,Broken.result as 状态 from Broken ";
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand comm = new SqlCommand(str,con);
        da.SelectCommand = comm;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        //
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select Broken.device_name as 设备名称,Broken.reason as 损坏情况,Broken.broken_time as 损坏时间,Broken.person as 申报人,Broken.result as 状态 from Broken where Broken.result='"+"未维修"+"' ";
        SqlDataAdapter da = new SqlDataAdapter();
        SqlCommand comm = new SqlCommand(str, con);
        da.SelectCommand = comm;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdministratorMain.html");
    }
}