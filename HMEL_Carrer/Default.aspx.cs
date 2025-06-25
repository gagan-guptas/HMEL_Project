using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Carrer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobs();
                CheckUserSession();
            }

            // Handle job selection
            if (Request.Form[hdnSelectedJobId.UniqueID] != null)
            {
                string selectedJobId = Request.Form[hdnSelectedJobId.UniqueID];
                LoadJobDetails(selectedJobId);
            }
        }

        private void CheckUserSession()
        {
            if (Session["UserEmail"] != null && Session["UserName"] != null)
            {
                // User is logged in
                string script = @"
                    document.getElementById('authButtons').style.display = 'none';
                    document.getElementById('userMenu').style.display = 'flex';
                    document.getElementById('welcomeUser').textContent = 'Welcome, " + Session["UserName"].ToString() + "';";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowUserMenu", script, true);
            }
        }

        private void LoadJobs()
        {
            // Sample job data - in a real application, this would come from a database
            var jobs = GetSampleJobs();

            // Apply filters
            jobs = ApplyFilters(jobs);

            rptJobs.DataSource = jobs;
            rptJobs.DataBind();
        }

        private List<JobListing> GetSampleJobs()
        {
            return new List<JobListing>
            {
                new JobListing
                {
                    JobId = "HMEL001",
                    Title = "Senior Process Engineer",
                    Department = "Engineering",
                    Location = "Bathinda, Punjab",
                    JobType = "Full-time",
                    PostedDate = DateTime.Now.AddDays(-5),
                    ShortDescription = "Lead process optimization initiatives in our refinery operations. Work with cutting-edge technology to enhance efficiency and safety standards.",
                    Skills = "Process Engineering,Chemical Engineering,HAZOP,Process Simulation",
                    ExperienceLevel = "Senior",
                    Salary = "₹15-25 LPA",
                    Requirements = "B.Tech/M.Tech in Chemical Engineering|5+ years in refinery operations|Experience with process simulation software|Knowledge of safety protocols",
                    Responsibilities = "Lead process optimization projects|Conduct HAZOP studies|Mentor junior engineers|Collaborate with operations team"
                },
                new JobListing
                {
                    JobId = "HMEL002",
                    Title = "Safety Officer",
                    Department = "Safety",
                    Location = "Bathinda, Punjab",
                    JobType = "Full-time",
                    PostedDate = DateTime.Now.AddDays(-3),
                    ShortDescription = "Ensure workplace safety compliance and implement safety protocols across all operations. Drive safety culture initiatives.",
                    Skills = "Safety Management,Risk Assessment,Incident Investigation,Safety Training",
                    ExperienceLevel = "Mid",
                    Salary = "₹8-15 LPA",
                    Requirements = "Diploma in Industrial Safety|3+ years safety experience|NEBOSH certification preferred|Strong communication skills",
                    Responsibilities = "Conduct safety audits|Investigate incidents|Develop safety procedures|Train employees on safety protocols"
                },
                new JobListing
                {
                    JobId = "HMEL003",
                    Title = "Mechanical Engineer",
                    Department = "Engineering",
                    Location = "Bathinda, Punjab",
                    JobType = "Full-time",
                    PostedDate = DateTime.Now.AddDays(-7),
                    ShortDescription = "Design and maintain mechanical systems in our petrochemical facilities. Focus on equipment reliability and maintenance optimization.",
                    Skills = "Mechanical Design,AutoCAD,Maintenance Planning,Equipment Reliability",
                    ExperienceLevel = "Mid",
                    Salary = "₹10-18 LPA",
                    Requirements = "B.Tech in Mechanical Engineering|4+ years industrial experience|AutoCAD proficiency|Knowledge of rotating equipment",
                    Responsibilities = "Design mechanical systems|Plan maintenance schedules|Troubleshoot equipment issues|Support operations team"
                },
                new JobListing
                {
                    JobId = "HMEL004",
                    Title = "HR Business Partner",
                    Department = "HR",
                    Location = "Delhi NCR",
                    JobType = "Full-time",
                    PostedDate = DateTime.Now.AddDays(-2),
                    ShortDescription = "Partner with business leaders to drive HR initiatives and support organizational growth. Focus on talent management and employee engagement.",
                    Skills = "HR Strategy,Talent Management,Employee Relations,Performance Management",
                    ExperienceLevel = "Senior",
                    Salary = "₹12-20 LPA",
                    Requirements = "MBA in HR|6+ years HR experience|Strong business acumen|Excellent interpersonal skills",
                    Responsibilities = "Support business leaders|Manage talent acquisition|Drive employee engagement|Implement HR policies"
                },
                new JobListing
                {
                    JobId = "HMEL005",
                    Title = "Graduate Engineer Trainee",
                    Department = "Engineering",
                    Location = "Bathinda, Punjab",
                    JobType = "Full-time",
                    PostedDate = DateTime.Now.AddDays(-1),
                    ShortDescription = "Join our comprehensive training program for fresh graduates. Gain exposure to various engineering disciplines in the energy sector.",
                    Skills = "Engineering Fundamentals,Problem Solving,Team Work,Learning Agility",
                    ExperienceLevel = "Entry",
                    Salary = "₹6-8 LPA",
                    Requirements = "B.Tech in Engineering|Fresh graduate or 0-1 year experience|Strong academic record|Willingness to learn",
                    Responsibilities = "Participate in training programs|Support engineering projects|Learn operational processes|Contribute to team objectives"
                }
            };
        }

        private List<JobListing> ApplyFilters(List<JobListing> jobs)
        {
            if (!string.IsNullOrEmpty(ddlDepartment.SelectedValue))
                jobs = jobs.Where(j => j.Department == ddlDepartment.SelectedValue).ToList();

            if (!string.IsNullOrEmpty(ddlLocation.SelectedValue))
                jobs = jobs.Where(j => j.Location.Contains(ddlLocation.SelectedValue)).ToList();

            if (!string.IsNullOrEmpty(ddlExperience.SelectedValue))
                jobs = jobs.Where(j => j.ExperienceLevel == ddlExperience.SelectedValue).ToList();

            if (!string.IsNullOrEmpty(ddlJobType.SelectedValue))
                jobs = jobs.Where(j => j.JobType == ddlJobType.SelectedValue).ToList();

            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                string searchTerm = txtSearch.Text.ToLower();
                jobs = jobs.Where(j =>
                    j.Title.ToLower().Contains(searchTerm) ||
                    j.ShortDescription.ToLower().Contains(searchTerm) ||
                    j.Skills.ToLower().Contains(searchTerm)
                ).ToList();
            }

            return jobs;
        }

        protected void FilterJobs(object sender, EventArgs e)
        {
            LoadJobs();
        }

        protected string GetJobTags(string skills)
        {
            if (string.IsNullOrEmpty(skills)) return "";

            var skillList = skills.Split(',');
            var tags = "";

            foreach (var skill in skillList.Take(3)) // Show only first 3 tags
            {
                tags += $"<span class='job-tag'>{skill.Trim()}</span>";
            }

            if (skillList.Length > 3)
            {
                tags += $"<span class='job-tag'>+{skillList.Length - 3} more</span>";
            }

            return tags;
        }

        private void LoadJobDetails(string jobId)
        {
            var jobs = GetSampleJobs();
            var selectedJob = jobs.FirstOrDefault(j => j.JobId == jobId);

            if (selectedJob != null)
            {
                string detailsHtml = $@"
                    <div class='detail-section'>
                        <div class='detail-title'>Job Overview</div>
                        <div class='detail-list'>
                            <li><span>Job ID:</span><span>{selectedJob.JobId}</span></li>
                            <li><span>Department:</span><span>{selectedJob.Department}</span></li>
                            <li><span>Location:</span><span>{selectedJob.Location}</span></li>
                            <li><span>Experience:</span><span>{selectedJob.ExperienceLevel}</span></li>
                            <li><span>Salary:</span><span>{selectedJob.Salary}</span></li>
                            <li><span>Posted:</span><span>{selectedJob.PostedDate:dd MMM yyyy}</span></li>
                        </div>
                    </div>
                    
                    <div class='detail-section'>
                        <div class='detail-title'>Requirements</div>
                        <ul style='padding-left: 1rem; color: #64748b;'>
                            {string.Join("", selectedJob.Requirements.Split('|').Select(r => $"<li style='margin-bottom: 0.5rem;'>{r}</li>"))}
                        </ul>
                    </div>
                    
                    <div class='detail-section'>
                        <div class='detail-title'>Key Responsibilities</div>
                        <ul style='padding-left: 1rem; color: #64748b;'>
                            {string.Join("", selectedJob.Responsibilities.Split('|').Select(r => $"<li style='margin-bottom: 0.5rem;'>{r}</li>"))}
                        </ul>
                    </div>
                    
                    <div class='detail-section'>
                        <div class='detail-title'>Skills Required</div>
                        <div style='display: flex; flex-wrap: wrap; gap: 0.5rem;'>
                            {string.Join("", selectedJob.Skills.Split(',').Select(s => $"<span class='job-tag'>{s.Trim()}</span>"))}
                        </div>
                    </div>";

                string script = $@"
                    document.getElementById('selectedJobTitle').textContent = '{selectedJob.Title}';
                    document.getElementById('jobDetailsContent').innerHTML = `{detailsHtml}`;
                    document.getElementById('applySection').style.display = 'block';
                ";

                ClientScript.RegisterStartupScript(this.GetType(), "LoadJobDetails", script, true);

                // Store selected job in session for apply process
                Session["SelectedJobId"] = jobId;
                Session["SelectedJobTitle"] = selectedJob.Title;
            }
        }

        protected void btnApplyJob_Click(object sender, EventArgs e)
        {
            // Check if user is logged in
            if (Session["UserEmail"] == null)
            {
                // Show sign-in modal
                ClientScript.RegisterStartupScript(this.GetType(), "ShowSignIn", "showSignInModal();", true);
                return;
            }

            // User is logged in, redirect to application form
            Response.Redirect("FirstPage.aspx");
        }

        protected void btnSignInSubmit_Click(object sender, EventArgs e)
        {
            // Simple authentication - in a real application, validate against database
            string email = txtSignInEmail.Text.Trim();
            string password = txtSignInPassword.Text.Trim();

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                // For demo purposes, accept any valid email/password combination
                if (email.Contains("@") && password.Length >= 6)
                {
                    // Set session variables
                    Session["UserEmail"] = email;
                    Session["UserName"] = email.Split('@')[0]; // Use email prefix as name
                    Session["IsLoggedIn"] = true;

                    // Redirect to dashboard
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SignInError",
                        "alert('Invalid email or password. Please try again.'); showSignInModal();", true);
                }
            }
        }

        protected void btnSignUpSubmit_Click(object sender, EventArgs e)
        {
            string name = txtSignUpName.Text.Trim();
            string email = txtSignUpEmail.Text.Trim();
            string password = txtSignUpPassword.Text.Trim();
            string confirmPassword = txtSignUpConfirmPassword.Text.Trim();

            // Basic validation
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(password) || password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SignUpError",
                    "alert('Please fill all fields correctly and ensure passwords match.'); showSignUpModal();", true);
                return;
            }

            if (!email.Contains("@") || password.Length < 6)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SignUpError",
                    "alert('Please enter a valid email and password (minimum 6 characters).'); showSignUpModal();", true);
                return;
            }

            // For demo purposes, create account automatically
            Session["UserEmail"] = email;
            Session["UserName"] = name;
            Session["IsLoggedIn"] = true;

            // Redirect to dashboard
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();
            Session.Abandon();

            // Refresh page
            Response.Redirect("Default.aspx");
        }

        protected void rptJobs_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Handle any repeater commands if needed
        }
    }

    // Job listing model
    public class JobListing
    {
        public string JobId { get; set; }
        public string Title { get; set; }
        public string Department { get; set; }
        public string Location { get; set; }
        public string JobType { get; set; }
        public DateTime PostedDate { get; set; }
        public string ShortDescription { get; set; }
        public string Skills { get; set; }
        public string ExperienceLevel { get; set; }
        public string Salary { get; set; }
        public string Requirements { get; set; }
        public string Responsibilities { get; set; }
    }
}