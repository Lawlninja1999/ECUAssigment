using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Web;


namespace WebApplication1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            Label12.Visible = false;

            if (DropDownList1.SelectedValue.StartsWith("2"))
            {
                A3.Visible = false;
                Label9.Visible = false;
            }
            else
            {
                A3.Visible = true;
                Label9.Visible = true;
            }
            Label2.Visible = false;
            Label1.Visible = false;
            Label5.Visible = false;
            Label11.Visible = false;
            Label6.Visible = false;


            if (Session["Admin"] != null)
            {
                Response.Write("welcome " + Session["Admin"]);
            }
            else
            {
                Response.Redirect("default.aspx");
            }

           
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

            HttpPostedFile postedFile = FileUpload2.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Units where UnitCode=@Password", conn);
            cmd.Parameters.AddWithValue("@Password", UnitCode.Text);
            SqlDataReader Check;
            conn.Open();
            Check = cmd.ExecuteReader();

            if (UnitCode.Text == "")
            {
                Label1.Visible = true;
            }
            else if (UnitTitle.Text == "")
            {
                Label5.Visible = true;
            }
            else if (Coordinator.Text == "")
            {
                Label6.Visible = true;
            }
            else if (fileExtension.Contains(".docx") || fileExtension.Contains(".pdf"))
            {
                Label14.Visible = true;
                Label14.Text = "File is in wrong format, please make it a image";
            }
            else if (A1.Text == "" || A2.Text == "" || Exam.Text == "")
            {
                Label11.Visible = true;
            }
            else if (DropDownList1.SelectedValue.StartsWith("3") && A3.Text == "")
            {
                Label12.Visible = true;
            }
            else if (Check.HasRows)
            {
                Label2.Text = "UnitCode is already in the database";
                Label2.Visible = true;
                conn.Close();
            }
            else if (DropDownList1.SelectedValue.StartsWith("3") && A3.Text=="0")
            {
                Response.Write("Assignment 3 can not be 0 if the unit has 3 assignments");
                Response.End();
                    
            }

            else if (DropDownList1.SelectedValue.StartsWith("2"))
            {
                int number1 = int.Parse(A1.Text) + int.Parse(A2.Text) + int.Parse(Exam.Text);
                if (number1 != 100)
                {
                    Response.Write("<br>" + "Total Must be 100%");
                    Response.End();
                }
                else
                {
                    SqlData.Insert();
                    Response.Redirect("Units.aspx");
                }

            }

            else if (DropDownList1.SelectedValue.StartsWith("3"))
            {
                int number1 = int.Parse(A1.Text) + int.Parse(A3.Text) + int.Parse(A2.Text) + int.Parse(Exam.Text);
                if (number1 != 100)
                {
                    Response.Write("<br>" + "Total Must be 100%");
                    Response.End();
                }
                else
                {
                   
                      
                    SqlData.Insert();
                    Response.Redirect("Units.aspx");
                }
            }
            else
            {

            }
        }
        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue.StartsWith("2"))
            {
                Label9.Visible = false;
                A3.Visible = false;
                A3.Text = "0";


            }
            else
            {

                Label9.Visible = true;
                A3.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.Rows[GridView1.EditIndex];
            DropDownList Dropdown = (DropDownList)row.FindControl("DropDownList2");
            TextBox Text1 = (TextBox)row.FindControl("TextBox4");
            TextBox Text2 = (TextBox)row.FindControl("TextBox5");
            TextBox Text3 = (TextBox)row.FindControl("TextBox6");
            TextBox Text4 = (TextBox)row.FindControl("TextBox7");


            if (Dropdown.SelectedValue.StartsWith("2"))
            {
               
                int number = int.Parse(Text1.Text) + int.Parse(Text2.Text) + int.Parse(Text4.Text);
                if (number != 100)
                {
                    Response.Write("<br>"+ "Must be 100, remember if you select (2) assignments, Assignment 3 will auto be set to 0 on submit");
                    Response.End();
                }
                else if (Text3.Text == "" || Text3.Text != "")
                {
                    Text3.Text = "0";
                }
                else
                {
                }

            }
            else if (Dropdown.SelectedValue.StartsWith("3"))
            {
                int number = int.Parse(Text1.Text) + int.Parse(Text2.Text) + int.Parse(Text3.Text) + int.Parse(Text4.Text);
                if (number != 100)
                {
                    Response.Write("<br>"+"Must be 100");
                    Response.End();
                }
                if(Text3.Text.StartsWith(("0")) || Text3.Text=="")
                {
                    Response.Write("<br>"+"Assignment 3 is null and there are three assignments");
                    Response.End();

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/files/") + FileUpload1.FileName);
            }
            else
            {
            }

           

            DataTable dt = new DataTable();
            dt.Columns.Add("File", typeof(string));
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Size", typeof(string));

            foreach (string str in Directory.GetFiles(Server.MapPath("~/files/")))
            {

                FileInfo fi = new FileInfo(str);
         
                    dt.Rows.Add(fi.Name, DropDownList3.SelectedValue, fi.Length);
           
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();
           
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "filename="
                    + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/files/")
                    + e.CommandArgument);
                Response.End();
            }
        }
    }
    }
    
