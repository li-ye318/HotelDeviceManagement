<%@ WebHandler Language="C#" Class="management" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.SessionState; 

public class management : IHttpHandler,IRequiresSessionState {
    
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

        SqlConnection con = new SqlConnection("Server=DESKTOP-KAAI903;DataBase=device management; Trusted_Connection=SSPI");
        con.Open();


        string str = "select * from Administrator where name='" + username + "'";
        SqlCommand com2 = new SqlCommand(str, con);
        if(null != com2.ExecuteScalar())
        {
            context.Response.Write("fail");
        }
        else
        {
            string sql = "insert into Administrator(name,password)values('" + username + "','" + password + "')";
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