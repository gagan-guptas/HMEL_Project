using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Carrer
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable unobtrusive validation mode
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            // Load user data from session (from registration form)
            if (Session["UserName"] != null)
            {
                lblUserName.Text = Session["UserName"].ToString();
                lblUserInitials.Text = GetUserInitials(Session["UserName"].ToString());
            }
            else
            {
                lblUserName.Text = "Candidate";
                lblUserInitials.Text = "CD";
            }

            if (Session["UserEmail"] != null)
            {
                lblUserEmail.Text = Session["UserEmail"].ToString();
            }
            else
            {
                lblUserEmail.Text = "candidate@example.com";
            }

            // Check if there's a latest application from the registration form
            if (Session["LatestApplication"] != null)
            {
                // Application data is available - you can use this for future enhancements
                // For now, we'll just note that the session contains application data
            }
        }

        private string GetUserInitials(string fullName)
        {
            if (string.IsNullOrEmpty(fullName))
                return "CD";

            string[] names = fullName.Split(' ');
            if (names.Length >= 2)
                return (names[0][0].ToString() + names[1][0].ToString()).ToUpper();
            else
                return names[0][0].ToString().ToUpper();
        }

        protected void btnCompleteTask_Click(object sender, EventArgs e)
        {
            // Handle task completion
            Response.Write("<script>alert('Task completed successfully!');</script>");
        }

        protected void btnNewApplication_Click(object sender, EventArgs e)
        {
            // Redirect back to registration form
            Response.Redirect("FirstPage.aspx");
        }
    }
}