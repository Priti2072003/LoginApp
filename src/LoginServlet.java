import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Step 1: Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Connect to MySQL database
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/loginapp",  // DB name: loginapp
                    "root",                                  // DB user
                    "Priti@207"                            // DB password
            );

            // Step 3: Prepare SQL query
            String sql = "SELECT username FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            // Step 4: Execute query
            ResultSet rs = stmt.executeQuery();

            // Step 5: Handle result
            if (rs.next()) {
                String username = rs.getString("username");
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("email", email);

                response.sendRedirect("home.jsp");
            } else {
                out.println("<h3 style='color:red;'>Invalid Email or Password</h3>");
                out.println("<a href='login.html'>Try Again</a>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
 }
    }
}
