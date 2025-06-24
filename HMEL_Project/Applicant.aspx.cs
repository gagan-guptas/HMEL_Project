using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class Applicant : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                DisplaySuccessMessage();
                ClearForm();
            }
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
            message += "</div>";

            lblMessage.Text = message;
        }

        private void ClearForm()
        {

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
    }
}