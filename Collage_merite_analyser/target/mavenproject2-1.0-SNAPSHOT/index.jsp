<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // This Java code runs on the server BEFORE the page is sent to the browser.
    List<String> locations = new ArrayList<>();
    
    // --- Database Details ---
    String dbUrl = "jdbc:mysql://localhost:3306/college_admission";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // This query gets all unique city names from your 'institute_name' column
        String sql = "SELECT DISTINCT TRIM(SUBSTRING_INDEX(institute_name, ',', -1)) AS location FROM colleges ORDER BY location ASC";
        
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                locations.add(rs.getString("location"));
            }
        }
    } catch (Exception e) {
        // If there's an error, it will print to your server's log file for debugging
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DDCET College Admission Predictor</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        h1 { margin: 0 0 0.5rem 0; }
        p { margin-bottom: 2rem; color: #666; }
        .form-group { margin-bottom: 1.5rem; }
        .form-group input, .form-group select {
            width: 100%;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #8e44ad;
        }
        .btn {
            background: linear-gradient(135deg, #9b59b6, #71b7e6);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-weight: 600;
            width: 100%;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Admission Predictor</h1>
        <p>Enter your rank and select a location to find matching colleges.</p>
        
        <form action="processRank" method="post">
            <div class="form-group">
                <input type="number" name="rank" placeholder="Enter your rank (e.g., 1600)" required>
            </div>
            
            <div class="form-group">
                <select name="location" required>
                    <option value="all">All Locations</option>
                    <%
                        // Now, we loop through the 'locations' list that we filled with our Java code above
                        if (locations != null) {
                            for (String loc : locations) {
                    %>
                                <option value="<%= loc %>"><%= loc %></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn">Find My Colleges</button>
        </form>
    </div>

</body>
</html>