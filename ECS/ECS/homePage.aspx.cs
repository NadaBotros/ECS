using System;
using System.Collections.Generic;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Diagnostics;

namespace ECS
{
    public partial class homePage : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        protected DataSet ds { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!Page.IsPostBack)
            {
                data();
           


            }


        }
        private void data()
        {
            DateTime now = DateTime.Now;
            string today = now.ToString("dddd");
            String mycon = "Data Source=LAPTOP-9HVSFPOB; Initial Catalog=ECS;Integrated Security=True";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            string query = "Select * From Meals where today =" + "'" + today + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;

            SqlDataReader rd = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[3] {
                        new DataColumn("Id", typeof(int)),
                        new DataColumn("mealName", typeof(string)),
                        new DataColumn("OrderButtons", typeof(string))
                        });
            dt.Load(rd);
            ds = new DataSet();
            ds.Tables.Add(dt);

        }
 
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["UserName"].ToString().Split('_')[1] == "admin")
            {
                DateTime now = DateTime.Now;
                string today = now.ToString("dddd");
                string meal = txtMeal.Value;
                int dayNumber = 0;

                if (today == "Sunday")
                    dayNumber = 1;
                if (today == "Monday")
                    dayNumber = 2;
                if (today == "Tuesday")
                    dayNumber = 3;
                if (today == "Wednesday")
                    dayNumber = 4;
                if (today == "Thursday")
                    dayNumber = 5;
                if (today == "Friday")
                    dayNumber = 6;
                if (today == "Saturday")
                    dayNumber = 7;

                //test.Text = today + " --- " + meal + " ---- " + dayNumber;

                String mycon = "Data Source=LAPTOP-9HVSFPOB; Initial Catalog=ECS;Integrated Security=True";
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                string query = "insert into Meals(mealName,mealDayNumber,today) values(@mealName,@mealDayNumber,@today)";

                SqlCommand cmd = new SqlCommand();

                cmd.Parameters.AddWithValue("mealName", meal);
                cmd.Parameters.AddWithValue("mealDayNumber", dayNumber);
                cmd.Parameters.AddWithValue("today", today);
                cmd.CommandText = query;
                cmd.Connection = con;
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('New Meal was inserted Successfully ..')</script>");
                }
                clear();
                data();
            }
        }
        private void clear()
        {
            txtMeal.Value = "";
        }
        protected void Order_Meal(object sender, EventArgs e)
        {
            string mealID = Hidden1.Value;

           

            DateTime now = DateTime.Today;
      
            String mycon = "Data Source=LAPTOP-9HVSFPOB; Initial Catalog=ECS;Integrated Security=True ;MultipleActiveResultSets=True;";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            // Get the user ID
            string queryUserID = "select * from Users where userName = " + "'"+Session["UserName"].ToString()+"'";


            SqlCommand cmdd = new SqlCommand();
            cmdd.CommandText = queryUserID;
            cmdd.Connection = con;
            SqlDataReader reader = cmdd.ExecuteReader();
            String id = "";
            if (reader.Read())
            {
                id = reader["userID"].ToString();
              
                // Check if already order exist

                string queryOrder = "select * from Orders where userOID = @id and todayDate =@now";
                SqlCommand cmdx = new SqlCommand();
                cmdx.CommandText = queryOrder;
                cmdx.Connection = con;
                cmdx.Parameters.AddWithValue("@id", id);
                cmdx.Parameters.AddWithValue("@now", now);
                SqlDataAdapter da = new SqlDataAdapter(cmdx);
                DataTable dt = new DataTable();

                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {


                    Response.Write("<script>alert('You already ordered a meal for today you cannot choose two at same day :(( ...')</script>");


                }
                else
                {
                    string query = "insert into Orders(userOID,mealOID,todayDate) values(@userOID,@mealOID,@todayDate)";

                    SqlCommand cmd = new SqlCommand();


                    cmd.Parameters.AddWithValue("userOID", id);
                    cmd.Parameters.AddWithValue("mealOID", mealID);
                    cmd.Parameters.AddWithValue("todayDate", now);
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    int t = cmd.ExecuteNonQuery();
                    if (t > 0)
                    {
                        Response.Write("<script>alert('your meal was ordered Successfully .. ')</script>");
                    }


                }
            }
            else
                {
                Response.Write("<script>alert('nothinggg')</script>");

            }






           

            con.Close();

            data();

        }




    }
  
}