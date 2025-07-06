<%@ page import="java.sql.*" %>
 <%
    String email = request.getParameter("email");
    String otp = request.getParameter("otp");
    String newPass = request.getParameter("newPassword");
    String confirmPass = request.getParameter("confirmPassword");
    if (!newPass.equals(confirmPass)) {
        out.println("<h3 style='color:red;'>Passwords do not match.</h3>");
        return;
    }
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con =
 DriverManager.getConnection("jdbc:mysql://localhost:3306/loginapp", "root", "Priti@207");
        PreparedStatement check = con.prepareStatement("SELECT * FROM otp_table WHERE email=? AND otp=?");
        check.setString(1, email);
        check.setString(2, otp);
        ResultSet rs = check.executeQuery();
        if (rs.next()) {
            PreparedStatement update = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
            update.setString(1, newPass);
            update.setString(2, email);
            int done = update.executeUpdate();
            if (done > 0) {
 out.println("<h3 style='color:green;'>Password reset successfully!</h3>");

            } else  {

                out.println("<h3 style='color:red;'>Error updating password.</h3>");
            }
        } else {
            out.println("<h3 style='color:red;'>Invalid OTP or email.</h3>");
        }
        con.close();
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    }
 %>