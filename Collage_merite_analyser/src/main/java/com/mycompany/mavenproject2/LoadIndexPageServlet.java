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

// This servlet will now be our homepage
@WebServlet("/home")
public class LoadIndexPageServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/college_admission";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<String> locations = new ArrayList<>();
        
        // This SQL query is smart. It splits the 'institute_name' at the comma,
        // takes the last part (the city), trims whitespace, and gets only unique values.
        String sql = "SELECT DISTINCT TRIM(SUBSTRING_INDEX(institute_name, ',', -1)) AS location FROM colleges ORDER BY location ASC";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                
                while (rs.next()) {
                    locations.add(rs.getString("location"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        
        // Send the list of locations to the JSP page
        request.setAttribute("locationsList", locations);
        
        // Forward to the JSP to display the form
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}