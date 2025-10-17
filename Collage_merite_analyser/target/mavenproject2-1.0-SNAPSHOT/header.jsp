<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Predictor</title>
    <%-- Link to our new central stylesheet --%>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="header">
    <div class="logo">CollegePredictor</div>
    <nav class="navbar">
        <%-- The link to Home MUST go to "/home" to run the servlet that loads locations --%>
        <a href="home.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="contact.jsp">Contact</a>
    </nav>
</header>