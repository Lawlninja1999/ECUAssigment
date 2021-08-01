using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Web;

namespace WebApplication1
{

    public partial class Student : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
   
            if (Session["Member"] != null)
            {
                Response.Write("welcome " + Session["Member"]);
            }
            else
            {
                Response.Redirect("default.aspx");
            }

            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label15.Visible = false;


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
         
                HttpPostedFile postedFile = FileUpload2.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Unit_Results where UnitCode=@Email and StudentID=@Password and Year=@Year and Semester=@Semester", conn);
            cmd.Parameters.AddWithValue("@Email", UnitCode.SelectedValue);
            cmd.Parameters.AddWithValue("@Password", StudentID.Text);
            cmd.Parameters.AddWithValue("@Year", Year.Text);
            cmd.Parameters.AddWithValue("@Semester", Semester.Text);
            SqlDataReader loginCheck;
            conn.Open();
            loginCheck = cmd.ExecuteReader();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cm = new SqlCommand("select A1 as score_1,A2 as Score_2,A3 as Score_3, Exam as Exam, Number as Number from Units where UnitCode=@Email ", con);
            cm.Parameters.AddWithValue("@Email", UnitCode.SelectedValue);
            SqlDataReader Check;
            con.Open();
            Check = cm.ExecuteReader();
            Check.Read();
            if (StudentID.Text == "")
            {
                Label2.Visible = true;
            }
            else if (Semester.Text == "")
            {
                Label3.Visible = true;
            }
            else if (UnitCode.SelectedValue == "")
            {
                Label14.Text = "**";
                Label14.Visible = true;
            }
            else if (Year.Text == "")
            {
                Label4.Visible = true;
            }
          else if (fileExtension.Contains(".docx" ) || fileExtension.Contains(".pdf"))
            {
                Label15.Visible = true;
            }
            else if (Assignement_1_Score.Text == "")
            {
                Label5.Visible = true;
            }

            else if (Assignment_2_Score.Text == "")
            {
                Label6.Visible = true;
            }
            else if (Exam_Score.Text == "")
            {
                Label7.Visible = true;
            }
            else if (A3.Text == "")
            {
                A3.Text = "0";
            }
            else if (int.Parse(Assignement_1_Score.Text) > int.Parse(Check["score_1"].ToString()))
            {
                Label10.Text = "Assignment 1 mark can not be more then " + int.Parse(Check["score_1"].ToString());
                Label10.Visible = true;
            }
            else if (int.Parse(Assignment_2_Score.Text) > int.Parse(Check["score_2"].ToString()))
            {
                Label11.Text = "Assignment 2 Mark can not be more then " + int.Parse(Check["score_2"].ToString());
                Label11.Visible = true;
            }
            else if (A3.Text != "0" && int.Parse(A3.Text) > int.Parse(Check["score_3"].ToString()))
            {
                Label12.Text = "Assignment 3 Mark can not be more then " + int.Parse(Check["score_3"].ToString());
                Label12.Visible = true;
            }
            else if (int.Parse(Exam_Score.Text) > int.Parse(Check["Exam"].ToString()))
            {
                Label13.Text = "Exam Mark can not be more then " + int.Parse(Check["Exam"].ToString());
                Label13.Visible = true;
            }
            else if (loginCheck.HasRows)

            {
                Label8.Visible = true;
                Label8.Text = "Data already in database";

                conn.Close();
            }

            else
            {
                SqlDataSource6.Insert();
                Response.Redirect("Student.aspx");
            }
        }

        protected void UnitCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select Number AS count from Units where UnitCode=@UnitCode", conn);
            cmd.Parameters.AddWithValue("@UnitCode", UnitCode.SelectedValue);
            SqlDataReader Check;
            conn.Open();
            Check = cmd.ExecuteReader();

            Check.Read();

            if (UnitCode.SelectedValue != "")
            {
                string number = Check["count"].ToString();
                if (number.StartsWith("2"))
                {
                    A3.Visible = false;
                    A3.Text = "0";
                    Label9.Visible = false;


                }
                else if (number.StartsWith("3"))
                {
                    A3.Visible = true;
                    Label9.Visible = true;
                    Label9.Text = "Assignment 3";
                }
            }
            else
            {
                Response.Write("choose a code");
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.Rows[GridView1.EditIndex];
            DropDownList Dropdown = (DropDownList)row.FindControl("DropDownList1");
            TextBox Text1 = (TextBox)row.FindControl("TextBox4");
            TextBox Text2 = (TextBox)row.FindControl("TextBox6");
            TextBox Text3 = (TextBox)row.FindControl("TextBox7");
            TextBox Text4 = (TextBox)row.FindControl("TextBox8");
            FileUpload files = (FileUpload)row.FindControl("FileUpload3");
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cm = new SqlCommand("select A1 as score_1,A2 as Score_2,A3 as Score_3, Exam as Exam, Number as Number from Units where UnitCode=@Email ", con);
            cm.Parameters.AddWithValue("@Email", Dropdown.SelectedValue);
            SqlDataReader Check;
            con.Open();
            Check = cm.ExecuteReader();
            Check.Read();
            int num = int.Parse(Check["Number"].ToString());
            if (num.ToString().StartsWith(("2")))
            {
                Text3.Text = "0";
            }

            if (int.Parse(Text1.Text) > int.Parse(Check["score_1"].ToString()))
            {
                Response.Write("Assignment 1Mark can not be more then " + int.Parse(Check["score_1"].ToString()));
                Response.End();
            }
            else if (int.Parse(Text2.Text) > int.Parse(Check["score_2"].ToString()))
            {
                Response.Write("Assignment 2 mark can not be more then " + int.Parse(Check["score_2"].ToString()));
                Response.End();
            }
            else if (Text3.Text != "0" && int.Parse(Text3.Text) > int.Parse(Check["score_3"].ToString()))
            {
                Response.Write("Assignment 3 mark  can not be more then " + int.Parse(Check["score_3"].ToString()));
                Response.End();
            }
            else if (int.Parse(Text4.Text) > int.Parse(Check["Exam"].ToString()))
            {
                Response.Write("Exam mark can not be more then " + int.Parse(Check["Exam"].ToString()));
                Response.End();
            }
            else
            {
            }
           
            }

            }
        }
        
