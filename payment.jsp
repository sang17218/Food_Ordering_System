<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order food</title>
</head>
<body bgcolor="#CC9966">

<%
Integer wallet=Integer.parseInt(session.getAttribute("wal").toString());
Integer total= Integer.parseInt(session.getAttribute("tot").toString());
String rem=Integer.toString(wallet-total);
%>
<h1 align="center"> You'll have your order delivered soon</h1>
<h2 align="center"> ordered food with total amount Rs. <%= total%> : successful </h2>
<%
try{ 
	Integer n=10000 + new Random().nextInt(90000);
	String id=n.toString();
	session.setAttribute("id",id);
	
	
	String user_nam=session.getAttribute("user_name").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","S14@");
	Statement stat= c.createStatement();
	String sql1="select contact from user where user_name='"+user_nam+"'";
	ResultSet r= stat.executeQuery(sql1);
	if(r.next())
	{
	session.setAttribute("email",r.getString(1));
	out.write("<center><form action='sendMail.jsp' method='post'><input type='submit' value='click to get email confirmation'></input></form></center>");
	}
	
	String sql="update user set wallet='"+rem+"' where user_name='"+user_nam+"'";	
	Statement s= c.prepareStatement(sql);
	int rs= s.executeUpdate(sql);
	if(rs==1)
	{
		out.write("<h3 align='center'>you current balance is "+rem+"</h3>");
		
	}	
	
	s.close();
	c.close(); 
	}
catch(Exception e) {  out.println("something is wrong");}


%>
</body>
</html>
