package com.mycompany.mavenproject2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/processRank")
public class ProcessRankServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/college_admission";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    private static final int RANK_RANGE = 500; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int studentRank = Integer.parseInt(request.getParameter("rank"));
        String location = request.getParameter("location");
        
        List<College> eligibleColleges = new ArrayList<>();
        
        // Use a StringBuilder to dynamically build our query
        StringBuilder sql = new StringBuilder("SELECT * FROM colleges WHERE ? >= ddcet_rank_open AND ? <= ddcet_rank_close ");
        
        boolean useLocationFilter = (location != null && !location.equalsIgnoreCase("all"));
        
        if(useLocationFilter) {
            // Add the location filter if a specific city was chosen
            sql.append("AND institute_name LIKE ? ");
        }
        
        sql.append("AND ddcet_rank_close BETWEEN ? AND ? ");
        sql.append("ORDER BY ABS(ddcet_rank_close - ?) ASC");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(sql.toString())) {
                
                int paramIndex = 1;
                ps.setInt(paramIndex++, studentRank);
                ps.setInt(paramIndex++, studentRank);
                
                if (useLocationFilter) {
                    ps.setString(paramIndex++, "%" + location + "%");
                }
                
                ps.setInt(paramIndex++, studentRank - RANK_RANGE);
                ps.setInt(paramIndex++, studentRank + RANK_RANGE);
                ps.setInt(paramIndex++, studentRank);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        College college = new College();
                        college.setInstituteName(rs.getString("institute_name"));
                        college.setInstType(rs.getString("inst_type"));
                        college.setBranch(rs.getString("branch"));
                        college.setQuota(rs.getString("quota"));
                        college.setAdmissionCategory(rs.getString("admission_category"));
                        college.setDdcetMarksOpen(rs.getDouble("ddcet_marks_open"));
                        college.setDdcetRankOpen(rs.getInt("ddcet_rank_open"));
                        college.setDdcetMarksClose(rs.getDouble("ddcet_marks_close"));
                        college.setDdcetRankClose(rs.getInt("ddcet_rank_close"));
                        eligibleColleges.add(college);
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        request.setAttribute("studentRank", studentRank);
        request.setAttribute("location", location);
        request.setAttribute("collegesList", eligibleColleges);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("results.jsp");
        dispatcher.forward(request, response);
    }
}