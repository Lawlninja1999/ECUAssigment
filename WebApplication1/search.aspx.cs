using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
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
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            GridView4.Visible = false;
            GridView5.Visible = false;
            GridView6.Visible = false;
            DropDownList2.Visible = false;
            DropDownList3.Visible = false;
            DropDownList5.Visible = false;
            DropDownList4.Visible = false;
            DropDownList6.Visible = false;
            DropDownList7.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {



            // new Year and code
            if (TextBox1.Text != "" || DropDownList1.SelectedValue != "")
            {
                if (TextBox1.Text.Length == 4 && DropDownList1.SelectedValue != "")
                {
                    //For Code and Year Combination
                    GridView2.Visible = true;
                    Label1.Visible = false;
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total from Unit_Results where Year=@Textbox AND UnitCode=@Dropdown", conn);
                    cmd.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();

                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();
                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }




                    }

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(UnitCode) AS count from Unit_Results where Year=@Textbox AND UnitCode=@Dropdown", con);
                    cm.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cm.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }




                // new StudentID and code


                else if (TextBox1.Text.Length == 8 && DropDownList1.SelectedValue != "")
                {
                    GridView4.Visible = true;
                    Label1.Visible = false;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total from Unit_Results where StudentID=@Textbox AND UnitCode=@Dropdown", conn);
                    cmd.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();

                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();
                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }
                    }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(UnitCode) AS count from Unit_Results where StudentID=@Textbox AND UnitCode=@Dropdown", con);
                    cm.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cm.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }
                //new semester and Dropdown



                else if (TextBox1.Text.Length == 1 && DropDownList1.SelectedValue != "")
                {
                    GridView3.Visible = true;
                    Label1.Visible = false;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total from Unit_Results where Semester=@Textbox AND UnitCode=@Dropdown", conn);
                    cmd.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();
                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();
                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }
                    }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(UnitCode) AS count from Unit_Results where Semester=@Textbox AND UnitCode=@Dropdown", con);
                    cm.Parameters.AddWithValue("@Dropdown", DropDownList1.SelectedValue);
                    cm.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }


                // new Dropdownlist only

                else if (DropDownList1.SelectedValue != "")
                {
                    GridView6.Visible = true;
                    Label1.Visible = false;

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total  from Unit_Results where UnitCode=@DropDown", conn);
                    cmd.Parameters.AddWithValue("@DropDown", DropDownList1.SelectedValue);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();
                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();

                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }
                    }

                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(UnitCode) AS count from Unit_Results where UnitCode=@DropDown", con);
                    cm.Parameters.AddWithValue("@DropDown", DropDownList1.SelectedValue);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }



                // new text only



                else if (TextBox1.Text != "")
                {
                    GridView5.Visible = true;
                    Label1.Visible = false;
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select  AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total from Unit_Results where Year=@Textbox OR Semester=@Textbox OR StudentID=@Textbox", conn);
                    cmd.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();

                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();

                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }

                    }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(Year) AS count from Unit_Results where Year=@Textbox OR Semester=@Textbox OR StudentID=@Textbox", con);
                    cm.Parameters.AddWithValue("@Textbox", TextBox1.Text);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }
            }
            else
            {
                if (CheckBox1.Checked)
                {
                    GridView1.Visible = true;
                    Label1.Visible = false;
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("select  AVG(Assignment_1_Score+Assignment_2_Score+Exam_Score+A3) AS Total from Unit_Results", conn);
                    SqlDataReader Check;
                    conn.Open();
                    Check = cmd.ExecuteReader();

                    if (Check.HasRows)
                    {
                        Check.Read();


                        string Assignment = Check["Total"].ToString();

                        if (Assignment != "")
                        {
                            Label3.Visible = true;
                            if (Assignment.Length < 3 && Assignment.StartsWith("1") || Assignment.StartsWith("2") || Assignment.StartsWith("3") || Assignment.StartsWith("4"))
                            {

                                Label3.Text = Assignment + " Failed";
                            }
                            else if (Assignment.StartsWith("5"))
                            {

                                Label3.Text = Assignment + " Passed";
                            }


                            else if (Assignment.StartsWith("6"))
                            {

                                Label3.Text = Assignment + " Cridts";
                            }
                            else if (Assignment.StartsWith("7"))
                            {

                                Label3.Text = Assignment + "D";
                            }
                            else if (Assignment.StartsWith("8") || Assignment.StartsWith("9") || Assignment.Contains("100"))
                            {

                                Label3.Text = Assignment + "HD";
                            }
                        }
                        else
                        {
                            Label3.Visible = false;
                        }

                    }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
                    SqlCommand cm = new SqlCommand("select COUNT(Year) AS count from Unit_Results ", con);
                    SqlDataReader Chec;
                    con.Open();
                    Chec = cm.ExecuteReader();
                    if (Chec.HasRows)
                    {
                        Chec.Read();
                        string Assignment = Chec["count"].ToString();
                        if (Assignment.StartsWith("0"))
                        {
                            Label1.Text = "No data found in database";
                            Label1.Visible = true;
                            Label2.Visible = false;
                        }
                        else
                        {
                            Label2.Text = Assignment + " Number of results being shown";
                            Label2.Visible = true;
                        }
                    }

                }
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList7.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;
        }
        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList6.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList5.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;
        }
        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList4.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;
        }

        protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
        {

            DropDownList3.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;
        }
        protected void GridView6_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            DropDownList2.Visible = true;
            Button1.Visible = false;
            TextBox1.Visible = false;
            DropDownList1.Visible = false;
            CheckBox1.Visible = false;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList2.SelectedValue.StartsWith("4") || DropDownList2.SelectedValue.StartsWith("3")
               || DropDownList2.SelectedValue.StartsWith("2") || DropDownList2.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList2.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList2.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList2.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList2.SelectedValue.StartsWith("8") || DropDownList2.SelectedValue.StartsWith("9")
              || DropDownList2.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList3.SelectedValue.StartsWith("4") || DropDownList3.SelectedValue.StartsWith("3")
                        || DropDownList3.SelectedValue.StartsWith("2") || DropDownList3.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList3.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList3.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList3.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList3.SelectedValue.StartsWith("8") || DropDownList3.SelectedValue.StartsWith("9")
              || DropDownList3.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
        }
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList4.SelectedValue.StartsWith("4") || DropDownList4.SelectedValue.StartsWith("3")
                     || DropDownList4.SelectedValue.StartsWith("2") || DropDownList4.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList4.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList4.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList4.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList4.SelectedValue.StartsWith("8") || DropDownList4.SelectedValue.StartsWith("9")
              || DropDownList4.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
            else
            {

            }

        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList5.SelectedValue.StartsWith("4") || DropDownList5.SelectedValue.StartsWith("3")
                    || DropDownList5.SelectedValue.StartsWith("2") || DropDownList5.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList5.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList5.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList5.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList5.SelectedValue.StartsWith("8") || DropDownList5.SelectedValue.StartsWith("9")
              || DropDownList5.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
            else
            {

            }
        }
        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList6.SelectedValue.StartsWith("4") || DropDownList6.SelectedValue.StartsWith("3")
                    || DropDownList6.SelectedValue.StartsWith("2") || DropDownList6.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList6.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList6.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList6.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList6.SelectedValue.StartsWith("8") || DropDownList6.SelectedValue.StartsWith("9")
              || DropDownList6.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
            else
            {

            }
        }

        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button1.Visible = false;
            if (DropDownList7.SelectedValue.StartsWith("4") || DropDownList7.SelectedValue.StartsWith("3")
                    || DropDownList7.SelectedValue.StartsWith("2") || DropDownList7.SelectedValue.StartsWith("1"))
            {

                Label5.Visible = true;
                Label5.Text = "Failed";
            }
            else if (DropDownList7.SelectedValue.StartsWith("5"))
            {

                Label5.Visible = true;
                Label5.Text = "Passed";
            }
            else if (DropDownList7.SelectedValue.StartsWith("6"))
            {

                Label5.Visible = true;
                Label5.Text = "Credits";
            }
            else if (DropDownList7.SelectedValue.StartsWith("7"))
            {

                Label5.Visible = true;
                Label5.Text = "D";
            }
            else if (DropDownList7.SelectedValue.StartsWith("8") || DropDownList7.SelectedValue.StartsWith("9")
              || DropDownList7.SelectedValue.Contains("100"))
            {

                Label5.Visible = true;
                Label5.Text = "HD";
            }
            else
            {

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("search.aspx");
        }
    }
}