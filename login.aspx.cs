using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    private string abc = WebConfigurationManager.ConnectionStrings["DBConStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
        SqlConnection con = new SqlConnection(abc);

    }



    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(abc);
        con.Open();
        string qry = "select * from [User] where Uname ='" + txtUserName.Text + "' AND Pass ='" + txtPassword.Text + "' ;";
        SqlCommand cmd = new SqlCommand(qry, con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        int i = cmd.ExecuteNonQuery();
        int a = dt.Rows.Count;

        if (dt.Rows.Count > 0)
        {
            Session["username"] = txtUserName.Text;
            Session["Role"] = dt.Rows[0][3]+"";
            Session["RoleID"] = dt.Rows[0][2]+"";

            Session["ID"] = (int)dt.Rows[0][0];
            if (Session["RoleID"]+"" == "1")
            {
                Response.Redirect("MyProfile.aspx?ID=" + (int)dt.Rows[0][0]);
                lblFaild.Visible = false;
            }
            else if (Session["RoleID"]+""== "2")
            {
                Response.Redirect("~/Admin/MyOpertunities.aspx");
                lblFaild.Visible = false;
            }
            

        }

        else
        {
            lblFaild.Visible = true;
        }
        con.Close();

    }

}
