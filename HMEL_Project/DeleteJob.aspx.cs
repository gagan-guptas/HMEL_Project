using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class DeleteJob : System.Web.UI.Page
    {
        private DataTable JobTable
        {
            get
            {
                if (ViewState["JobTable"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("JobId", typeof(int));
                    dt.Columns.Add("Title");
                    dt.Columns.Add("Location");

                    dt.Rows.Add(101, "Software Developer", "Bengaluru");
                    dt.Rows.Add(102, "System Analyst", "Noida");
                    dt.Rows.Add(103, "Network Engineer", "Hyderabad");

                    ViewState["JobTable"] = dt;
                }
                return (DataTable)ViewState["JobTable"];
            }
            set
            {
                ViewState["JobTable"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindJobs();
            }
        }

        private void BindJobs()
        {
            GridViewDeleteJob.DataSource = JobTable;
            GridViewDeleteJob.DataBind();
        }

        protected void GridViewDeleteJob_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int jobId = Convert.ToInt32(GridViewDeleteJob.DataKeys[e.RowIndex].Value);
            DataTable dt = JobTable;

            foreach (DataRow row in dt.Rows)
            {
                if ((int)row["JobId"] == jobId)
                {
                    row.Delete();
                    break;
                }
            }

            dt.AcceptChanges();
            JobTable = dt;
            BindJobs();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDashboard.aspx");
        }
    }
}