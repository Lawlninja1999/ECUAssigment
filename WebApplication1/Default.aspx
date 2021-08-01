<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <asp:Label ID="Label1" runat="server" BorderColor="White" BorderStyle="Groove" BorderWidth="10px" Font-Bold="True" ForeColor="Black" Width="154px"></asp:Label>
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/LoginPage2.aspx" BorderColor="Black" BorderStyle="Inset" CssClass="active" ForeColor="Black" Width="126px" CausesValidation="False" Height="27px">Login</asp:LinkButton>
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" BorderStyle="Double" Width="79px">Logout</asp:LinkButton>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LoginCon %>" SelectCommand="SELECT [Assignment_1_Score], [Assignment_2_Score], [Exam_Score] FROM [Unit_Results]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
      

</asp:Content>
