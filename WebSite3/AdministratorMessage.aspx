<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdministratorMessage.aspx.cs" Inherits="AdministratorMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Height="789px" HorizontalAlign="Center">
                <asp:Label ID="Label1" runat="server" Text="请输入设备名称："></asp:Label>
                <asp:TextBox ID="DeviceName" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="OK" runat="server" OnClick="OK_Click" Text="确定" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回" />
                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center">
                </asp:GridView>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
