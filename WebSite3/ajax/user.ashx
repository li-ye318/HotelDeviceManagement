<%@ WebHandler Language="C#" Class="user" %>
using System;
using System.Web;
using System.Data.SqlClient;
public class user : IHttpHandler {    
    public void ProcessRequest (HttpContext context) {
        context.Response.Buffer = true;
        context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        context.Response.AddHeader("pragma", "no-cache");
        context.Response.AddHeader("cache-control", "");
        context.Response.CacheControl = "no-cache";
        context.Response.ContentType = "text/plain";
        string username = context.Request["username"].ToString();
        string password = context.Request["password"].ToString();
        string repassword = context.Request["repassword"].ToString();
        string department = context.Request["department"].ToString();
        SqlConnection con = new SqlConnection("Server=SKY-20171121TUC;DataBase=device management; Trusted_Connection=SSPI");
        con.Open();
        string str = "select * from Users where name='" + username + "'";
        SqlCommand com2 = new SqlCommand(str, con);
        if(com2.ExecuteScalar()!=null)
        {
            context.Response.Write("fail");
        }
        else
        {
            string sql = "insert into Users(name,password,department)values('" + username + "','" + password + "','"+department+"')";
            SqlCommand com1 = new SqlCommand(sql, con);
            if (com1.ExecuteNonQuery() != 0)
            {
                context.Response.Write("success");
            }
            else
            {
                context.Response.Write("fail");
            }
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}