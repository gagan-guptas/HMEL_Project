using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Carrer
{
    public partial class FirstPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable unobtrusive validation mode
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                lblMessage.Text = "";

                // Check if there's a draft to load
                if (Session["DraftApplication"] != null && Session["DraftTimestamp"] != null)
                {
                    DateTime draftTime = (DateTime)Session["DraftTimestamp"];
                    string draftInfo = "<div style='background-color: #fef3c7; border: 1px solid #f59e0b; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center;'>";
                    draftInfo += "<strong>📄 Draft Available:</strong> Saved on " + draftTime.ToString("dd/MM/yyyy HH:mm");
                    draftInfo += " <em>(Draft data is stored in session for this visit)</em>";
                    draftInfo += "</div>";
                    lblMessage.Text = draftInfo;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Enhanced form submission with dashboard redirect
            if (Page.IsValid)
            {
                // Store application data in session for dashboard
                StoreApplicationInSession();

                DisplaySuccessMessage();

                // Redirect to dashboard after 3 seconds
                string script = @"
                    setTimeout(function() {
                        window.location.href = 'Dashboard.aspx';
                    }, 3000);
                ";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectToDashboard", script, true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Clear all form fields
            ClearForm();

            // Display cancellation message with dashboard link
            string message = "<div class='cancel-message'>";
            message += "<h3>❌ Application Cancelled</h3>";
            message += "<p><strong>Your application has been cancelled.</strong></p>";
            message += "<p>All form data has been cleared. You can start fresh anytime.</p>";
            message += "<p><a href='Dashboard.aspx' style='color: #0066cc; text-decoration: underline;'>Go to Dashboard</a> | ";
            message += "<a href='FirstPage.aspx' style='color: #0066cc; text-decoration: underline;'>New Application</a></p>";
            message += "<p>Thank you for considering HMEL as your career destination.</p>";
            message += "</div>";

            lblMessage.Text = message;
        }

        protected void btnSaveDraft_Click(object sender, EventArgs e)
        {
            // Enhanced draft saving with dashboard integration
            string draftData = GetApplicationDataAsString();

            // Save to session
            Session["DraftApplication"] = draftData;
            Session["DraftTimestamp"] = DateTime.Now;
            Session["ApplicantName"] = txtFirstName.Text + " " + txtLastName.Text;
            Session["ApplicantEmail"] = txtEmail.Text;

            // Display draft saved message with dashboard link
            string message = "<div class='draft-message'>";
            message += "<h3>💾 Draft Saved Successfully!</h3>";
            message += "<p><strong>Your application has been saved as draft.</strong></p>";

            if (!string.IsNullOrEmpty(txtFirstName.Text) && !string.IsNullOrEmpty(txtLastName.Text))
            {
                message += "<p><strong>Applicant:</strong> " + txtFirstName.Text + " " + txtLastName.Text + "</p>";
            }

            if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                message += "<p><strong>Email:</strong> " + txtEmail.Text + "</p>";
            }

            message += "<p><strong>Draft Saved:</strong> " + DateTime.Now.ToString("dd/MM/yyyy HH:mm") + "</p>";
            message += "<p>You can continue editing and submit when ready.</p>";
            message += "<p><a href='Dashboard.aspx' style='background: #0066cc; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; margin-right: 10px;'>View Dashboard</a>";
            message += "<a href='FirstPage.aspx' style='background: #64748b; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;'>Continue Editing</a></p>";
            message += "<p><em>Note: Draft will be available during this session.</em></p>";
            message += "</div>";

            lblMessage.Text = message;
        }

        // NEW METHOD: Store application data for dashboard
        private void StoreApplicationInSession()
        {
            // Store application details in session for dashboard display
            Session["LatestApplication"] = new
            {
                JobTitle = ddlPositionApplied.SelectedValue,
                JobReq = "HMEL" + DateTime.Now.Year + DateTime.Now.Month.ToString("00") + DateTime.Now.Day.ToString("00"),
                ApplicantName = txtFirstName.Text + " " + txtLastName.Text,
                Email = txtEmail.Text,
                Phone = txtPhone.Text,
                Status = "Application Submitted",
                DateSubmitted = DateTime.Now,
                Location = "Bathinda, Punjab"
            };

            // Store user info for dashboard personalization
            Session["UserName"] = txtFirstName.Text + " " + txtLastName.Text;
            Session["UserEmail"] = txtEmail.Text;
        }

        private void DisplaySuccessMessage()
        {
            string message = "<div class='success-message'>";
            message += "<h3>🎉 Application Submitted Successfully!</h3>";
            message += "<p><strong>Thank you for your interest in HMEL!</strong></p>";
            message += "<p><strong>Applicant:</strong> " + txtFirstName.Text + " " + txtLastName.Text + "</p>";
            message += "<p><strong>Email:</strong> " + txtEmail.Text + "</p>";
            message += "<p><strong>Position:</strong> " + ddlPositionApplied.SelectedValue + "</p>";
            message += "<p><strong>Application Date:</strong> " + DateTime.Now.ToString("dd/MM/yyyy HH:mm") + "</p>";
            message += "<p>We will review your application and contact you soon.</p>";
            message += "<p><strong>🔄 Redirecting to your dashboard in 3 seconds...</strong></p>";
            message += "<p><a href='Dashboard.aspx' style='background: #0066cc; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;'>Go to Dashboard Now</a></p>";
            message += "</div>";

            lblMessage.Text = message;
        }

        private void ClearForm()
        {
            // Clear all form fields
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtFatherName.Text = "";
            txtDateOfBirth.Text = "";
            ddlGender.SelectedIndex = 0;
            ddlMaritalStatus.SelectedIndex = 0;
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPinCode.Text = "";
            ddlHighestQualification.SelectedIndex = 0;
            txtSpecialization.Text = "";
            txtUniversity.Text = "";
            txtYearOfPassing.Text = "";
            txtPercentage.Text = "";
            txtTotalExperience.Text = "";
            txtCurrentCompany.Text = "";
            txtCurrentDesignation.Text = "";
            txtCurrentSalary.Text = "";
            ddlPositionApplied.SelectedIndex = 0;
            txtExpectedSalary.Text = "";
            txtAdditionalInfo.Text = "";
        }

        // Enhanced method to get application data as string
        private string GetApplicationDataAsString()
        {
            string applicationData = "HMEL Job Application Draft\n";
            applicationData += "==========================\n\n";
            applicationData += "Personal Information:\n";
            applicationData += "Name: " + txtFirstName.Text + " " + txtLastName.Text + "\n";
            applicationData += "Father's Name: " + txtFatherName.Text + "\n";
            applicationData += "Date of Birth: " + txtDateOfBirth.Text + "\n";
            applicationData += "Gender: " + ddlGender.SelectedValue + "\n";
            applicationData += "Marital Status: " + ddlMaritalStatus.SelectedValue + "\n\n";

            applicationData += "Contact Information:\n";
            applicationData += "Email: " + txtEmail.Text + "\n";
            applicationData += "Phone: " + txtPhone.Text + "\n";
            applicationData += "Address: " + txtAddress.Text + "\n";
            applicationData += "City: " + txtCity.Text + "\n";
            applicationData += "State: " + txtState.Text + "\n";
            applicationData += "Pin Code: " + txtPinCode.Text + "\n\n";

            applicationData += "Educational Qualification:\n";
            applicationData += "Highest Qualification: " + ddlHighestQualification.SelectedValue + "\n";
            applicationData += "Specialization: " + txtSpecialization.Text + "\n";
            applicationData += "University: " + txtUniversity.Text + "\n";
            applicationData += "Year of Passing: " + txtYearOfPassing.Text + "\n";
            applicationData += "Percentage/CGPA: " + txtPercentage.Text + "\n\n";

            applicationData += "Work Experience:\n";
            applicationData += "Total Experience: " + txtTotalExperience.Text + "\n";
            applicationData += "Current Company: " + txtCurrentCompany.Text + "\n";
            applicationData += "Current Designation: " + txtCurrentDesignation.Text + "\n";
            applicationData += "Current Salary: " + txtCurrentSalary.Text + "\n\n";

            applicationData += "Position Applied For:\n";
            applicationData += "Position: " + ddlPositionApplied.SelectedValue + "\n";
            applicationData += "Expected Salary: " + txtExpectedSalary.Text + "\n\n";

            applicationData += "Additional Information:\n";
            applicationData += txtAdditionalInfo.Text + "\n\n";

            applicationData += "Draft Saved: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss") + "\n";

            return applicationData;
        }
    }
}