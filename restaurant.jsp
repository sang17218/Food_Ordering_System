<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>food items</title>
</head>
<body bgcolor="#CC9966">
<h1 align="center">
<%
String st=request.getParameter("res").toString();
session.setAttribute("res",st);
out.println(st);
%></h1>
<form action="checkout.jsp" method="post">
<div align="center">
<table width = "50%" border = "1" >
<tr bgcolor="grey"><th>item </th><th>price </th></tr>
<%
//String user_name=session.getAttribute("user_name").toString();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","Sangeepl14@");
		Statement s= c.createStatement();

		String sql="select item,price from "+st;
			ResultSet rs= s.executeQuery(sql);
			while(rs.next())
			{	
out.write("<tr><td align='center'>"+rs.getString(1)+"</td><td align='center'>"+rs.getString(2)+"<input type='checkbox' name="+rs.getString(1)+" value="+rs.getString(2)+" >"+"</input></td></tr>");
	   }
		rs.close();
		s.close();
		c.close();
		}
	catch(Exception e) {  out.println("something is wrong");}


  %>
</table>
<br>
<input type="submit" value="proceed to checkout" />
</div>
</form>
</body>
</html>