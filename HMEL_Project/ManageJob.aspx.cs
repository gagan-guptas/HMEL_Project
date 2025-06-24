using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static HMEL_Project.HomePage;

namespace HMEL_Project
{
    public partial class ManageJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobGrid();
            }
        }

        private void BindJobGrid()
        {
            // Dummy data for now; replace with DB logic
            DataTable dt = new DataTable();
            dt.Columns.Add("JobId");
            dt.Columns.Add("Title");
            dt.Columns.Add("Location");
            dt.Columns.Add("PostedDate");

            dt.Rows.Add("101", "Software Developer", "Bengaluru", DateTime.Now.ToString("yyyy-MM-dd"));
            dt.Rows.Add("102", "System Analyst", "Noida", DateTime.Now.AddDays(-3).ToString("yyyy-MM-dd"));

            GridViewJobs.DataSource = dt;
            GridViewJobs.DataBind();
        }

        protected void GridViewJobs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewJobs.EditIndex = e.NewEditIndex;
            BindJobGrid();
        }

        protected void GridViewJobs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewJobs.EditIndex = -1;
            BindJobGrid();
        }

        protected void GridViewJobs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get updated values here
            string jobId = GridViewJobs.DataKeys[e.RowIndex].Value.ToString();
            string title = ((TextBox)GridViewJobs.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string location = ((TextBox)GridViewJobs.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            // TODO: Update DB with new values

            GridViewJobs.EditIndex = -1;
            BindJobGrid();
        }

        protected void GridViewJobs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string jobId = GridViewJobs.DataKeys[e.RowIndex].Value.ToString();

            // TODO: Delete job from DB

            BindJobGrid();
        }

        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}