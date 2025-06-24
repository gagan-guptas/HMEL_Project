<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HMEL_Project.AdminDashboard" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            max-width: 700px;
            margin: 50px auto;
            background: white;
            padding: 40px 30px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
            color: #003366;
        }
        .dashboard-btn {
            color: white;
            border: none;
            padding: 15px 30px;
            margin: 12px 10px;
            font-size: 1.1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            min-width: 220px;
        }
        .dashboard-btn.create-job {
            background-color: #28a745; /* green */
        }
        .dashboard-btn.create-job:hover {
            background-color: #1e7e34;
        }
        .dashboard-btn.secondary {
            background-color: #dc3545; /* red */
        }
        .dashboard-btn.secondary:hover {
            background-color: #a71d2a;
        }
        .btn-homepage {
    display: inline-block;
    background-color: #007bff; /* Bootstrap blue */
    color: white;
    border: none;
    padding: 12px 28px;
    margin-top: 30px;
    font-size: 1rem;
    font-weight: 500;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
    min-width: 180px;
}

.btn-homepage:hover {
    background-color: #0056b3; /* Darker blue on hover */
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(0, 123, 255, 0.3);
}

.btn-homepage:active {
    transform: translateY(0);
    box-shadow: 0 3px 8px rgba(0, 123, 255, 0.2);
}
.dashboard-btn.manage {
    background-color: #6f42c1; /* Indigo/Violet tone */
    color: white;
    border: none;
    padding: 15px 30px;
    margin: 12px 10px;
    font-size: 1.1rem;
    font-weight: 500;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    min-width: 220px;
    box-shadow: 0 4px 12px rgba(111, 66, 193, 0.15);
}

.dashboard-btn.manage:hover {
    background-color: #563d7c; /* Darker indigo */
    transform: translateY(-2px);
    box-shadow: 0 6px 18px rgba(111, 66, 193, 0.25);
}

.dashboard-btn.manage:active {
    transform: translateY(0);
    box-shadow: 0 3px 8px rgba(111, 66, 193, 0.2);
}


    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h2>Admin Dashboard</h2>

            <asp:Button ID="btnCreateJob" runat="server" Text="Create Job" CssClass="dashboard-btn create-job" OnClick="btnCreateJob_Click" />
            <asp:Button ID="btnDeleteJob" runat="server" Text="Delete Job" CssClass="dashboard-btn secondary" OnClick="btnDeleteJob_Click" />
            <asp:Button ID="btnManageJobs" runat="server" Text="Manage Job Applications" CssClass="dashboard-btn manage" OnClick="btnManageJobs_Click" />
            <br />
            <asp:Button ID="btnHomepage" runat="server" Text="Homepage" CssClass="btn-homepage" OnClick="btnHomepage_Click" />
        </div>
    </form>
</body>
</html>