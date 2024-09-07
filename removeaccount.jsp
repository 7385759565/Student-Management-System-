<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.Objects"%>
<!DOCTYPE html>
<html>
<head>
<title>Remove Account</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">
</head>
<body>

	<%
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdata?autoReconnect=true&useSSL=false",
			"root", "root");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE Username = ? AND password = ?");
	ps.setString(1, request.getParameter("t1"));
	ps.setString(2, request.getParameter("t2"));
	ResultSet rs = ps.executeQuery();
	
	 if (rs.next()) {
         // Account details matched
         out.println("<h1>Account removed successfully!</h1>");

         // Optional: You can add code here to actually remove the account
        // String deleteSql = "DELETE FROM student WHERE Username = ? AND Pasword = ?";
         PreparedStatement Ps = con.prepareStatement("DELETE FROM student WHERE Username = ? AND Password = ?");
         Ps.setString(1, request.getParameter("t1"));
         Ps.setString(2, request.getParameter("t2"));
         Ps.executeUpdate();
     } 
	 else 
     {
         // Account details did not match
         out.println("<h1>Details not matched. Account removal failed.</h1>");
     }
	 rs.close();
     ps.close();
     con.close();
	}
	
		catch (Exception e) {
	        e.printStackTrace();
	        out.println("<h1 style='color:red;'>An error occurred: " + e.getMessage() + "</h1>");
	    }
	
	%>

	<br>
	<a href="index.html">Back to Home</a>
</body>
</html>
