<%@ page import="java.sql.*, java.util.Random" %>
 <%
    String email = request.getParameter("email");
    String otp = String.format("%06d", new Random().nextInt(999999));
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con =
 DriverManager.getConnection("jdbc:mysql://localhost:3306/loginapp", "root", "Priti@207");
        PreparedStatement ps = con.prepareStatement("REPLACE INTO otp_table(email, otp) VALUES (?, ?)");
        ps.setString(1, email);
        ps.setString(2, otp);
        ps.executeUpdate();
        // Simulated OTP sending (log it or show it for demo)
        out.println("<h3>OTP Sent to: " + email + "</h3>");
        out.println("<p>Use this OTP: <strong>" + otp + "</strong></p>");
        con.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Failed to send OTP: " + e.getMessage() +
 "</h3>");
    }
 %>