<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HMEL_Carrer.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HMEL - Career Dashboard</title>
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
            min-height: 100vh;
            color: #334155;
        }

        /* Header Styles */
        .header {
            background: white;
            border-bottom: 3px solid #0066cc;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-section {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .company-logo {
            height: 48px;
            width: auto;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-link {
            color: #64748b;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #0066cc;
            background: #f0f9ff;
        }

        .nav-link.active {
            color: #0066cc;
            background: #f0f9ff;
            border-bottom: 2px solid #0066cc;
        }

        .user-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0066cc, #003366);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 14px;
        }

        /* Main Content */
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        .welcome-section {
            margin-bottom: 2rem;
        }

        .welcome-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #003366;
            margin-bottom: 0.5rem;
        }

        .welcome-subtitle {
            color: #64748b;
            font-size: 1.125rem;
        }

        /* Grid Layout */
        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 2rem;
        }

        /* Card Styles */
        .card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .card-header {
            background: linear-gradient(135deg, #0066cc, #003366);
            color: white;
            padding: 1.5rem;
        }

        .card-header.orange {
            background: linear-gradient(135deg, #ff6600, #e55100);
        }

        .card-header.slate {
            background: linear-gradient(135deg, #475569, #334155);
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .card-subtitle {
            color: rgba(255,255,255,0.9);
            margin-top: 0.5rem;
            font-size: 0.875rem;
        }

        .card-content {
            padding: 1.5rem;
        }

        /* Tabs */
        .tabs {
            margin-bottom: 1.5rem;
        }

        .tab-list {
            display: flex;
            background: #f1f5f9;
            border-radius: 8px;
            padding: 4px;
        }

        .tab-button {
            flex: 1;
            padding: 0.75rem 1rem;
            background: none;
            border: none;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .tab-button.active {
            background: #0066cc;
            color: white;
        }

        .tab-button.completed.active {
            background: #059669;
        }

        /* Task Items */
        .task-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem;
            border: 2px solid #fed7aa;
            background: #fff7ed;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .task-item.completed {
            border-color: #bbf7d0;
            background: #f0fdf4;
        }

        .task-info {
            flex: 1;
        }

        .task-grid {
            display: grid;
            grid-template-columns: 2fr 1.5fr 1fr 1fr;
            gap: 1rem;
            font-size: 0.875rem;
        }

        .task-title {
            font-weight: 600;
            color: #1e293b;
        }

        .task-detail {
            color: #64748b;
        }

        /* Application Items */
        .application-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .application-item:hover {
            background: #f8fafc;
            border-color: #0066cc;
        }

        .application-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1.5fr 1fr auto;
            gap: 1rem;
            align-items: center;
            width: 100%;
            font-size: 0.875rem;
        }

        /* Status Badges */
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            border: 1px solid;
        }

        .status-review {
            background: #dbeafe;
            color: #1e40af;
            border-color: #93c5fd;
        }

        .status-interview {
            background: #dcfce7;
            color: #166534;
            border-color: #86efac;
        }

        .status-submitted {
            background: #fed7aa;
            color: #c2410c;
            border-color: #fdba74;
        }

        /* Buttons */
        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background: #0066cc;
            color: white;
        }

        .btn-primary:hover {
            background: #0052a3;
            transform: translateY(-1px);
        }

        .btn-orange {
            background: #ff6600;
            color: white;
        }

        .btn-orange:hover {
            background: #e55100;
        }

        .btn-outline {
            background: white;
            border: 1px solid #e2e8f0;
            color: #64748b;
        }

        .btn-outline:hover {
            background: #f8fafc;
            border-color: #0066cc;
            color: #0066cc;
        }

        /* Sidebar */
        .sidebar-card {
            height: fit-content;
        }

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .quick-action-btn {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            background: white;
            border-radius: 6px;
            text-decoration: none;
            color: #64748b;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .quick-action-btn:hover {
            background: #f0f9ff;
            border-color: #0066cc;
            color: #0066cc;
        }

        /* Icons */
        .icon {
            width: 20px;
            height: 20px;
            display: inline-block;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
            
            .header-content {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-links {
                order: -1;
            }
        }

        @media (max-width: 768px) {
            .main-container {
                padding: 1rem;
            }
            
            .welcome-title {
                font-size: 2rem;
            }
            
            .task-grid,
            .application-grid {
                grid-template-columns: 1fr;
                gap: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="header-content">
                <div class="logo-section">
                    <img src="Images/hmel-logo.png" alt="HMEL - Hindustan Mittal Energy Limited" class="company-logo" />
                    <div class="nav-links">
                        <a href="#" class="nav-link">🔍 Search for Jobs</a>
                        <a href="#" class="nav-link active">🏠 Candidate Home</a>
                    </div>
                </div>
                <div class="user-section">
                    <span class="icon">🔔</span>
                    <span class="icon">⚙️</span>
                    <div class="user-avatar">
                        <asp:Label ID="lblUserInitials" runat="server" Text="CD"></asp:Label>
                    </div>
                    <span style="font-weight: 500;">
                        <asp:Label ID="lblUserEmail" runat="server" Text="candidate@example.com"></asp:Label>
                    </span>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-container">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <h1 class="welcome-title">Welcome, <asp:Label ID="lblUserName" runat="server" Text="Candidate"></asp:Label></h1>
                <p class="welcome-subtitle">Manage your applications and track your progress with HMEL</p>
            </div>

            <div class="dashboard-grid">
                <!-- Main Content Column -->
                <div>
                    <!-- My Tasks Card -->
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                ✅ My Tasks
                            </div>
                            <div class="card-subtitle">Please complete any pending tasks on your job applications.</div>
                        </div>
                        <div class="card-content">
                            <div class="tabs">
                                <div class="tab-list">
                                    <button type="button" class="tab-button active" onclick="showTab('todo')">To Do (1)</button>
                                    <button type="button" class="tab-button completed" onclick="showTab('completed')">Completed (1)</button>
                                </div>
                            </div>

                            <div id="todo-content">
                                <div class="task-item">
                                    <div class="task-info">
                                        <div class="task-grid">
                                            <div>
                                                <div class="task-title">Complete Background Verification</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">Process Engineer</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">HMEL2024001</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">January 15, 2025</div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnCompleteTask" runat="server" Text="Complete" CssClass="btn btn-orange" />
                                </div>
                            </div>

                            <div id="completed-content" style="display: none;">
                                <div class="task-item completed">
                                    <div class="task-info">
                                        <div class="task-grid">
                                            <div>
                                                <div class="task-title">Submit Medical Certificate</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">Chemical Engineer</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">HMEL2024002</div>
                                            </div>
                                            <div>
                                                <div class="task-detail">January 12, 2025</div>
                                            </div>
                                        </div>
                                    </div>
                                    <span style="color: #059669; font-size: 1.5rem;">✅</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- My Applications Card -->
                    <div class="card">
                        <div class="card-header">
                            <div class="card-title">
                                💼 My Applications
                            </div>
                            <div class="card-subtitle">
                                For more information on what comes next, be sure to check out the 'Hiring Process' section of our 
                                <a href="#" style="color: #fed7aa; text-decoration: underline;">Careers Site</a>.
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="tabs">
                                <div class="tab-list">
                                    <button type="button" class="tab-button active">Active (3)</button>
                                    <button type="button" class="tab-button">Inactive (0)</button>
                                </div>
                            </div>

                            <div class="application-item">
                                <div class="application-grid">
                                    <div>
                                        <div class="task-title">Process Engineer</div>
                                        <div style="font-size: 0.75rem; color: #64748b; margin-top: 0.25rem;">Bathinda, Punjab</div>
                                    </div>
                                    <div class="task-detail">HMEL2024001</div>
                                    <div>
                                        <span class="status-badge status-review">Under Review</span>
                                    </div>
                                    <div class="task-detail">January 10, 2025</div>
                                    <div>⋯</div>
                                </div>
                            </div>

                            <div class="application-item">
                                <div class="application-grid">
                                    <div>
                                        <div class="task-title">Chemical Engineer</div>
                                        <div style="font-size: 0.75rem; color: #64748b; margin-top: 0.25rem;">Bathinda, Punjab</div>
                                    </div>
                                    <div class="task-detail">HMEL2024002</div>
                                    <div>
                                        <span class="status-badge status-interview">Interview Scheduled</span>
                                    </div>
                                    <div class="task-detail">January 8, 2025</div>
                                    <div>⋯</div>
                                </div>
                            </div>

                            <div class="application-item">
                                <div class="application-grid">
                                    <div>
                                        <div class="task-title">Safety Officer</div>
                                        <div style="font-size: 0.75rem; color: #64748b; margin-top: 0.25rem;">Bathinda, Punjab</div>
                                    </div>
                                    <div class="task-detail">HMEL2024003</div>
                                    <div>
                                        <span class="status-badge status-submitted">Application Submitted</span>
                                    </div>
                                    <div class="task-detail">January 5, 2025</div>
                                    <div>⋯</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Similar Jobs Card -->
                    <div class="card">
                        <div class="card-header slate">
                            <div class="card-title">Similar Jobs</div>
                        </div>
                        <div class="card-content">
                            <div class="application-item" style="cursor: pointer;">
                                <div>
                                    <div class="task-title">Mechanical Engineer</div>
                                    <div class="task-detail" style="margin-top: 0.5rem;">Bathinda, Punjab • Full-time</div>
                                    <div style="font-size: 0.75rem; color: #64748b; margin-top: 0.5rem;">Posted 2 days ago</div>
                                </div>
                            </div>
                            <div class="application-item" style="cursor: pointer;">
                                <div>
                                    <div class="task-title">Electrical Engineer</div>
                                    <div class="task-detail" style="margin-top: 0.5rem;">Bathinda, Punjab • Full-time</div>
                                    <div style="font-size: 0.75rem; color: #64748b; margin-top: 0.5rem;">Posted 5 days ago</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar -->
                <div>
                    <!-- Welcome Card -->
                    <div class="card sidebar-card">
                        <div class="card-header orange">
                            <div class="card-title">Welcome</div>
                        </div>
                        <div class="card-content">
                            <h4 style="font-weight: 600; color: #1e293b; margin-bottom: 1rem;">Welcome Message</h4>
                            <p style="font-size: 0.875rem; color: #64748b; line-height: 1.6; margin-bottom: 1rem;">
                                Welcome to your HMEL candidate homepage! This is where you can find updates on submitted
                                applications, any tasks you may need to complete during the application process, and information
                                about our company.
                            </p>
                            <a href="#" class="btn btn-outline" style="font-size: 0.875rem;">Read More →</a>
                        </div>
                    </div>

                    <!-- About HMEL Card -->
                    <div class="card sidebar-card">
                        <div class="card-header">
                            <div class="card-title">About HMEL</div>
                        </div>
                        <div class="card-content">
                            <div style="text-align: center; margin-bottom: 1.5rem;">
                                <img src="Images/hmel-logo.png" alt="HMEL Logo" style="height: 80px; width: auto;" />
                            </div>
                            <p style="font-size: 0.875rem; color: #64748b; line-height: 1.6; margin-bottom: 1rem;">
                                HMEL (Hindustan Mittal Energy Limited) is a leading energy company committed to excellence in refining
                                and petrochemicals. We're dedicated to sustainable energy solutions and creating value for our
                                stakeholders while maintaining the highest standards of safety and environmental responsibility.
                            </p>
                            <a href="#" class="btn btn-outline" style="font-size: 0.875rem;">Read More →</a>
                        </div>
                    </div>

                    <!-- Quick Actions Card -->
                    <div class="card sidebar-card">
                        <div class="card-header slate">
                            <div class="card-title">Quick Actions</div>
                        </div>
                        <div class="card-content">
                            <div class="quick-actions">
                                <a href="#" class="quick-action-btn">
                                    📄 Update Profile
                                </a>
                                <a href="#" class="quick-action-btn">
                                    🔍 Browse Jobs
                                </a>
                                <a href="FirstPage.aspx" class="quick-action-btn">
                                    📝 New Application
                                </a>
                                <a href="#" class="quick-action-btn">
                                    📅 Schedule Interview
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function showTab(tabName) {
                // Hide all tab contents
                document.getElementById('todo-content').style.display = 'none';
                document.getElementById('completed-content').style.display = 'none';
                
                // Remove active class from all buttons
                var buttons = document.querySelectorAll('.tab-button');
                buttons.forEach(function(btn) {
                    btn.classList.remove('active');
                });
                
                // Show selected tab and activate button
                if (tabName === 'todo') {
                    document.getElementById('todo-content').style.display = 'block';
                    buttons[0].classList.add('active');
                } else if (tabName === 'completed') {
                    document.getElementById('completed-content').style.display = 'block';
                    buttons[1].classList.add('active');
                }
            }
        </script>
    </form>
</body>
</html>

