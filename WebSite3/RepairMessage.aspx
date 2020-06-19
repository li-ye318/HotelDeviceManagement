<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RepairMessage.aspx.cs" Inherits="RepairMessage" %>

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
        <asp:Panel ID="Panel1" runat="server" Height="767px" HorizontalAlign="Center">
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="查看维修成功" />
            &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="height: 27px" Text="返回" />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center">
            </asp:GridView>
        </asp:Panel>
    </form>
</body>
</html>
