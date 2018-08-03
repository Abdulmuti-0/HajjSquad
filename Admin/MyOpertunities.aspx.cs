using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MyOpertunities : System.Web.UI.Page
{
    DataTable dt;
    SqlConnection con;
    SqlCommand com;
    int UserId = 2;//refare to Company Account
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetOPertunites(UserId);
        }
    }

    void GetOPertunites(int CompanyID)
    {
        dt = connectToDB.GetTable2("Select ID, Name, SUBSTRING(Description,0,100) as Description, (MaxNoOfValunter - EnrolledOfValunter)as RemainOpertunities  from oppertiunity Where CompanyID = ("+ CompanyID+")");
        if (dt != null)
        {
            if (dt.Rows.Count > 0)
            {
                repOper.DataSource = dt;
                repOper.DataBind();
            }
        }
    }

    protected void lbtnViewEnrolled_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewEnrolled.aspx?Id="+(sender as LinkButton).CommandName);
    }
}
