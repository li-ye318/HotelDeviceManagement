<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdministratorBorrow.aspx.cs" Inherits="AdministratorBorrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Panel ID="Panel1" runat="server" Height="785px" HorizontalAlign="Center" BackImageUrl="~/images/aspx.jpg">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查询所有转借信息" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查询未归还设备的人员信息" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="请输入姓名："></asp:Label>
            <asp:TextBox ID="PersonName" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="查询" />
            &nbsp;<asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="返回" />
        </asp:Panel>
    </form>
</body>
</html>
