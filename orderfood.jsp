<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order food</title>
</head>
<body bgcolor="#CC9966">
<h1 align="center">welcome  <%= session.getAttribute("user_name")%> , You can select restaurants now</h1>
<form action="restaurant.jsp" method="post">
<div style="display: flex;justify-content:center;">
<select name="res" style="font-size:20pt;" >
<%
//String user_name=session.getAttribute("user_name").toString();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","S14@");
		Statement s= c.createStatement();

		String sql="select name from restaurant";
			ResultSet rs= s.executeQuery(sql);
			while(rs.next())
			{	
				out.write("<option >"+rs.getString(1) +"</option>");
	       
		 }
		rs.close();
		s.close();
		c.close();
		}
	catch(Exception e) {  out.println("something is wrong");}


  %>
</select>
<input type="submit" value="select restaurant" >
</div>
</form>

<marquee bgcolor="66CCFF"   style="position: relative;" behavior="scroll"  direction="up" scrollamount="8" scrolldelay="4" onmouseover="this.stop()" onmouseout="this.start()"width="250" height="200"><br>

	<img src="C:\Users\Shayamala\Desktop\images\res.jpg" width=250 height=250  title="ad  " style="position: relative;" border="0"><br>
	<img src="C:\Users\Shayamala\Desktop\images\res1.jpg" width=250 height=250  title="ad  " style="position: relative;" border="0"><br>
  <img src="C:\Users\Shayamala\Desktop\images\res3.jpg" width=250 height=250  title="ad  " style="position: relative;" border="0"><br>
  <img src="C:\Users\Shayamala\Desktop\images\res4.jpg" width=250 height=250  title="ad  " style="position: relative;" border="0"><br>
	</marquee> 
</body>
</html>
