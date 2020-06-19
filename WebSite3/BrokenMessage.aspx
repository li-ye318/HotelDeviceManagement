<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrokenMessage.aspx.cs" Inherits="Broken" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Height="793px" HorizontalAlign="Center">
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查看待维修设备" />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                </asp:GridView>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
