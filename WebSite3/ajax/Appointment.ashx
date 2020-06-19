<%@ WebHandler Language="C#" Class="Appointment" %>
using System;
using System.Web;
using System.Data.SqlClient;
public class Appointment : IHttpHandler {
    public void ProcessRequest(HttpContext context)
    {
        string DeviceName = context.Request["DeviceName"].ToString();
        string PersonName = context.Request["PersonName"].ToString();
        string Count = context.Request["Count"].ToString();
        string Department = context.Request["Department"].ToString();
        string ReturnDate = context.Request["ReturnDate"].ToString();
        string Use = context.Request["Use"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//打开数据库的连接
        string str = "select * from Message where device_name='" + DeviceName.ToString() + "'";
        int n = int.Parse(Count.ToString());
        SqlCommand comm = new SqlCommand(str, con);//在设备表中找到相应的设备
        if (comm.ExecuteScalar() != null)
        {
            if (Enough(context) == 0 && Isappoint(context).Equals("是"))//只有一个但是已经被预约,例如会议室
                context.Response.Write("fail2");//当前设备已经被预约
            else if (Enough(context) < n)//要借出的设备数量大于目前库存数量
                context.Response.Write("fail1");//库存数量不足
            else if (PersonName.ToString() != "")//身份信息不正确
            {
                string query = "select department from Users where name='" + PersonName.ToString() + "'";
                SqlCommand co = new SqlCommand(query, con);
                if (co.ExecuteScalar() == null)
                    context.Response.Write("fail4");//请先注册
                else if (co.ExecuteScalar().ToString() != Department.ToString())
                    context.Response.Write("fail3");//身份信息不正确
                else
                {
                    //借出后库存数量要相应减少
                    int p;
                    string str3 = "select number from Message where device_name='" + DeviceName.ToString() + "'";
                    SqlCommand sql = new SqlCommand(str3, con);
                    p = int.Parse(sql.ExecuteScalar().ToString()) - int.Parse(Count.ToString());
                    string str2 = "update Message set number='" + p.ToString() + "'where device_name='" + DeviceName.ToString() + "'";
                    SqlCommand command = new SqlCommand(str2, con);
                    command.ExecuteNonQuery();
                    //向Borrow表中登记信息
                    string sqll = "insert into Borrow(device_name,count,experienced_name,credit_Department,uses,proposed_return_date,appointment,Is_Return) values('" + DeviceName.ToString() + "','" + Count.ToString() + "','" + PersonName.ToString() + "'," +
                        "'" + Department.ToString() + "','" + Use.ToString() + "','" + ReturnDate.ToString() + "','是','" + "未归还" + "')";
                    string str1 = "select * from Borrow";
                    SqlCommand com = new SqlCommand(str1, con);
                    com.CommandText = sqll;//插入到表中
                    com.ExecuteNonQuery();
                    context.Response.Write("success");
                }
            }
        }
        else
            context.Response.Write("fail5");
    }
    public int Enough(HttpContext context)
    {
        string DeviceName = context.Request["DeviceName"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//代开数据库的连接
        string  str1= "select number from Message where device_name='" +DeviceName.ToString()+ "'";
        SqlCommand com = new SqlCommand(str1,con);
        string s = com.ExecuteScalar().ToString();
        return int.Parse(s);
    }
    public string Isappoint(HttpContext context)
    {
        string DeviceName = context.Request["DeviceName"].ToString();
        String strConn = "Data Source=localhost;database=device management;Integrated Security=True;User Instance=False;";
        SqlConnection con = new SqlConnection(strConn);
        con.Open();//代开数据库的连接
        string s = "select appointment from Borrow where device_name='" + DeviceName.ToString() + "'and Is_Return='"+"未归还"+"'";
        SqlCommand com = new SqlCommand(s, con);
        s = com.ExecuteScalar().ToString();
        return s;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}