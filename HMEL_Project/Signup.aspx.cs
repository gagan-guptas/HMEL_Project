using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HMEL_Project
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string newUser = txtNewUser.Text.Trim();
            string newPass = txtNewPass.Text.Trim();

            if (!string.IsNullOrEmpty(newUser) && !string.IsNullOrEmpty(newPass))
            {
                // Ideally: Save to DB or file (this is just a placeholder)
                lblMsg.Text = "Account created successfully for " + newUser + "!";
            }
            else
            {
                lblMsg.Text = "Please fill in all fields.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}