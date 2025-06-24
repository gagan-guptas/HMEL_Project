<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageJob.aspx.cs" Inherits="HMEL_Project.ManageJob" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Job Listings</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1000px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 25px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
        }
        .job-grid {
            width: 100%;
            border-collapse: collapse;
        }
        .job-grid th, .job-grid td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .job-grid th {
            background-color: #007bff;
            color: white;
        }
        .job-grid tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            transition: background-color 0.3s ease;
        }
        .btn-edit {
            background-color: #17a2b8;
        }
        .btn-edit:hover {
            background-color: #117a8b;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #a71d2a;
        }
        .btn-home {
            margin-top: 20px;
            background-color: #28a745;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            display: block;
            margin-left: auto;
        }
        .btn-home:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Job Listings</h2>
            <asp:GridView ID="GridViewJobs" runat="server" AutoGenerateColumns="False" CssClass="job-grid"
                OnRowEditing="GridViewJobs_RowEditing"
                OnRowCancelingEdit="GridViewJobs_RowCancelingEdit"
                OnRowUpdating="GridViewJobs_RowUpdating"
                OnRowDeleting="GridViewJobs_RowDeleting"
                DataKeyNames="JobId">
                <Columns>
                    <asp:BoundField DataField="JobId" HeaderText="Job ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:BoundField DataField="PostedDate" HeaderText="Posted Date" DataFormatString="{0:dd-MMM-yyyy}" />

                    <asp:CommandField ShowEditButton="True" EditText="Edit" UpdateText="Update" CancelText="Cancel"
                        ControlStyle-CssClass="action-btn btn-edit" ButtonType="Button" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Delete"
                        ControlStyle-CssClass="action-btn btn-delete" ButtonType="Button" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnBackHome" runat="server" Text="Back to Dashboard" CssClass="btn-home" OnClick="btnBackHome_Click" />
        </div>
    </form>
</body>
</html>
