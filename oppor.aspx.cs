using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class oppor : System.Web.UI.Page
{
    DataTable dt;
    SqlConnection con;
    SqlCommand com;
    int UserId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            GetOPertunites();
        }
    }

    void GetOPertunites()
    {
        dt = connectToDB.GetTable2("Select ID, Name, SUBSTRING(Description,0,100) as Description, (MaxNoOfValunter - EnrolledOfValunter)as RemainOpertunities  from oppertiunity");
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                repOper.DataSource = dt;
                repOper.DataBind();
            }
        }
    }

    protected void lbtnEnroll_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrWhiteSpace(Session["ID"] + ""))
        {
            Response.Redirect("~/login.aspx");
        }
        UserId = int.Parse(Session["ID"] + "");
        con = connectToDB.connect();
        
        com = new SqlCommand("AddParticipations", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("OppId", int.Parse((sender as LinkButton).CommandName));
        com.Parameters.AddWithValue("UserId", UserId);
        //com.Parameters.AddWithValue("", "");
        if(com.ExecuteNonQuery()>0)
        {
            divMsg.Visible = true;
            lblMsg.Text = "Applyed Succefully";
        }
        else
        {
            divMsg.Visible = true;
            lblMsg.Text = "Sorry can't Apply";
        }
        com.Dispose();
        con.Close();
        
    }
}
