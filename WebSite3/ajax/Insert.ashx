<%@ WebHandler Language="C#" Class="Handler" %>
using System.Web;
using System.Data.SqlClient;
using System.Web.SessionState;
public class Handler : IHttpHandler,IRequiresSessionState {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string name = context.Request["name"].ToString();
        string type = context.Request["type"].ToString();
        string depart = context.Request["depart"].ToString();
        string locat = context.Request["locat"].ToString();
        string num = context.Request["num"].ToString();
        SqlConnection con = new SqlConnection("Server=DESKTOP-KAAI903;DataBase=device management; Trusted_Connection=SSPI");
        con.Open();
        string str = "select * from Message where device_name='" + name  +"' and type='"+type+"'and department='"+depart+"'and location='"+locat+"' " ;
        SqlCommand comm = new SqlCommand(str, con );
        if (null != comm.ExecuteScalar())//库中原来就有这个设备
        {
            //context.Response.Write("fail");
            // context.Response.Write("<script language=javascript>window.alert('该设备已存在');</script>");
            string  num1="select number from Message where device_name='" + name  +"' and type='"+type+"'and department='"+depart+"'and location='"+locat+"' " ;//数据库中原有设备数量
            SqlCommand com1 = new SqlCommand(num1, con);
            int num2 = int.Parse(com1.ExecuteScalar().ToString()) + int.Parse(num);  //加入原来的得到现有设备数量用于更新

            string str2 = "update Message set number = '" + num2.ToString ()+ "' where device_name='" + name+  "'" ;
            SqlCommand com2 = new SqlCommand(str2, con);
            com2.ExecuteNonQuery();
                context.Response.Write(num2.ToString());
        }
        else
        {
            string str1 = "insert into Message(device_name,type,department,location,number)values('" + name + "','" + type + "','" + depart + "','" + locat + "','" + num + "')";
            string s = "select * from Message";
            SqlCommand com = new SqlCommand(s, con);
            com.CommandText = str1;
            if (com.ExecuteNonQuery() != 0)//有行数受影响，表示插入成功
            {
                context.Response.Write("success");
            }
            else
                context.Response.Write("fail");
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}