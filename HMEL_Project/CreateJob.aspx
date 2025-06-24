<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateJob.aspx.cs" Inherits="HMEL_Project.CreateJob" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Job</title>
    <style>
        body {
            background-color: #f4f6f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .form-container {
            max-width: 600px;
            margin: 60px auto;
            padding: 40px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .error {
            color: red;
            font-size: 13px;
            margin-top: 5px;
        }

        .btn-submit, .btn-back {
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-submit {
            background-color: #28a745;
            color: white;
        }

        .btn-submit:hover {
            background-color: #1e7e34;
        }

        .btn-back {
            background-color: #007bff;
            color: white;
            margin-top: 15px;
            display: inline-block;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .msg {
            color: green;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Create New Job</h2>

            <div class="form-group">
                <label>Job ID</label>
                <asp:TextBox ID="txtJobId" runat="server" ReadOnly="True" />
            </div>

            <div class="form-group">
                <label>Job Title</label>
                <asp:TextBox ID="txtTitle" runat="server" />
                <asp:Label ID="lblTitleError" runat="server" CssClass="error" />
            </div>

            <div class="form-group">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" />
                <asp:Label ID="lblDescError" runat="server" CssClass="error" />
            </div>

            <div class="form-group">
                <label>Location</label>
                <asp:TextBox ID="txtLocation" runat="server" />
                <asp:Label ID="lblLocError" runat="server" CssClass="error" />
            </div>

            <div class="form-group">
                <label>Job Type</label>
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Full-Time" Value="Full-Time" />
                    <asp:ListItem Text="Part-Time" Value="Part-Time" />
                    <asp:ListItem Text="Internship" Value="Internship" />
                </asp:DropDownList>
                <asp:Label ID="lblTypeError" runat="server" CssClass="error" />
            </div>

            <asp:Button ID="btnSubmit" runat="server" Text="Post Job" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" CssClass="msg" />
            <br />
            <asp:Button ID="btnBack" runat="server" Text="← Back to Admin Dashboard" CssClass="btn-back" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>
