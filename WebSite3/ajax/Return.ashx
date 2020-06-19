<%@ WebHandler Language="C#" Class="Return" %>
using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
public class Return : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string DeviceName = context.Request["DeviceName"].ToString();
        string PersonName = context.Request["PersonName"].ToString();
        string Count = context.Request["Count"].ToString();
        string Department = context.Request["Department"].ToString();

        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Borrow where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString()+ "' and credit_Department='"+Department.ToString()+"' and Is_Return='"+"未归还"+"'";
        SqlCommand comm = new SqlCommand(str, con);
        if (comm.ExecuteScalar() != null)
        {
            string s = "select count from Borrow where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString() + "'and credit_Department='"+Department.ToString()+"'";
            SqlCommand com = new SqlCommand(s, con);
            if (int.Parse(com.ExecuteScalar().ToString())!=int.Parse(Count.ToString()))
                context.Response.Write("fail2");  //归还数量不正确
            else
            {
                string str1 = "update Borrow set Is_Return='" + "已归还" + "' where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString() + "'";
                SqlCommand comm1 = new SqlCommand(str1, con);
                comm1.ExecuteNonQuery();
                string str2 = "select number from Message where device_name='" + DeviceName.ToString() + "'";
                SqlCommand sql = new SqlCommand(str2, con);
                int i = int.Parse(sql.ExecuteScalar().ToString()) + int.Parse(Count.ToString());
                string str3 = "update Message set number='" + i.ToString() + "'where device_name='" + DeviceName.ToString() + "'";
                SqlCommand co = new SqlCommand(str3, con);
                co.ExecuteNonQuery();
                context.Response.Write(i.ToString());
            }
        }
        else//没有此条转借记录  设备已经归还  身份信息不正确
        {
            string str1 = "select * from Borrow where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString()+ "'";
            SqlCommand co = new SqlCommand(str1, con);
            if (co.ExecuteScalar() == null)
                context.Response.Write("fail1");//没有此条转借记录
            else
            {
                string str2 = "select credit_Department from Borrow where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString() + "'";
                SqlCommand sq = new SqlCommand(str2, con);
                if (sq.ExecuteScalar().ToString().Trim() != Department.ToString().Trim())
                    context.Response.Write("fail4");//身份信息不正确
                else
                {
                    string str3 = "select Is_Return from Borrow where device_name='" + DeviceName.ToString() + "' and experienced_name='" + PersonName.ToString()+ "' and credit_Department='"+Department.ToString()+"'";
                    SqlCommand sql = new SqlCommand(str3, con);
                    if (sql.ExecuteScalar().ToString().Trim() == "已归还")
                        context.Response.Write("fail3");//设备已归还情况
                }
            }
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }
}