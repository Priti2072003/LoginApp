 <!DOCTYPE html>
 <html>
 <head>
     <title>Forgot Password</title>
     <style>
         body {
             background-color: #f1f1f1;
             font-family: Arial, sans-serif;
         }
         .container {
             width: 350px;
             margin: 50px auto;
             background: white;
             padding: 25px 30px;
             border-radius: 8px;
             box-shadow: 0 0 10px #aaa;
         }
         input[type="text"], input[type="password"], input[type="email"] {
             width: 100%;
             padding: 10px;
             margin: 8px 0;
             box-sizing: border-box;
         }
         input[type="submit"] {
             width: 100%;
             padding: 10px;
             background-color: #007bff;
             color: white;
             border: none;
             cursor: pointer;
             margin-top: 10px;
         }
         h2 {
             text-align: center;
             margin-bottom: 15px;
         }
     </style>
 </head>
 <body>
 <div class="container">
     <h2>Forgot Password</h2>

     <!-- Form 1: Send OTP -->
     <form action="sendotp.jsp" method="post">
         <label>Email:</label>
         <input type="email" name="email" required>
         <input type="submit" value="Send OTP">
     </form>

     <hr>

     <!-- Form 2: Verify OTP and Reset Password -->
     <form action="reset.jsp" method="post">
         <label>Email:</label>
         <input type="email" name="email" required>

         <label>OTP:</label>
         <input type="text" name="otp" required>

         <label>New Password:</label>
         <input type="password" name="newPassword" required>

         <label>Confirm Password:</label>
         <input type="password" name="confirmPassword" required>

         <input type="submit" value="Reset Password">
     </form>
 </div>
 </body>
 </html>
