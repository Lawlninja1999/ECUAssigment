<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Log In as a Admin<br />
    </p>
    <p>
    
        Enter Email:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Enter
        Password:&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="Login2" runat="server"  Text="Button"  Width="227px" OnClick="Login2_Click"  />
        </p>
    <p>
    
        <br />
        </p>
</asp:Content>
