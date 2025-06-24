<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="HMEL_Project.HomePage" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Careers Portal</title>
    <style>
        /* Reset */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f7f9;
    color: #1c1c1c;
}

/* Header styling */
header {
    background-color: #003366; /* HMEL Deep Blue */
    padding: 18px 40px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.12);
}

header h1 {
    font-weight: 700;
    font-size: 2rem;
    letter-spacing: 1.2px;
    cursor: default;
}

/* Navigation links (Login, Signup) */
nav {
    display: flex;
    gap: 15px;
}

nav a {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: 600;
    padding: 10px 22px;
    background-color: #004a99; /* HMEL dark blue */
    color: #fff;
    border-radius: 4px;
    text-decoration: none;
    border: 1.5px solid transparent;
    box-shadow: 0 2px 6px rgb(0 74 153 / 0.3);
    transition: background-color 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
}

nav a:hover {
    background-color: #003366; /* Darker blue on hover */
    border-color: #002244;
    box-shadow: 0 4px 12px rgb(0 50 100 / 0.5);
}

/* Main container */
main {
    max-width: 900px;
    margin: 40px auto;
    padding: 0 15px;
}
/* Search button */
.search-button {
    background-color: #0071bc;
    color: white;
    padding: 0 28px;
    font-weight: 700;
    font-size: 1rem;
    border-radius: 0 5px 5px 0;
    border: none;
    cursor: pointer;
    box-shadow: 0 3px 8px rgb(0 113 188 / 0.4);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.search-button:hover {
    background-color: #005b95;
    box-shadow: 0 4px 14px rgb(0 91 149 / 0.6);
}

/* View Details button */
.viewdetails-button {
    width:50%;
    background-color: #004a99;
    color: white;
    padding: 16px 20px;      /* Horizontal padding halved from 40px to 20px */
    font-weight: 600;
    font-size: 1.2rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    box-shadow: 0 2px 8px rgb(0 74 153 / 0.3);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;      /* Halved min-width from 140px to 70px */
    text-align: center;
}



.viewdetails-button:hover {
    background-color: #003366;
    box-shadow: 0 4px 14px rgb(0 50 100 / 0.5);
}

/* Search bar */
.search-bar {
    display: flex;
    margin-bottom: 30px;
}

.search-bar input[type="text"] {
    flex-grow: 1;
    padding: 14px 18px;
    font-size: 1.1rem;
    border: 2px solid #0071bc; /* HMEL lighter blue */
    border-radius: 5px 0 0 5px;
    outline: none;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.search-bar input[type="text"]:focus {
    border-color: #005b95;
    box-shadow: 0 0 8px rgb(0 91 149 / 0.5);
}

.search-bar button {
    background-color: #0071bc;
    color: white;
    padding: 0 28px;
    font-weight: 700;
    font-size: 1rem;
    border-radius: 0 5px 5px 0;
    border: none;
    cursor: pointer;
    box-shadow: 0 3px 8px rgb(0 113 188 / 0.4);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.search-bar button:hover {
    background-color: #005b95;
    box-shadow: 0 4px 14px rgb(0 91 149 / 0.6);
}

/* Job listings grid */
.jobs-list {
    display: grid;
    gap: 20px;
}

/* Individual job card */
.job-card {
    background-color: white;
    padding: 25px 22px;
    border-radius: 6px;
    box-shadow: 0 4px 15px rgb(0 113 188 / 0.12);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border-left: 6px solid #0071bc;
    margin-bottom: 20px;
}

.job-card h3 {
    margin-bottom: 10px;
    color: #003366;
    font-size: 1.3rem;
}

.job-card p {
    flex-grow: 1;
    margin-bottom: 16px;
    color: #444;
    font-size: 1rem;
    line-height: 1.3;
}

/* Buttons inside job cards */
.job-card button {
    background-color: #004a99;
    color: white;
    padding: 12px 28px;
    font-weight: 600;
    font-size: 1rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    box-shadow: 0 2px 8px rgb(0 74 153 / 0.3);
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.job-card button:hover {
    background-color: #003366;
    box-shadow: 0 4px 14px rgb(0 50 100 / 0.5);
}

/* Footer */
footer {
    text-align: center;
    padding: 25px;
    margin-top: 40px;
    font-size: 0.9rem;
    color: #444;
    font-weight: 600;
    border-top: 1px solid #ddd;
}

/* Responsive design */
@media(max-width: 600px) {
    header {
        padding: 15px 20px;
    }

    .search-bar {
        flex-direction: column;
    }

    .search-bar input[type="text"],
    .search-bar button {
        width: 100%;
        border-radius: 5px;
    }

    .search-bar button {
        margin-top: 10px;
        border-radius: 5px;
    }

    .job-card {
        padding: 18px 15px;
    }
}

    </style>
</head>
<body>
    <header>
    <img src="https://www.hmel.in/assets/images/HMEL-Logo.svg" alt="HMEL Logo" style="height:40px; margin-right: 15px;" />
    <h1>HMEL Careers Portal</h1>
    <nav> ... </nav>
</header>



    <form id="form1" runat="server">
        <header>
            <h1>Careers Portal</h1>
            <nav>
                <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                <asp:HyperLink ID="hlSignup" runat="server" NavigateUrl="~/Signup.aspx">Signup</asp:HyperLink>
            </nav>
        </header>

        <main>
            <div class="search-bar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search jobs, keywords..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-button" OnClick="btnSearch_Click" />
            </div>

            <asp:Repeater ID="rptJobs" runat="server">
                <ItemTemplate>
                    <div class="job-card">
                        <h3><%# Eval("Title") %></h3>
                        <p><%# Eval("Description") %></p>
                        <asp:Button ID="btnViewDetails" CssClass="viewdetails-button" runat="server" Text="View Details" CommandArgument='<%# Eval("Id") %>' OnClick="btnViewDetails_Click" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </main>

       <footer>
    &copy; <%# DateTime.Now.Year %> HPCL Mittal Energy Limited. All rights reserved.
</footer>
    </form>
</body>
</html>
