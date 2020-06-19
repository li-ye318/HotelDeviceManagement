<%@ WebHandler Language="C#" Class="Repair" %>
using System;
using System.Web;
using System.Data.SqlClient;
public class Repair : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string repair_person = context.Request["repair_person"].ToString();
        string repair_time = context.Request["repair_time"].ToString();
        string result = context.Request["result"].ToString();
        string Device = context.Request["DeviceName"].ToString();
        string Person = context.Request["Person"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string st = "select * from Broken where device_name='" + Device.ToString() + "'and person='" + Person.ToString() + "'and result='" + "未维修" + "'";
        SqlCommand comm = new SqlCommand(st, con);
       
        if (comm.ExecuteScalar() != null)
        {
            string str = "update Broken set repair_person='" + repair_person.ToString() + "',repair_time='" + repair_time.ToString() + "',result='" + result.ToString() + "' where device_name='" + Device.ToString() + "'and person='" + Person.ToString() + "'";
            SqlCommand com = new SqlCommand(str, con);
            com.ExecuteNonQuery();
            if (result.ToString().Trim() == "维修失败")
            {
                string str1 = "select count from Borrow  where device_name='" + Device.ToString() + "' and experienced_name='" + Person.ToString() + "' ";
                SqlCommand sql = new SqlCommand(str1, con);
                int i = int.Parse(sql.ExecuteScalar().ToString())-1;
               
                    string str2 = "update Borrow set count='" + i.ToString() + "' where device_name='" + Device.ToString() + "' and experienced_name='" + Person.ToString() + "' and Is_Return='"+"未归还"+"'";
                    SqlCommand sqll = new SqlCommand(str2, con);//维修失败则此人转借记录数也会减1
                    sqll.ExecuteNonQuery();
                

                context.Response.Write("fail1");//维修失败则自动跳到报废界面

            }
            else
                context.Response.Write("success");//操作成功
        }
        else
            context.Response.Write("fail"); //没有此条故障记录
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}