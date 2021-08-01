using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["Member"] != null || Session["Admin"] != null)
            {
                if (Session["Member"] != null )
                {
                    Label1.Text = Session["Member"].ToString();
                }
                else
                {
                    Label1.Text= Session["Admin"].ToString();
                }
                LinkButton3.Visible = true;
                LinkButton2.Visible = false;
            }
        else
            {
                Label1.Text = "Welcome to the site";
                LinkButton3.Visible = false;
            }

          
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
          
                Session.Clear();
                Response.Redirect("Default.aspx");
               
            
            
        }
    }
    }
