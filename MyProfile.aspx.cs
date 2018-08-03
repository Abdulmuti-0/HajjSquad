using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class MyProfile : System.Web.UI.Page
{
    private string abc = WebConfigurationManager.ConnectionStrings["DBConStr"].ConnectionString;
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrWhiteSpace(Session["ID"] + ""))
        {
            Response.Redirect("~/login.aspx");
        }
        id = int.Parse(Session["ID"] + "");
        SqlCommand com;
        //SqlDataAdapter sqlda;
        //DataSet ds;
        string str;
        SqlConnection con = new SqlConnection(abc);
        con.Open();
        str = "select * from [User] where Id=" + id + ";";
        com = new SqlCommand(str, con);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            TextName.Text = reader["Name"].ToString();
            txtname1.Text = reader["Name"].ToString();
            txtemail1.Text = reader["email"].ToString();
            txtphone1.Text = reader["phone"].ToString();
            reader.Close();
            con.Close();

        }
        show();
        projectShow();
        totalProjects();
    }

    public void show()
    {
        
        SqlConnection con = new SqlConnection(abc);
        con.Open();

        SqlCommand cmd = new SqlCommand("Select ActivityName,ActivityDesc from Activity where EmpID = " + id + ";", con);

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(ds);

        Repeater1.DataSource = ds;

        Repeater1.DataBind();
    }

    public void projectShow()
    {
        
        SqlConnection con = new SqlConnection(abc);
        con.Open();

        SqlCommand cmd = new SqlCommand("Select * from oppertiunity;", con);

        DataSet ds = new DataSet();

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        da.Fill(ds);

        Repeater2.DataSource = ds;

        Repeater2.DataBind();
    }
    public void totalProjects()
    {
        SqlCommand com;
        //SqlDataAdapter sqlda;
        //DataSet ds;
        string str;
        SqlConnection con = new SqlConnection(abc);
        con.Open();
        str = "SELECT COUNT(*) AS counts from oppertiunity ;";
        com = new SqlCommand(str, con);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.Read())
        {
            txtTotalCounts.Text = reader["counts"].ToString();


        }
    }
}
