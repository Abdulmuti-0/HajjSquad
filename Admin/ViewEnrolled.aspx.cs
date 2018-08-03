using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ViewEnrolled : System.Web.UI.Page
{
    DataTable dt;
    SqlConnection con;
    SqlCommand com;
    int OppId =0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (int.TryParse(Request.QueryString["ID"] + "", out OppId))
            ;
        if (!IsPostBack)
        {
            GetOPertunites(OppId);
        }
    }

    void GetOPertunites(int OppId)
    {
        dt = connectToDB.GetTable2(@"
            Select P.ID, P.OppId, op.Name as OppertunityName, P.UserID, U.Name as Name ,SUBSTRING(U.Description,0,100) as Description 
from Participations p
Inner Join  Oppertiunity op on p.OppId = op.ID
Inner Join [User] U on p.UserId = U.ID

Where ( P.OppId = " + OppId + ")");
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                repOper.DataSource = dt;
                repOper.DataBind();
            }
        }
    }

    protected void lbtnAccept_Click(object sender, EventArgs e)
    {
        con = connectToDB.connect();

        com = new SqlCommand("UpdatePartStatus", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("Id", int.Parse((sender as Button).CommandName));
        com.Parameters.AddWithValue("PartStatus", 2);
        //com.Parameters.AddWithValue("", "");
        if (com.ExecuteNonQuery() > 0)
        {
            divMsg.Visible = true;
            lblMsg.Text = "Accepted Succefully";
        }
        else
        {
            divMsg.Visible = true;
            lblMsg.Text = "Sorry can't Accept";
        }
        com.Dispose();
        con.Close();

    }

    protected void lbtnReject_Click(object sender, EventArgs e)
    {
        con = connectToDB.connect();

        com = new SqlCommand("UpdatePartStatus", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("Id", int.Parse((sender as Button).CommandName));
        com.Parameters.AddWithValue("PartStatus", 3);
        //com.Parameters.AddWithValue("", "");
        if (com.ExecuteNonQuery() > 0)
        {
            divMsg.Visible = true;
            lblMsg.Text = "Rejected Succefully";
        }
        else
        {
            divMsg.Visible = true;
            lblMsg.Text = "Sorry can't Reject";
        }
        com.Dispose();
        con.Close();

    }
}
