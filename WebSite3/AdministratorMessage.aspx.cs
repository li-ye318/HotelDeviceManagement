using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AdministratorMessage : System.Web.UI.Page
{
    public string strConnection;
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
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
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void OK_Click(object sender, EventArgs e)
    {
        strConnection = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";//数据库存放路径
        string str = "select * from Message where device_name='" + DeviceName.Text.Trim() + "'";
        conn = new SqlConnection(strConnection);
        conn.Open();
        SqlCommand comm = new SqlCommand(str, conn);
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
            Response.Write("<script language=javascript>window.alert('该设备不存在!');</script>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdministratorMain.html");
    }
}