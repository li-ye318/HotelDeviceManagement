using System;
using System.Data.SqlClient;
using System.Data;

public partial class Message : System.Web.UI.Page
{
    public string strConnection;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)//连接数据库
    {
        strConnection = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";//数据库存放路径
        string str = "select * from Message";
        conn = new SqlConnection(strConnection);
        conn.Open();
        SqlCommand comm = new SqlCommand(str, conn);    
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = comm;
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView3.DataSource = ds;
        GridView3.DataBind();
    }

    protected void Sure_Click(object sender, EventArgs e)
    {
        //按照设备名称查看设备信息
        strConnection = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";//数据库存放路径
        string str = "select * from Message where device_name='" + name.Text.Trim() + "'";
        conn = new SqlConnection(strConnection);
        conn.Open();
        SqlCommand comm = new SqlCommand(str, conn);
        if (comm.ExecuteScalar() != null)
        {
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = comm;
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView3.DataSource = ds;
            GridView3.DataBind();
        }
        else
            Response.Write("<script language=javascript>window.alert('该设备不存在!');</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("User.html");
    }
}