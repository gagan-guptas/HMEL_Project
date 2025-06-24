using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class CreateJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateRandomJobId();
            }
        }

        private void GenerateRandomJobId()
        {
            // Generate a random Job ID like JOB-XXXX (random 4 digits)
            Random rnd = new Random();
            int num = rnd.Next(1000, 9999);
            txtJobId.Text = "JOB-" + num;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            // Clear previous errors and message
            lblTitleError.Text = "";
            lblDescError.Text = "";
            lblLocError.Text = "";
            lblTypeError.Text = "";
            lblMessage.Text = "";

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                lblTitleError.Text = "This is required";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                lblDescError.Text = "This is required";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtLocation.Text))
            {
                lblLocError.Text = "This is required";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(ddlType.SelectedValue))
            {
                lblTypeError.Text = "This is required";
                isValid = false;
            }

            if (!isValid) return;

            // If valid, show success message (no DB)
            lblMessage.Text = $"Job '{txtTitle.Text}' posted successfully with ID {txtJobId.Text}!";

            // Clear form except Job ID (generate new)
            ClearFields();
            GenerateRandomJobId();
        }

        private void ClearFields()
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtLocation.Text = "";
            ddlType.SelectedIndex = 0;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirect back to Admin Dashboard (update path as needed)
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}