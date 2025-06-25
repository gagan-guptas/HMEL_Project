<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HMEL_Carrer.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HMEL Careers - Join India's Leading Energy Company</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e0f2fe 100%);
            color: #334155;
        }

        /* Header & Navigation */
        .header {
            background: white;
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
        }

        .logo-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .company-logo {
            height: 50px;
            width: auto;
        }

        .company-name {
            font-size: 1.5rem;
            font-weight: bold;
            color: #003366;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .nav-link {
            color: #64748b;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: #0066cc;
            background: #f0f9ff;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s ease;
            font-size: 0.875rem;
        }

        .btn-outline {
            background: white;
            color: #0066cc;
            border: 2px solid #0066cc;
        }

        .btn-outline:hover {
            background: #0066cc;
            color: white;
            transform: translateY(-1px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #0066cc, #003366);
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #0052a3, #002244);
            transform: translateY(-1px);
            box-shadow: 0 8px 25px rgba(0,102,204,0.3);
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #003366 0%, #0066cc 100%);
            color: white;
            padding: 4rem 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="rgba(255,255,255,0.1)"/><circle cx="75" cy="75" r="1" fill="rgba(255,255,255,0.1)"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.95;
            line-height: 1.6;
        }

        .hero-stats {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin-top: 3rem;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: bold;
            color: #ff6600;
        }

        .stat-label {
            font-size: 0.875rem;
            opacity: 0.9;
            margin-top: 0.5rem;
        }

        /* Filters Section */
        .filters-section {
            background: white;
            padding: 2rem;
            margin: -2rem 2rem 2rem 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            position: relative;
            z-index: 10;
        }

        .filters-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .filters-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #003366;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .filters-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-label {
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.875rem;
        }

        .filter-select {
            padding: 0.75rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 0.875rem;
            background: white;
            transition: all 0.3s ease;
        }

        .filter-select:focus {
            outline: none;
            border-color: #0066cc;
            box-shadow: 0 0 0 3px rgba(0,102,204,0.1);
        }

        .search-container {
            display: flex;
            gap: 1rem;
            align-items: end;
        }

        .search-input {
            flex: 1;
            padding: 0.75rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 0.875rem;
        }

        .search-input:focus {
            outline: none;
            border-color: #0066cc;
            box-shadow: 0 0 0 3px rgba(0,102,204,0.1);
        }

        /* Jobs Section */
        .jobs-section {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 2rem;
        }

        .jobs-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .job-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            cursor: pointer;
            border: 2px solid transparent;
        }

        .job-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
            border-color: #0066cc;
        }

        .job-card.selected {
            border-color: #0066cc;
            background: #f0f9ff;
        }

        .job-header {
            display: flex;
            justify-content: space-between;
            align-items: start;
            margin-bottom: 1rem;
        }

        .job-title {
            font-size: 1.25rem;
            font-weight: bold;
            color: #003366;
            margin-bottom: 0.5rem;
        }

        .job-company {
            color: #64748b;
            font-size: 0.875rem;
        }

        .job-actions {
            display: flex;
            gap: 0.5rem;
        }

        .icon-btn {
            padding: 0.5rem;
            border: 1px solid #e5e7eb;
            background: white;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .icon-btn:hover {
            background: #f8fafc;
            border-color: #0066cc;
        }

        .job-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }

        .job-meta-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            color: #64748b;
        }

        .job-description {
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .job-tags {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .job-tag {
            padding: 0.25rem 0.75rem;
            background: #f1f5f9;
            color: #475569;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        /* Job Details Panel */
        .job-details-panel {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            height: fit-content;
            position: sticky;
            top: 100px;
        }

        .job-details-header {
            background: linear-gradient(135deg, #003366, #0066cc);
            color: white;
            padding: 2rem;
            border-radius: 12px 12px 0 0;
        }

        .job-details-content {
            padding: 2rem;
        }

        .detail-section {
            margin-bottom: 2rem;
        }

        .detail-title {
            font-weight: bold;
            color: #003366;
            margin-bottom: 1rem;
            font-size: 1.1rem;
        }

        .detail-list {
            list-style: none;
            padding: 0;
        }

        .detail-list li {
            padding: 0.5rem 0;
            border-bottom: 1px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
        }

        .detail-list li:last-child {
            border-bottom: none;
        }

        .apply-section {
            background: #f8fafc;
            padding: 1.5rem;
            border-radius: 0 0 12px 12px;
            text-align: center;
        }

        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.5);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 2000;
        }

        .modal-content {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            max-width: 400px;
            width: 90%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .modal-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #003366;
            margin-bottom: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            font-size: 0.875rem;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 0.875rem;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #0066cc;
            box-shadow: 0 0 0 3px rgba(0,102,204,0.1);
        }

        .modal-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-secondary {
            background: #64748b;
            color: white;
        }

        .btn-secondary:hover {
            background: #475569;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .jobs-section {
                grid-template-columns: 1fr;
            }
            
            .job-details-panel {
                position: static;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-stats {
                flex-direction: column;
                gap: 1.5rem;
            }
            
            .filters-grid {
                grid-template-columns: 1fr;
            }
            
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-links {
                order: -1;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="nav-container">
                <div class="logo-section">
                    <img src="Images/hmel-logo.png" alt="HMEL" class="company-logo" />
                    <div class="company-name">HMEL Careers</div>
                </div>
                
                <div class="nav-links">
                    <a href="#" class="nav-link active">🏠 Home</a>
                    <a href="#jobs" class="nav-link">💼 Jobs</a>
                    <a href="#about" class="nav-link">🏢 About Us</a>
                    <a href="#contact" class="nav-link">📞 Contact</a>
                </div>
                
                <div class="auth-buttons" id="authButtons">
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btn btn-outline" OnClientClick="showSignInModal(); return false;" />
                    <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn btn-primary" OnClientClick="showSignUpModal(); return false;" />
                </div>
                
                <div class="auth-buttons" id="userMenu" style="display: none;">
                    <span id="welcomeUser" style="color: #003366; font-weight: 600;"></span>
                    <asp:Button ID="btnDashboard" runat="server" Text="Dashboard" CssClass="btn btn-primary" PostBackUrl="~/Dashboard.aspx" />
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>

        <!-- Hero Section -->
        <div class="hero-section">
            <div class="hero-content">
                <h1 class="hero-title">Build Your Career with HMEL</h1>
                <p class="hero-subtitle">
                    Join India's leading energy company and be part of our mission to power the nation's growth. 
                    Discover exciting opportunities in refining, petrochemicals, and sustainable energy solutions.
                </p>
                
                <div class="hero-stats">
                    <div class="stat-item">
                        <div class="stat-number">500+</div>
                        <div class="stat-label">Open Positions</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">Departments</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">10,000+</div>
                        <div class="stat-label">Employees</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filters Section -->
        <div class="filters-section">
            <div class="filters-container">
                <h2 class="filters-title">Find Your Perfect Role</h2>
                
                <div class="filters-grid">
                    <div class="filter-group">
                        <label class="filter-label">Department</label>
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="FilterJobs">
                            <asp:ListItem Value="">All Departments</asp:ListItem>
                            <asp:ListItem Value="Engineering">Engineering</asp:ListItem>
                            <asp:ListItem Value="Operations">Operations</asp:ListItem>
                            <asp:ListItem Value="Safety">Safety & Environment</asp:ListItem>
                            <asp:ListItem Value="HR">Human Resources</asp:ListItem>
                            <asp:ListItem Value="Finance">Finance</asp:ListItem>
                            <asp:ListItem Value="IT">Information Technology</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="filter-group">
                        <label class="filter-label">Location</label>
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="FilterJobs">
                            <asp:ListItem Value="">All Locations</asp:ListItem>
                            <asp:ListItem Value="Bathinda">Bathinda, Punjab</asp:ListItem>
                            <asp:ListItem Value="Delhi">Delhi NCR</asp:ListItem>
                            <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                            <asp:ListItem Value="Chennai">Chennai</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="filter-group">
                        <label class="filter-label">Experience Level</label>
                        <asp:DropDownList ID="ddlExperience" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="FilterJobs">
                            <asp:ListItem Value="">All Levels</asp:ListItem>
                            <asp:ListItem Value="Entry">Entry Level (0-2 years)</asp:ListItem>
                            <asp:ListItem Value="Mid">Mid Level (3-7 years)</asp:ListItem>
                            <asp:ListItem Value="Senior">Senior Level (8+ years)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="filter-group">
                        <label class="filter-label">Job Type</label>
                        <asp:DropDownList ID="ddlJobType" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="FilterJobs">
                            <asp:ListItem Value="">All Types</asp:ListItem>
                            <asp:ListItem Value="Full-time">Full-time</asp:ListItem>
                            <asp:ListItem Value="Contract">Contract</asp:ListItem>
                            <asp:ListItem Value="Internship">Internship</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="search-container">
                    <div class="filter-group" style="flex: 1;">
                        <label class="filter-label">Search Jobs</label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search by job title, skills, or keywords..."></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="btn btn-primary" OnClick="FilterJobs" />
                </div>
            </div>
        </div>

        <!-- Jobs Section -->
        <div class="jobs-section" id="jobs">
            <!-- Jobs List -->
            <div class="jobs-list">
                <asp:Repeater ID="rptJobs" runat="server" OnItemCommand="rptJobs_ItemCommand">
                    <ItemTemplate>
                        <div class="job-card" onclick="selectJob('<%# Eval("JobId") %>')">
                            <div class="job-header">
                                <div>
                                    <div class="job-title"><%# Eval("Title") %></div>
                                    <div class="job-company">HMEL - Hindustan Mittal Energy Limited</div>
                                </div>
                                <div class="job-actions">
                                    <button type="button" class="icon-btn" title="View Details">👁️</button>
                                    <button type="button" class="icon-btn" title="Open in New Tab" onclick="window.open('JobDetails.aspx?id=<%# Eval("JobId") %>', '_blank')">🔗</button>
                                </div>
                            </div>
                            
                            <div class="job-meta">
                                <div class="job-meta-item">
                                    📍 <%# Eval("Location") %>
                                </div>
                                <div class="job-meta-item">
                                    💼 <%# Eval("Department") %>
                                </div>
                                <div class="job-meta-item">
                                    ⏰ <%# Eval("JobType") %>
                                </div>
                                <div class="job-meta-item">
                                    📅 Posted <%# Eval("PostedDate", "{0:dd MMM yyyy}") %>
                                </div>
                            </div>
                            
                            <div class="job-description">
                                <%# Eval("ShortDescription") %>
                            </div>
                            
                            <div class="job-tags">
                                <%# GetJobTags(Eval("Skills").ToString()) %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            
            <!-- Job Details Panel -->
            <div class="job-details-panel" id="jobDetailsPanel">
                <div class="job-details-header">
                    <h3 id="selectedJobTitle">Select a job to view details</h3>
                    <p id="selectedJobCompany">HMEL - Hindustan Mittal Energy Limited</p>
                </div>
                
                <div class="job-details-content" id="jobDetailsContent">
                    <p style="text-align: center; color: #64748b; padding: 2rem;">
                        Click on any job card to view detailed information here.
                    </p>
                </div>
                
                <div class="apply-section" id="applySection" style="display: none;">
                    <asp:Button ID="btnApplyJob" runat="server" Text="🚀 Apply Now" CssClass="btn btn-primary" style="width: 100%; font-size: 1rem;" OnClick="btnApplyJob_Click" />
                    <p style="margin-top: 1rem; font-size: 0.875rem; color: #64748b;">
                        Join thousands of professionals at HMEL
                    </p>
                </div>
            </div>
        </div>

        <!-- Sign In Modal -->
        <div class="modal-overlay" id="signInModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Sign In to HMEL Careers</h3>
                    <p style="color: #64748b;">Access your personalized dashboard</p>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtSignInEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="your.email@example.com"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtSignInPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn btn-secondary" style="flex: 1;" onclick="hideSignInModal()">Cancel</button>
                    <asp:Button ID="btnSignInSubmit" runat="server" Text="Sign In" CssClass="btn btn-primary" style="flex: 1;" OnClick="btnSignInSubmit_Click" />
                </div>
                
                <p style="text-align: center; margin-top: 1rem; font-size: 0.875rem; color: #64748b;">
                    Don't have an account? <a href="#" onclick="showSignUpModal(); hideSignInModal();" style="color: #0066cc;">Sign up here</a>
                </p>
            </div>
        </div>

        <!-- Sign Up Modal -->
        <div class="modal-overlay" id="signUpModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Join HMEL Careers</h3>
                    <p style="color: #64748b;">Create your account to get started</p>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <asp:TextBox ID="txtSignUpName" runat="server" CssClass="form-input" placeholder="Enter your full name"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtSignUpEmail" runat="server" CssClass="form-input" TextMode="Email" placeholder="your.email@example.com"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtSignUpPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Create a strong password"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Confirm Password</label>
                    <asp:TextBox ID="txtSignUpConfirmPassword" runat="server" CssClass="form-input" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                </div>
                
                <div class="modal-actions">
                    <button type="button" class="btn btn-secondary" style="flex: 1;" onclick="hideSignUpModal()">Cancel</button>
                    <asp:Button ID="btnSignUpSubmit" runat="server" Text="Sign Up" CssClass="btn btn-primary" style="flex: 1;" OnClick="btnSignUpSubmit_Click" />
                </div>
                
                <p style="text-align: center; margin-top: 1rem; font-size: 0.875rem; color: #64748b;">
                    Already have an account? <a href="#" onclick="showSignInModal(); hideSignUpModal();" style="color: #0066cc;">Sign in here</a>
                </p>
            </div>
        </div>

        <asp:HiddenField ID="hdnSelectedJobId" runat="server" />

        <script type="text/javascript">
            // Modal Functions
            function showSignInModal() {
                document.getElementById('signInModal').style.display = 'flex';
            }
            
            function hideSignInModal() {
                document.getElementById('signInModal').style.display = 'none';
            }
            
            function showSignUpModal() {
                document.getElementById('signUpModal').style.display = 'flex';
            }
            
            function hideSignUpModal() {
                document.getElementById('signUpModal').style.display = 'none';
            }

            // Job Selection
            function selectJob(jobId) {
                // Remove previous selection
                var cards = document.querySelectorAll('.job-card');
                cards.forEach(card => card.classList.remove('selected'));
                
                // Add selection to clicked card
                event.currentTarget.classList.add('selected');
                
                // Store selected job ID
                document.getElementById('<%= hdnSelectedJobId.ClientID %>').value = jobId;
                
                // Load job details via AJAX or postback
                __doPostBack('<%= hdnSelectedJobId.UniqueID %>', jobId);
            }

            // Close modals when clicking outside
            window.onclick = function(event) {
                var signInModal = document.getElementById('signInModal');
                var signUpModal = document.getElementById('signUpModal');
                
                if (event.target == signInModal) {
                    hideSignInModal();
                }
                if (event.target == signUpModal) {
                    hideSignUpModal();
                }
            }
        </script>
    </form>
</body>
</html>

