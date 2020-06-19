using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DamageMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select device_name as 设备名称,department as 部门,count as 数量,person_name as 处理人,deal as 处理方式 from Damage ";
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
            Response.Write("<script language=javascript>window.alert('当前暂无报废记录记录!');</script>");
            Response.Redirect("AdministratorMain.html");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Damage.html");
    }
}