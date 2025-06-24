<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicantDashboard.aspx.cs" Inherits="HMEL_Project.ApplicantDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Applicant Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 28px;
        }

        .dashboard {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 30px;
        }

        .section {
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 25px;
            margin: 15px;
            border-radius: 10px;
            width: 45%;
        }

        h2 {
            color: #34495e;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #ecf0f1;
        }

        tr:nth-child(even) {
            background-color: #f4f6f8;
        }

        .job-card {
            border: 1px solid #dfe6e9;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fefefe;
        }

        .job-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 8px;
        }

        .apply-btn {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .apply-btn:hover {
            background-color: #1c5980;
        }

        .back-btn {
            background-color: #7f8c8d;
            color: white;
            padding: 10px 20px;
            border: none;
            margin: 20px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .back-btn:hover {
            background-color: #616a6b;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        /* Progress Bar Styling */
        .progress-bar {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin: 10px 0;
        }

        .step {
            width: 25%;
            text-align: center;
            position: relative;
            padding-top: 25px;
            font-size: 12px;
            color: #999;
        }

        .step::before {
            content: '';
            width: 18px;
            height: 18px;
            background-color: #ccc;
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
        }

        .step::after {
            content: '';
            position: absolute;
            top: 8px;
            left: 50%;
            height: 4px;
            width: 100%;
            background-color: #ccc;
            z-index: 0;
            transform: translateX(-50%);
        }

        .step:first-child::after {
            width: 50%;
            left: 50%;
        }

        .step:last-child::after {
            width: 50%;
            left: 0;
        }

        .step.completed {
            color: #27ae60;
        }

        .step.completed::before {
            background-color: #27ae60;
        }

        .step.completed::after {
            background-color: #27ae60;
        }

        .step.current {
            color: #2980b9;
            font-weight: bold;
        }

        .step.current::before {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            Welcome, Applicant - Dashboard
        </div>

        <div class="dashboard">
            <div class="section">
                <h2>Jobs You've Applied For</h2>
                <asp:GridView ID="gvAppliedJobs" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                        <asp:TemplateField HeaderText="Application Status">
                            <ItemTemplate>
                                <div class="progress-bar">
                                    <div class='<%# GetStepClass("Applied", Eval("Status").ToString()) %>'>Applied</div>
                                    <div class='<%# GetStepClass("Review", Eval("Status").ToString()) %>'>Review</div>
                                    <div class='<%# GetStepClass("Interview", Eval("Status").ToString()) %>'>Interview</div>
                                    <div class='<%# GetStepClass("Final", Eval("Status").ToString()) %>'>Final</div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="section">
                <h2>Other Available Jobs</h2>
                <asp:Repeater ID="rptJobs" runat="server">
                    <ItemTemplate>
                        <div class="job-card">
                            <div class="job-title"><%# Eval("JobTitle") %></div>
                            <div><%# Eval("Description") %></div>
                            <br />
                            <asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="apply-btn"
                                CommandArgument='<%# Eval("JobId") %>' OnCommand="ApplyJob" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="footer">
            <asp:Button ID="btnBack" runat="server" Text="← Back to Homepage" CssClass="back-btn" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>
