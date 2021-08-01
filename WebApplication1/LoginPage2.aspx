<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage2.aspx.cs" Inherits="WebApplication1.LoginPage2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br/>
        Login as a member<br />
        <br />
    
        Enter Email:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Enter
        Password:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Login2" runat="server"  Text="Button" Width="227px" OnClick="Login2_Click1"  />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
