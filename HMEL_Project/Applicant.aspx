<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Applicant.aspx.cs" Inherits="HMEL_Project.Applicant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HMEL - Job Application Form</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #2c5aa0 0%, #1e3d6f 100%);
            color: white;
            text-align: center;
            padding: 40px 30px;
            position: relative;
        }
        
        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="50" cy="10" r="0.5" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }
        
        .header h1 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
        }
        
        .header h2 {
            font-size: 18px;
            font-weight: 300;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }
        
        .form-content {
            padding: 40px;
        }
        
        .section {
            margin-bottom: 35px;
            padding: 25px;
            border: 1px solid #e8ecf4;
            border-radius: 12px;
            background: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);
            transition: all 0.3s ease;
        }
        
        .section:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.08);
            transform: translateY(-2px);
        }
        
        .section-title {
            color: #2c5aa0;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #2c5aa0;
            position: relative;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
        }
        
        .form-group.full-width {
            flex: 100%;
            min-width: 100%;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #374151;
            font-size: 14px;
        }
        
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group input[type="date"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            background-color: #ffffff;
        }
        
        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #2c5aa0;
            box-shadow: 0 0 0 3px rgba(44, 90, 160, 0.1);
            transform: translateY(-1px);
        }
        
        .form-group textarea {
            height: 100px;
            resize: vertical;
            font-family: inherit;
        }
        
        .upload-section {
            border: 2px dashed #cbd5e1;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
            background: linear-gradient(145deg, #f8fafc 0%, #ffffff 100%);
            transition: all 0.3s ease;
            position: relative;
        }
        
        .upload-section:hover {
            border-color: #2c5aa0;
            background: linear-gradient(145deg, #ffffff 0%, #f0f4ff 100%);
        }
        
        .upload-section input[type="file"] {
            margin: 15px 0;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background-color: white;
        }
        
        .upload-info {
            font-size: 12px;
            color: #6b7280;
            margin-top: 8px;
            font-style: italic;
        }
        
        .btn-submit {
            background: linear-gradient(135deg, #2c5aa0 0%, #1e3d6f 100%);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(44, 90, 160, 0.3);
        }
        
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(44, 90, 160, 0.4);
        }
        
        .btn-submit:active {
            transform: translateY(0);
        }
        
        .required {
            color: #ef4444;
            font-weight: bold;
        }
        
        .validation-error {
            color: #ef4444;
            font-size: 12px;
            margin-top: 5px;
            font-weight: 500;
        }
        
        .success-message {
            color: #059669;
            font-size: 16px;
            font-weight: 600;
            text-align: center;
            padding: 20px;
            background: linear-gradient(145deg, #d1fae5 0%, #a7f3d0 100%);
            border: 2px solid #10b981;
            border-radius: 12px;
            margin-top: 25px;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.2);
        }
        
        .submit-section {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 2px solid #e5e7eb;
        }
        
     
        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .form-group {
                min-width: 100%;
            }
            
            .container {
                margin: 10px;
                border-radius: 10px;
            }
            
            .header {
                padding: 30px 20px;
            }
            
            .header h1 {
                font-size: 24px;
            }
            
            .form-content {
                padding: 20px;
            }
            
            .section {
                padding: 20px;
            }
        }
        
       
        .section {
            animation: slideInUp 0.6s ease-out;
        }
        
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        
        .form-group select {
            background-image: url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="%23666" d="M2 0L0 2h4zm0 5L0 3h4z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 12px;
            appearance: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>HMEL</h1>
                <h2>HPCL Mittal Energy Limited - Job Application Form</h2>
            </div>
            
            <div class="form-content">
                <!-- Personal Information Section -->
                <div class="section">
                    <div class="section-title">📋 Personal Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtFirstName">First Name <span class="required">*</span></label>
                            <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter your first name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                ControlToValidate="txtFirstName" 
                                ErrorMessage="First Name is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtLastName">Last Name <span class="required">*</span></label>
                            <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter your last name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                ControlToValidate="txtLastName" 
                                ErrorMessage="Last Name is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtFatherName">Father's Name <span class="required">*</span></label>
                            <asp:TextBox ID="txtFatherName" runat="server" placeholder="Enter father's name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFatherName" runat="server" 
                                ControlToValidate="txtFatherName" 
                                ErrorMessage="Father's Name is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtDateOfBirth">Date of Birth <span class="required">*</span></label>
                            <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" 
                                ControlToValidate="txtDateOfBirth" 
                                ErrorMessage="Date of Birth is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="ddlGender">Gender <span class="required">*</span></label>
                            <asp:DropDownList ID="ddlGender" runat="server">
                                <asp:ListItem Value="">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" 
                                ControlToValidate="ddlGender" 
                                ErrorMessage="Gender is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="ddlMaritalStatus">Marital Status</label>
                            <asp:DropDownList ID="ddlMaritalStatus" runat="server">
                                <asp:ListItem Value="">Select Status</asp:ListItem>
                                <asp:ListItem Value="Single">Single</asp:ListItem>
                                <asp:ListItem Value="Married">Married</asp:ListItem>
                                <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
                                <asp:ListItem Value="Widowed">Widowed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Information Section -->
                <div class="section">
                    <div class="section-title">📞 Contact Information</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtEmail">Email Address <span class="required">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="your.email@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="Email is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ErrorMessage="Invalid email format" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone">Phone Number <span class="required">*</span></label>
                            <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="+91 9876543210"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                ControlToValidate="txtPhone" 
                                ErrorMessage="Phone number is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="txtAddress">Current Address <span class="required">*</span></label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" placeholder="Enter your complete address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="txtAddress" 
                                ErrorMessage="Address is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtCity">City <span class="required">*</span></label>
                            <asp:TextBox ID="txtCity" runat="server" placeholder="Enter city"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                                ControlToValidate="txtCity" 
                                ErrorMessage="City is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtState">State <span class="required">*</span></label>
                            <asp:TextBox ID="txtState" runat="server" placeholder="Enter state"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" 
                                ControlToValidate="txtState" 
                                ErrorMessage="State is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtPinCode">Pin Code <span class="required">*</span></label>
                            <asp:TextBox ID="txtPinCode" runat="server" placeholder="123456"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPinCode" runat="server" 
                                ControlToValidate="txtPinCode" 
                                ErrorMessage="Pin Code is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                
                <!-- Educational Qualification Section -->
                <div class="section">
                    <div class="section-title">🎓 Educational Qualification</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="ddlHighestQualification">Highest Qualification <span class="required">*</span></label>
                            <asp:DropDownList ID="ddlHighestQualification" runat="server">
                                <asp:ListItem Value="">Select Qualification</asp:ListItem>
                                <asp:ListItem Value="10th">10th Standard</asp:ListItem>
                                <asp:ListItem Value="12th">12th Standard</asp:ListItem>
                                <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                                <asp:ListItem Value="Bachelor's">Bachelor's Degree</asp:ListItem>
                                <asp:ListItem Value="Master's">Master's Degree</asp:ListItem>
                                <asp:ListItem Value="PhD">PhD</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvQualification" runat="server" 
                                ControlToValidate="ddlHighestQualification" 
                                ErrorMessage="Qualification is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtSpecialization">Specialization/Stream</label>
                            <asp:TextBox ID="txtSpecialization" runat="server" placeholder="e.g., Chemical Engineering"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtUniversity">University/Board</label>
                            <asp:TextBox ID="txtUniversity" runat="server" placeholder="Enter university/board name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtYearOfPassing">Year of Passing</label>
                            <asp:TextBox ID="txtYearOfPassing" runat="server" placeholder="2023"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPercentage">Percentage/CGPA</label>
                            <asp:TextBox ID="txtPercentage" runat="server" placeholder="85% or 8.5 CGPA"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <!-- Work Experience Section -->
                <div class="section">
                    <div class="section-title">💼 Work Experience</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtTotalExperience">Total Experience (in years)</label>
                            <asp:TextBox ID="txtTotalExperience" runat="server" placeholder="e.g., 3.5"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCurrentCompany">Current/Last Company</label>
                            <asp:TextBox ID="txtCurrentCompany" runat="server" placeholder="Company name"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtCurrentDesignation">Current/Last Designation</label>
                            <asp:TextBox ID="txtCurrentDesignation" runat="server" placeholder="Job title"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtCurrentSalary">Current/Last Salary (per annum)</label>
                            <asp:TextBox ID="txtCurrentSalary" runat="server" placeholder="₹ 5,00,000"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <!-- Position Applied For Section -->
                <div class="section">
                    <div class="section-title">🎯 Position Applied For</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="ddlPositionApplied">Position <span class="required">*</span></label>
                            <asp:DropDownList ID="ddlPositionApplied" runat="server">
                                <asp:ListItem Value="">Select Position</asp:ListItem>
                                <asp:ListItem Value="Process Engineer">Process Engineer</asp:ListItem>
                                <asp:ListItem Value="Mechanical Engineer">Mechanical Engineer</asp:ListItem>
                                <asp:ListItem Value="Electrical Engineer">Electrical Engineer</asp:ListItem>
                                <asp:ListItem Value="Chemical Engineer">Chemical Engineer</asp:ListItem>
                                <asp:ListItem Value="Safety Officer">Safety Officer</asp:ListItem>
                                <asp:ListItem Value="Quality Control">Quality Control Specialist</asp:ListItem>
                                <asp:ListItem Value="Maintenance Technician">Maintenance Technician</asp:ListItem>
                                <asp:ListItem Value="Operations Manager">Operations Manager</asp:ListItem>
                                <asp:ListItem Value="HR Executive">HR Executive</asp:ListItem>
                                <asp:ListItem Value="Finance Executive">Finance Executive</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPosition" runat="server" 
                                ControlToValidate="ddlPositionApplied" 
                                ErrorMessage="Position is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtExpectedSalary">Expected Salary (per annum)</label>
                            <asp:TextBox ID="txtExpectedSalary" runat="server" placeholder="₹ 6,00,000"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <!-- Document Upload Section -->
                <div class="section">
                    <div class="section-title">📎 Document Upload</div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fuPassportPhoto">Passport Size Photo <span class="required">*</span></label>
                            <div class="upload-section">
                                <asp:FileUpload ID="fuPassportPhoto" runat="server" accept="image/*" />
                                <div class="upload-info">📷 Upload passport size photo (JPG, PNG, GIF - Max 2MB)</div>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPhoto" runat="server" 
                                ControlToValidate="fuPassportPhoto" 
                                ErrorMessage="Passport photo is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="fuResume">Resume/CV <span class="required">*</span></label>
                            <div class="upload-section">
                                <asp:FileUpload ID="fuResume" runat="server" accept=".pdf,.doc,.docx" />
                                <div class="upload-info">📄 Upload your resume (PDF, DOC, DOCX - Max 5MB)</div>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvResume" runat="server" 
                                ControlToValidate="fuResume" 
                                ErrorMessage="Resume is required" 
                                CssClass="validation-error" 
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                
                <!-- Additional Information Section -->
                <div class="section">
                    <div class="section-title">💬 Additional Information</div>
                    
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="txtAdditionalInfo">Additional Information/Comments</label>
                            <asp:TextBox ID="txtAdditionalInfo" runat="server" TextMode="MultiLine" Rows="4" 
                                placeholder="Any additional information you would like to share..."></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <!-- Submit Button -->
                <div class="submit-section">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" 
                        CssClass="btn-submit" OnClick="btnSubmit_Click" />
                </div>
                
                <!-- Success/Error Messages -->
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

