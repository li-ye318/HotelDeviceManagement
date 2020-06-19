using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class RepairMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select device_name as 设备名称,reason as 损坏情况,broken_time as 损坏时间,person as 申报人,repair_person as 维修人,repair_time as 维修时间,result as 维修结果 from Broken where repair_person='" + Session["Administrator"].ToString() + "'";
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
            Response.Write("<script language=javascript>window.alert('当前用户暂无维修记录!');</script>");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select device_name as 设备名称,reason as 损坏情况,broken_time as 损坏时间,person as 申报人,repair_person as 维修人,repair_time as 维修时间,result as 维修结果 from Broken where repair_person='" + Session["username"].ToString() + "' and result='"+"维修成功"+"'";
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
            Response.Write("<script language=javascript>window.alert('当前用户暂无维修成功记录!');</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Repair.html");
    }
}