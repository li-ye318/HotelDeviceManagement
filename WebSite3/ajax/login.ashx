<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Web.SessionState;

public class login : IHttpHandler ,IRequiresSessionState{

    public void ProcessRequest (HttpContext context) {
        context.Response.Buffer = true;
        context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
        context.Response.AddHeader("pragma", "no-cache");
        context.Response.AddHeader("cache-control", "");
        context.Response.CacheControl = "no-cache";
        context.Response.ContentType = "text/plain";
            //接收前端传过来的数据
        string username = context.Request["username"].ToString();
        string password = context.Request["password"].ToString();

        context.Session["user"]=username;

        //连接数据库
        SqlConnection con = new SqlConnection("Server=DESKTOP-KAAI903;DataBase=device management; Trusted_Connection=SSPI");
        con.Open();

        string sql = "select * from Users where name= '" + username + "'and password='" + password + "'";
        SqlCommand com = new SqlCommand(sql, con);

        //判断用户是否存在

        if (com.ExecuteScalar() != null)
        {
            context.Response.Write("success");
        }
        else
        {
            context.Response.Write("fail");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}