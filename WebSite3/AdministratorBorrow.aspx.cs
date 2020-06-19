using System;
using System.Data.SqlClient;
using System.Data;
public partial class AdministratorBorrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow where experienced_name='" + PersonName.Text.Trim() + "'";
        SqlCommand co = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = co;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow";
        SqlCommand comm = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = comm;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow where Is_Return='" + "未归还" + "' ";
        SqlCommand comm = new SqlCommand(str, con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = comm;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }


    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdministratorMain.html");
    }
}