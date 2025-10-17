<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.mycompany.mavenproject2.College" %>

<%-- No DOCTYPE or <html> here, it's in the header! --%>
<jsp:include page="header.jsp" />

<main class="main-content">
    <%
        List<College> colleges = (List<College>) request.getAttribute("collegesList");
        Integer studentRank = (Integer) request.getAttribute("studentRank");
        String location = (String) request.getAttribute("location");
        String locationText = location.equalsIgnoreCase("all") ? "All Locations" : location;
    %>

    <div class="content-page">
        <div class="header" style="text-align: center; box-shadow: none;">
            <h1>College Admission Possibilities</h1>
            <p>
                Showing results for Rank <span><%= studentRank %></span> in <span><%= locationText %></span>.
                Found <span><%= colleges.size() %></span> matching options.
            </p>
        </div>
    </div>
    
    <%-- The results container and cards from before --%>
    <%-- Paste the existing results container and card logic here --%>
    <%-- (I am adding it below for completeness) --%>

    <style>
        /* Styles specific to the results page for cards */
        .results-container { display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 1.5rem; max-width: 1200px; margin: 0 auto; padding: 0 2rem; }
        .college-card { background: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08); padding: 1.5rem; }
        .card-header h2 { margin: 0 0 0.5rem 0; color: #34495e; font-size: 1.25rem; }
        .card-header .branch { font-weight: 600; color: #8e44ad; margin-bottom: 1rem; display: block; }
        .details-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 0.8rem; font-size: 0.95rem; }
        .detail-item { background-color: #f9f9f9; padding: 0.5rem; border-radius: 5px; }
        .detail-item strong { display: block; color: #7f8c8d; font-size: 0.8rem; margin-bottom: 2px; }
        .no-results { text-align: center; background: white; padding: 3rem; border-radius: 10px; max-width: 600px; margin: 2rem auto; }
        .back-link { display: block; text-align: center; margin: 2.5rem auto; font-size: 1.1rem; color: #8e44ad; text-decoration: none; font-weight: 600; }
    </style>

    <% if (colleges != null && !colleges.isEmpty()) { %>
        <div class="results-container">
            <% for (College college : colleges) { %>
            <div class="college-card">
                <div class="card-header">
                    <h2><%= college.getInstituteName() %></h2>
                    <span class="branch"><%= college.getBranch() %></span>
                </div>
                <div class="details-grid">
                    <div class="detail-item"><strong>Opening Rank</strong> <%= college.getDdcetRankOpen() %></div>
                    <div class="detail-item"><strong>Closing Rank</strong> <%= college.getDdcetRankClose() %></div>
                    <div class="detail-item"><strong>Category</strong> <%= college.getAdmissionCategory() %></div>
                    <div class="detail-item"><strong>Quota</strong> <%= college.getQuota() %></div>
                    <div class="detail-item"><strong>Institute Type</strong> <%= college.getInstType() %></div>
                </div>
            </div>
            <% } %>
        </div>
    <% } else { %>
        <div class="no-results">
            <h2>Sorry, no matches found.</h2>
            <p>We couldn't find any college options that match your rank and selected location.</p>
        </div>
    <% } %>
    <a href="home" class="back-link">← Perform a New Search</a>
</main>

<jsp:include page="footer.jsp" />