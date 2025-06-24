using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class JobDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You can pass job ID from query string like: JobDetails.aspx?id=101
                string jobId = Request.QueryString["id"];

                if (!string.IsNullOrEmpty(jobId))
                {
                    // Replace with actual DB fetch using jobId
                    LoadJobDetails(jobId);
                }
                else
                {
                    lblTitle.Text = "No job selected.";
                }
            }
        }

        private void LoadJobDetails(string jobId)
        {
            // Simulated data – fetch from DB in production
            lblTitle.Text = "Software Developer";
            lblLocation.Text = "Bengaluru, India";
            lblDescription.Text = "Develop and maintain web applications using ASP.NET, C#, and SQL Server.";
            lblRequirements.Text = "Experience with ASP.NET WebForms or MVC, SQL knowledge, and problem-solving skills.";
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            // You would normally check if the user is logged in, then update DB to mark as applied
            string jobId = Request.QueryString["id"];
            string userId = Session["UserId"]?.ToString(); // Must be set at login

            if (!string.IsNullOrEmpty(userId))
            {
                // Save to DB that user applied for jobId
                // Example: Insert into AppliedJobs table

                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Successfully Applied!');", true);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}