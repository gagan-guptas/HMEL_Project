<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApprovalDashboard.aspx.cs" Inherits="HMEL_Project.ApprovalDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approval Dashboard</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style>
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #e0eafc, #cfdef3);
    margin: 0;
    padding: 0;
}

.dashboard-container {
    width: 90%;
    max-width: 1200px;
    margin: 50px auto;
    text-align: center;
}

.dashboard-container h1 {
    font-size: 2.5rem;
    margin-bottom: 40px;
    color: #2b2b2b;
}

.card-container {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 30px;
    width: 300px;
    transition: transform 0.2s;
}

.card:hover {
    transform: translateY(-5px);
}

.card h2 {
    margin: 0 0 15px;
    color: #333333;
}

.count-label {
    display: block;
    font-size: 2rem;
    margin: 10px 0 20px;
    color: #007bff;
    font-weight: bold;
}

.btn {
    background-color: #007bff;
    color: white;
    padding: 12px 25px;
    font-size: 1rem;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.btn:hover {
    background-color: #0056b3;
}

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .gridview th, .gridview td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        .gridview th {
            background-color: #007bff;
            color: white;
        }
        .action-btn {
            padding: 6px 10px;
            margin: 0 2px;
            border: none;
            border-radius: 6px;
            color: white;
            cursor: pointer;
        }
        .approve-btn { background-color: #28a745; }
        .reject-btn { background-color: #dc3545; }
        .view-btn { background-color: #17a2b8; }
        .reset-btn {
            margin-top: 30px;
            padding: 12px 25px;
            font-size: 1rem;
            background-color: #ff9800;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Approval Dashboard</h1>

            <!-- Summary Cards -->
            <div class="card-container">
                <div class="card">
                    <h2>Pending Approvals</h2>
                    <asp:Label ID="lblPendingCount" runat="server" CssClass="count-label" />
                </div>
                <div class="card">
                    <h2>Approved Requests</h2>
                    <asp:Label ID="lblApprovedCount" runat="server" CssClass="count-label" />
                </div>
                <div class="card">
                    <h2>Rejected Requests</h2>
                    <asp:Label ID="lblRejectedCount" runat="server" CssClass="count-label" />
                </div>
            </div>

            <!-- GridView for Requests -->
            <asp:GridView ID="gvRequests" runat="server" CssClass="gridview" AutoGenerateColumns="False" OnRowCommand="gvRequests_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CssClass="action-btn approve-btn"
                                        CommandName="Approve" CommandArgument='<%# Eval("Id") %>' />
                            <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="action-btn reject-btn"
                                        CommandName="Reject" CommandArgument='<%# Eval("Id") %>' />
                            <asp:Button ID="btnView" runat="server" Text="👁️" CssClass="action-btn view-btn"
                                        CommandName="View" CommandArgument='<%# Eval("Id") %>' ToolTip="View Details" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
<!-- Navigation Buttons -->
<div style="margin:20px 30px;">
    <asp:Button ID="btnHome" runat="server" Text="🏠 Home" CssClass="btn" PostBackUrl="~/Homepage.aspx" />
    <asp:Button ID="btnAdmin" runat="server" Text="🛠️ Admin Page" CssClass="btn" PostBackUrl="~/AdminDashboard.aspx" />
</div>

            <!-- Reset All Button -->
            <asp:Button ID="btnResetAll" runat="server" Text="Reset All Requests" CssClass="reset-btn" OnClick="btnResetAll_Click" />
        </div>
    </form>
</body>
</html>