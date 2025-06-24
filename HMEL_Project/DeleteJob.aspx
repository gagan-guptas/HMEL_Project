<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteJob.aspx.cs" Inherits="HMEL_Project.DeleteJob" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Job</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 30px;
        }

        .job-table {
            width: 100%;
            border-collapse: collapse;
        }

        .job-table th, .job-table td {
            padding: 10px 15px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        .job-table th {
            background-color: #007bff;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #a71d2a;
        }

        .back-btn {
            margin-top: 20px;
            background-color: #28a745;
            padding: 10px 20px;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            display: block;
            margin-left: auto;
        }

        .back-btn:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Delete Job</h2>
            <asp:GridView ID="GridViewDeleteJob" runat="server" AutoGenerateColumns="False"
                OnRowDeleting="GridViewDeleteJob_RowDeleting"
                DataKeyNames="JobId" CssClass="job-table">
                <Columns>
                    <asp:BoundField DataField="JobId" HeaderText="Job ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" 
                        ControlStyle-CssClass="delete-btn" ButtonType="Button" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" CssClass="back-btn" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>