using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddOpertunities : System.Web.UI.Page
{
    DataTable dt;
    SqlConnection con;
    SqlCommand com;
    int UserId = 2;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddOpertunity_Click(object sender, EventArgs e)
    {
        AddOpertunity();
    }

    void AddOpertunity()
    {
        int categoryID = int.Parse(Categories.SelectedValue);
        string name = Name.Text;
        string description = Descriptions.Text;
        int maxNoOfValunter = int.Parse(MaxNoOfValunter.Text);

        con = connectToDB.connect();
        

        com = new SqlCommand("AddOpertunity", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("Name", name);
        com.Parameters.AddWithValue("Description", description);

        com.Parameters.AddWithValue("CompanyID", UserId);
        com.Parameters.AddWithValue("MaxNoOfValunter", maxNoOfValunter);
        com.Parameters.AddWithValue("CategoryID", categoryID);

        //com.Parameters.AddWithValue("", "");
        if (com.ExecuteNonQuery() > 0)
        {
            divMsg.Visible = true;
            lblMsg.Text = "Added Succefully";
        }
        else
        {
            divMsg.Visible = true;
            lblMsg.Text = "Sorry can't Add";
        }
        com.Dispose();
        con.Close();

    }
}