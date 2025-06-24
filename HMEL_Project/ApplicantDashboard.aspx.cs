using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class ApplicantDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeMockData();
                BindGrids();
            }
        }

        private void InitializeMockData()
        {
            // Available Jobs
            if (Session["AvailableJobs"] == null)
            {
                DataTable available = new DataTable();
                available.Columns.Add("JobId");
                available.Columns.Add("JobTitle");
                available.Columns.Add("Description");

                available.Rows.Add("101", "Backend Engineer", "Work with APIs and databases.");
                available.Rows.Add("102", "Data Analyst", "Interpret data, analyze results.");
                available.Rows.Add("103", "Frontend Developer", "Design user interfaces with React.");

                Session["AvailableJobs"] = available;
            }

            // Applied Jobs
            if (Session["AppliedJobs"] == null)
            {
                DataTable applied = new DataTable();
                applied.Columns.Add("JobTitle");
                applied.Columns.Add("Status");

                Session["AppliedJobs"] = applied;
            }
        }

        private void BindGrids()
        {
            gvAppliedJobs.DataSource = Session["AppliedJobs"];
            gvAppliedJobs.DataBind();

            rptJobs.DataSource = Session["AvailableJobs"];
            rptJobs.DataBind();
        }

        protected void ApplyJob(object sender, CommandEventArgs e)
        {
            string jobId = e.CommandArgument.ToString();

            // Fetch available jobs and find the one clicked
            DataTable available = (DataTable)Session["AvailableJobs"];
            DataTable applied = (DataTable)Session["AppliedJobs"];

            DataRow[] rows = available.Select("JobId = '" + jobId + "'");
            if (rows.Length > 0)
            {
                string title = rows[0]["JobTitle"].ToString();

                // Add to applied
                applied.Rows.Add(title, "Applied");

                // Remove from available
                available.Rows.Remove(rows[0]);

                // Save updated session
                Session["AvailableJobs"] = available;
                Session["AppliedJobs"] = applied;

                // Rebind both
                BindGrids();

                // Confirmation
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Applied for {title}');", true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
        protected string GetStepClass(string step, string currentStatus)
        {
            string[] stages = { "Applied", "Review", "Interview", "Final" };
            int currentIndex = Array.IndexOf(stages, currentStatus);
            int stepIndex = Array.IndexOf(stages, step);

            if (stepIndex < currentIndex)
                return "step completed";
            else if (stepIndex == currentIndex)
                return "step current";
            else
                return "step";
        }

    }
}