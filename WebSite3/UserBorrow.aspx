<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserBorrow.aspx.cs" Inherits="UserBorrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Height="712px" HorizontalAlign="Center">
                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center">
                </asp:GridView>
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="查看未归还" />
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 27px" Text="返回" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
