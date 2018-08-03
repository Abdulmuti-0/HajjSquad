using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(Session["username"] + ""))
        {
            lblUser.Text = Session["username"] + "";
        }
        else
        {
            lblUser.Text = "Please login ...";
        }
        if (Session["RoleID"] + "" == "2")
        {
            liAdmin.Visible = true;
        }
        else
            liAdmin.Visible = false;
    }
}
