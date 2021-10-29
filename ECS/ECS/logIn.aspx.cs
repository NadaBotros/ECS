using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace ECS
{
    public partial class logIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string name = TextBox1.Text;
            string password = TextBox2.Text;

            String mycon = "Data Source=LAPTOP-9HVSFPOB; Initial Catalog=ECS;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            string query = "Select Count(1) From Users Where userName=@name And password=@password";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@password", password);
            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                Session["UserName"] = name;
                Response.Redirect("homePage.aspx");
            }
            else
            {
                Label3.Text = "Incorrect UserName or Password";
            }

           

        }
    
    }
}