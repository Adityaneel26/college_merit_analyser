<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>

<%-- Include the header at the top of the page --%>
<jsp:include page="header.jsp" />

<%
    List<String> locations = new ArrayList<>();
    String dbUrl = "jdbc:mysql://localhost:3306/college_admission";
    String dbUser = "root";
    String dbPassword = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "SELECT DISTINCT TRIM(SUBSTRING_INDEX(institute_name, ',', -1)) AS location FROM colleges ORDER BY location ASC";
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                locations.add(rs.getString("location"));
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<main class="main-content">
    <div class="home-container">
        <div class="predictor-box">
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
    </div>
</main>

<%-- Include the footer at the bottom of the page --%>
<jsp:include page="footer.jsp" />