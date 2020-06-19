<%@ WebHandler Language="C#" Class="Broken" %>
using System;
using System.Web;
using System.Data.SqlClient;
public class Broken : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        string DeviceName = context.Request["DeviceName"].ToString();
        string Reason = context.Request["Reason"].ToString();
        string Time = context.Request["Time"].ToString();
        string PersonName = context.Request["PersonName"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string s = "select * from users where name='" + PersonName.ToString() + "'";
        SqlCommand sql = new SqlCommand(s, con);
        if (sql.ExecuteScalar() != null)
        {
            string str = "select * from Broken";
            SqlCommand comm = new SqlCommand(str, con);
            string str1 = "insert into Broken(device_name,reason,broken_time,person,result)values('" + DeviceName.ToString() + "','" + Reason.ToString() + "','" + Time.ToString() + "','" + PersonName.ToString() + "','" + "未维修" + "')";
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