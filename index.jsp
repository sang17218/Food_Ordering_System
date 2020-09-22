<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
</head>
<body bgcolor="white" background="C:\Users\Shayamala\Desktop\images\res1.jpg" > 

<h1 align="center" style=font-size:60px> Food Ordering Site</h1>
<br><br><br>
<form action="index.jsp"  method="post" >

<table align="center">
	<tr><td>
	<tr><th style=font-size:30px> User Login</th></tr>
	<tr><td><input type="text" value="" name="user_name" style="font-size:16pt;" ></td></tr>
	<tr><td><input type="password" value="" name="pass" style="font-size:16pt;"></td></tr>
	<tr><td align="center"><input type="submit" value="Login" onclick="fu(this.form)" > </td></tr>	
</table>
<% 
String str1=request.getParameter("user_name");
String str2=request.getParameter("pass");
if(str1!=null && str2!= null)
{
	int flag=0;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","S14@");
		Statement s= c.createStatement();
		//out.println("user="+str1+" and pass= "+str2);
		String sql="select user_name from user where user_name='"+str1+"' and pass='"+str2+"'";
			ResultSet rs= s.executeQuery(sql);
			if(rs.next())
				flag=1;
			
			if(flag==1)
			{
					session.setAttribute("user_name",str1);
					%>
					<jsp:forward page="orderfood.jsp" />
					<%
			}
			else
					out.println("UserName/Password Not Valid");	
		rs.close();
		s.close();
		c.close();
		}catch(Exception e) {  out.println("something is wrong");}
}

 




%>
</form>
</body>
</html>
