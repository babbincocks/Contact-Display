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

            string name = txtName.Text;
            string addressOne = txtAddress1.Text;
            string city = txtCity.Text;
            string phone = txtPhone.Text;
            string addressTwo;
            string email;

            if(txtAddress2.Text == "Address 2" || txtAddress2.Text == "")
            {
                addressTwo = null;
            }
            else
            {
                addressTwo = txtAddress2.Text;
            }

            if(txtEmail.Text == "E-mail" || txtEmail.Text == "")
            {
                email = null;
            }
            else
            {
                email = txtEmail.Text;
            }

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

                            SqlParameter prmName = new SqlParameter("@Name", name);
                            SqlParameter prmAddress1 = new SqlParameter("@Address1", addressOne);
                            SqlParameter prmAddress2 = new SqlParameter("@Address2", addressTwo);
                            SqlParameter prmCity = new SqlParameter("@City", city);
                            SqlParameter prmPhone = new SqlParameter("@Phone", phone);
                            SqlParameter prmEmail = new SqlParameter("@Email", email);

                            sqlComm.Parameters.Add(prmName);
                            sqlComm.Parameters.Add(prmAddress1);
                            sqlComm.Parameters.Add(prmAddress2);
                            sqlComm.Parameters.Add(prmCity);
                            sqlComm.Parameters.Add(prmPhone);
                            sqlComm.Parameters.Add(prmEmail);

                            sqlComm.Connection.Open();

                            sqlComm.ExecuteNonQuery();

                            sqlComm.Connection.Close();

                            gvContacts.DataBind();

                            txtName.Text = "Name";
                            txtAddress1.Text = "Address 1";
                            txtAddress2.Text = "Address 2";
                            txtCity.Text = "City";
                            txtPhone.Text = "Phone";
                            txtEmail.Text = "E-mail";

                        }
                        else
                        {
                            Response.Write("You need to insert a valid phone number.");
                        }
                    }
                    else
                    {
                        Response.Write("You need to insert a valid city.");
                    }
                }
                else
                {
                    Response.Write("You need to insert a valid address.");
                }
                
            }
            else
            {
                Response.Write("You need to insert a valid name.");
            }
        }


    }
}