<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="HMEL_Project.JobDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Job Details</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }
        .job-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
            max-width: 700px;
            margin: auto;
        }
        .job-container h2 {
            color: #2c3e50;
        }
        .job-info p {
            margin: 10px 0;
        }
        .btn {
            margin-top: 20px;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .apply-btn {
            background-color: #27ae60;
            color: white;
        }
        .back-btn {
            background-color: #3498db;
            color: white;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="job-container">
            <h2><asp:Label ID="lblTitle" runat="server" Text="Job Title"></asp:Label></h2>
            <div class="job-info">
                <p><strong>Location:</strong> <asp:Label ID="lblLocation" runat="server" /></p>
                <p><strong>Description:</strong></p>
                <p><asp:Label ID="lblDescription" runat="server" /></p>
                <p><strong>Requirements:</strong></p>
                <p><asp:Label ID="lblRequirements" runat="server" /></p>
            </div>
            <asp:Button ID="btnApply" runat="server" CssClass="btn apply-btn" Text="Apply Now" OnClick="btnApply_Click" />
            <asp:Button ID="btnBack" runat="server" CssClass="btn back-btn" Text="Back to Homepage" PostBackUrl="~/Homepage.aspx" />
        </div>
    </form>
</body>
</html>
