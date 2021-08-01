using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class LoginPage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Member"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Login2_Click1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Login where Email=@Email and Password=@Password", conn);
            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);

            SqlDataReader loginCheck;
            conn.Open();
            loginCheck = cmd.ExecuteReader(); // 
            if (loginCheck.Read())
            {
                if (TextBox2.Text.Length == 8)
                {

                    string username = loginCheck["Email"].ToString();
                    Session["Member"] = username;
                    Response.Redirect("Default.aspx");

                }
                else if (TextBox2.Text.Length == 7)
                {

                    string username = loginCheck["Email"].ToString();
                    Session["Admin"] = username;
                    Response.Redirect("Default.aspx");

                }
            }

            else
            {

                Response.Redirect("LoginPage2.aspx");
            }
        }
    }
}
