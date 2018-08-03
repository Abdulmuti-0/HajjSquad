using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Data.OleDb;

/// <summary>
/// Connection Class Used By MK, can connect, Execute select statement and returne dataset, datatabe
/// </summary>

public class connectToDB
{
    static SqlConnection con;
    static string constr;
    static SqlDataAdapter da;
    static DataSet ds;

    /// <summary>
    /// Connection Constructor
    /// </summary>
	public connectToDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Declaring new instance to SqlConnection, preparing to open a new connection
    /// </summary>
    /// <returns>new instance of SqlConnection</returns>
    public static SqlConnection getConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["DBConStr"].ConnectionString);
    }
    /// <summary>
    /// open a connection to the database
    /// </summary>
    /// <returns>opend connection, need to close it after finishing</returns>
    public static SqlConnection connect()
    {
        constr = ConfigurationManager.ConnectionStrings["DBConStr"].ConnectionString;
        con = new SqlConnection(constr);
        con.Open();
        return con;
    }
    public static SqlConnection connect(string ConnectionString)
    {
        //constr = ConfigurationManager.ConnectionStrings["DBConStr"].ConnectionString;
        con = new SqlConnection(ConnectionString);
        con.Open();
        return con;
    }
    /// <summary>
    /// Execute a select Statement
    /// </summary>
    /// <param name="SQLCommand">Select Statement</param>
    /// <returns>DataSet</returns>
    public static DataSet ReadDBData(string SqlCmd)
    {
        SqlConnection con = connect();
        SqlDataAdapter da = new SqlDataAdapter();
        ds = new DataSet();
        da.SelectCommand = new SqlCommand(SqlCmd, con);
        da.Fill(ds);
        da.Dispose();
        con.Close();
        return ds;
    }
    //------------------------------------------------------------------------------------
    /// <summary>
    /// Get Data Table from Database To memory
    /// </summary>
    /// <param name="selectQuery">Select Statment</param>
    /// <returns>One DataTable</returns>
    public static DataTable GetTable(string selectQuery)
    {
        con = connectToDB.getConnection();
        //con.Open();
        using (con)
        {
            da = new SqlDataAdapter();
            ds = new DataSet();

            da.SelectCommand = new SqlCommand(selectQuery, con);

            da.Fill(ds);
            try
            {
                return ds.Tables[0];
            }
            catch
            {
                return null;
            }
        }
    }
    public static DataTable GetTable2(string selectQuery)
    {
        DataTable dt = new DataTable();
        con = connectToDB.getConnection();
        //con.Open();
        using (con)
        {
            da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand(selectQuery, con);

            da.Fill(dt);
            return dt;
        }
    }
    //---------------------------------------------------------------------------------------------------------


}

