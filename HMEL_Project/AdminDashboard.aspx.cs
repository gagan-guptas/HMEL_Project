using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization logic if needed
        }

        protected void btnCreateJob_Click(object sender, EventArgs e)
        {
            // Redirect to the Create Job page
            Response.Redirect("CreateJob.aspx");
        }

        protected void btnDeleteJob_Click(object sender, EventArgs e)
        {
            // Redirect to the Delete Job page
            Response.Redirect("DeleteJob.aspx");
        }

        protected void btnManageJobs_Click(object sender, EventArgs e)
        {
            // Redirect to Manage Job Applications page
            Response.Redirect("ManageJob.aspx");
        }

        protected void btnHomepage_Click(object sender, EventArgs e)
        {
            // Redirect to Homepage
            Response.Redirect("Homepage.aspx");
        }

    }
}