using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace SQLDisplayGrid
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if(txtName.Text != "Name" && txtName.Text != null)
            {
                if(txtAddress1.Text != "Address 1" && txtAddress1.Text != null)
                {
                    if (txtCity.Text != "City" && txtCity.Text != null)
                    {
                        if(txtPhone.Text != "Phone" && txtPhone.Text != null)
                        {
                            SqlConnection sqlConn = new SqlConnection(WebConfigurationManager.ConnectionStrings["Desktop Door"].ConnectionString);
                            SqlCommand sqlComm = new SqlCommand("dbo.sp_InsertContact", sqlConn);

                            sqlComm.CommandType = System.Data.CommandType.StoredProcedure;

                            SqlParameter prmName = new SqlParameter("@Name", txtName.Text);
                            SqlParameter prmAddress1 = new SqlParameter("@Address1", txtAddress1.Text);
                            SqlParameter prmAddress2 = new SqlParameter("@Address2", txtAddress2.Text);
                            //TODO: Continue here, put in parameters, add them to the sql command, and executenonquery.

                        }
                    }
                }
                
            }
            else
            {
                Response.Write("You need to insert a valid name.");
            }
        }


    }
}