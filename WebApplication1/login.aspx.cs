using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void Login2_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Login where Email=@Email and Password=@Password and Type=0", conn);
            cmd.Parameters.AddWithValue("@Email", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox2.Text);

            SqlDataReader loginCheck;
            conn.Open();
            loginCheck = cmd.ExecuteReader(); // 

            if (loginCheck.Read())
            {

                string username = loginCheck["Email"].ToString();
                Session["Admin"] = username;
                Response.Redirect("Default.aspx");

            }
            else
            {

                Response.Redirect("login.aspx");
            }
        }
    }
}