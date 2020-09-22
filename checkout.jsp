<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order food</title>
</head>
<body bgcolor="#CC9966">
<h1 align="center">  confirm order </h1>
<table width = "50%" border = "1" align = "center">
            <tr bgcolor = "#949494">
               <th>Item</th>
               <th>Price</th>
            </tr>
            <%
            
         //   java.util.Hashtable lis=new java.util.Hashtable();
       
               int total=0;
               Enumeration paramNames = request.getParameterNames();
               while(paramNames.hasMoreElements()) 
               {
                  String paramName = (String)paramNames.nextElement();
                  out.print("<tr><td align='center'>" + paramName + "</td>");
                  
                  String paramValue = request.getParameter(paramName);
                  out.println("<td align='center'> " + paramValue + "</td>");
                
                  total+=Integer.parseInt(paramValue); 
               }
               session.setAttribute("tot",total);
            %>
         </table>
         <h3 align="center">  Amount :<%= total %></h3>

<%
int wallet;
try{
	String user_nam=session.getAttribute("user_name").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection c= DriverManager.getConnection("jdbc:mysql://localhost:3306/food_order","root","Sangeepl14@");
	Statement s= c.createStatement();
     String res=session.getAttribute("res").toString();
	String sql="select wallet from user where user_name='"+user_nam+"'";
	ResultSet rs= s.executeQuery(sql);
		if(rs.next())
		{	
		wallet=Integer.parseInt(rs.getString(1)) ;
		session.setAttribute("wal",wallet);
        if(wallet<total)
        {   
        	out.println("<h3 align='center'>Wallet Amount Insufficient , try removing cart items</h3>"); 

        			out.write("<center><form action='restaurant.jsp' method='post'><input type='hidden' name='res' value="+res+"><input type='submit' value='change cart'></input></form></center>");
      }
        else
        {   
        	out.write("<center><form action='payment.jsp' method='post'><input type='submit' value='proceed to pay'></input></form></center>");
        }
        
         }
	rs.close();
	s.close();
	c.close(); 
	}
catch(Exception e) {  out.println("something is wrong");}


  %>
<!--  <script language="javascript">
var start = 1;
var options = "";
for(var y = start ; y <=5; y++){
  options += "<option>"+ y +"</option>";
}
//document.getElementById('1').innerHTML=options;
var qt=document.getElementsByClassName("qty");
for(var j=0;j<qt.length;j++)
	{
	qt[j].innerHTML=options;
	}

</script>-->
</body>
</html>