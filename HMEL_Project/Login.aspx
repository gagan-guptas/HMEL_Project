<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HMEL_Project.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - HMEL Careers</title>
    <style>body {
    margin: 0;
    padding: 0;
    background: linear-gradient(to right, #004080, #0059b3);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-box {
    background-color: white;
    padding: 40px 30px;
    border-radius: 12px;
    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
    width: 100%;
    max-width: 400px;
}

.login-box h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #004080;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    font-weight: 600;
    display: block;
    margin-bottom: 6px;
    color: #333;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #bbb;
    border-radius: 5px;
    font-size: 14px;
    transition: border-color 0.3s ease;
}

.form-group input:focus {
    border-color: #004080;
    outline: none;
}

.login-btn {
    width: 100%;
    padding: 12px;
    background-color: #004080;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.login-btn:hover {
    background-color: #003060;
}

.message {
    margin-top: 15px;
    text-align: center;
    color: red;
    font-weight: 600;
}

.info-text {
    text-align: center;
    margin-top: 15px;
    font-size: 13px;
    color: #666;
}

.info-text a {
    color: #004080;
    text-decoration: none;
    font-weight: 600;
}

.info-text a:hover {
    text-decoration: underline;
}

.back-btn {
    margin-top: 15px;
    width: 100%;
    padding: 10px;
    background-color: #6c757d; /* Gray */
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.back-btn:hover {
    background-color: #495057;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Login to HMEL Careers</h2>

            <div class="form-group">
                <asp:Label ID="lblUser" runat="server" AssociatedControlID="txtUser" Text="Username" />
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblPass" runat="server" AssociatedControlID="txtPass" Text="Password" />
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-btn" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="message" />

            <div class="info-text">
                Don't have an account? <a href="Signup.aspx">Sign up here</a>
            </div>
            <asp:Button ID="btnBack" runat="server" Text="Back to HomePage" CssClass="back-btn" OnClick="btnBack_Click" />
        </div>
    </form>
</body>
</html>
