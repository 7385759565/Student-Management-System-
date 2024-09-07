<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<title>LogIn</title>
<link rel="stylesheet" type="text/css" href="indexStyle.css">
</head>
<body>
				<%
		try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdata?autoReconnect=true&useSSL=false",
				"root", "root");
		PreparedStatement ps = con.prepareStatement("Select * from student where username =? and password =?");
		ps.setString(1, request.getParameter("t1"));
		ps.setString(2, request.getParameter("t2"));
		
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{	
			out.println("<h1>Welcome "+rs.getString(2)+"</h1>");
			out.println("<h1>Your Details..</h1>");
			out.println("<h1>Student_Id = "+rs.getString(1)+"</h1>");
			out.println("<h1>Student_Name = "+rs.getString(2)+"</h1>");
			out.println("<h1>Student_Email = "+rs.getString(3)+"</h1>");
			out.println("<h1>Student_Username = "+rs.getString(4)+"</h1>");
			out.println("<h1>Student_Password = "+rs.getString(5)+"</h1>");
			%>
			 <a href="index.html">You Can logout Securely!</a>
			<% 		
		}
		else
		{
			 
			out.println("<h1>Your Account Details Not Matched</h1>");
			%>
			<a href ="index.html">Back To Home!</a>
			<% 
		}
		con.close();
	}
	catch(Exception Ex )
		{
		out.println(Ex);
		}
				%>
</body>
</html>