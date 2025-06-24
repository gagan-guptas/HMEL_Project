using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class HomePage : System.Web.UI.Page
    {
        public class Job
        {
            public int Id { get; set; }
            public string Title { get; set; }
            public string Description { get; set; }
        }

        // Sample in-memory job data (replace with DB in real app)
        private List<Job> allJobs = new List<Job>
        {
            new Job { Id = 1, Title = "Software Engineer", Description = "Develop and maintain web applications." },
            new Job { Id = 2, Title = "Data Analyst", Description = "Analyze datasets to derive business insights." },
            new Job { Id = 3, Title = "Project Manager", Description = "Manage project timelines and deliverables." },
            new Job { Id = 4, Title = "QA Tester", Description = "Test software and report bugs." }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobs(allJobs);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim().ToLower();

            // Simple search filter (in real apps use DB search)
            var filteredJobs = allJobs.FindAll(j =>
                j.Title.ToLower().Contains(keyword) || j.Description.ToLower().Contains(keyword));

            BindJobs(filteredJobs);
        }

        private void BindJobs(List<Job> jobs)
        {
            rptJobs.DataSource = jobs;
            rptJobs.DataBind();
        }

        protected void btnViewDetails_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.WebControls.Button)sender;
            int jobId = Convert.ToInt32(btn.CommandArgument);

            // In real app, redirect to job details page with jobId
            Response.Redirect($"JobDetails.aspx?jobId={jobId}");
        }
    }
}