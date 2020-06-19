<%@ WebHandler Language="C#" Class="Damage" %>
using System;
using System.Web;
using System.Data.SqlClient;
public class Damage : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string DeviceName = context.Request["name"].ToString();
        string Department = context.Request["department"].ToString();
        string Count = context.Request["count"].ToString();
        string Time = context.Request["time"].ToString();
        string Repair_Person = context.Request["person"].ToString();
        string Deal = context.Request["deal"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string s = "select * from Administrator where name='" + Repair_Person.ToString() + "'";
        SqlCommand com = new SqlCommand(s, con);
        if (com.ExecuteScalar() != null)
        {
            string str = "select * from Damage";
            SqlCommand comm = new SqlCommand(str, con);
            string str1 = "insert into Damage(device_name,department,count,time,person_name,deal)" +
                " values('" + DeviceName.ToString() + "','" + Department.ToString() + "','" + Count.ToString() + "'," +
                "'" + Time.ToString() + "','" + Repair_Person.ToString() + "','" +"扔掉"+ "')";
            comm.CommandText = str1;
            comm.ExecuteNonQuery();
            context.Response.Write("success");
        }
        else
            context.Response.Write("fail");
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}