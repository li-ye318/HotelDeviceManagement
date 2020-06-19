using System;
using System.Data;
using System.Data.SqlClient;

public partial class UserBorrow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow where experienced_name='" + Session["user"].ToString() + "'";
        SqlCommand comm = new SqlCommand(str, con);
        if (comm.ExecuteScalar() != null)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript>window.alert('当前用户暂无转借记录!');</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("User.html");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow where experienced_name='" + Session["user"].ToString() + "'and Is_Return='"+"未归还"+"'";
        SqlCommand comm = new SqlCommand(str, con);
        if (comm.ExecuteScalar() != null)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript>window.alert('当前用户设备已全部归还!');</script>");
        }
    }
}