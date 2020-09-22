<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	String result;
	//Recipient's email ID 
	
    String to=(String)session.getAttribute("email");
	
	// Sender's email ID 
	String from = "SAI@gmail.com";
	
	final String username = "";
	final String password = "";
    String s=(String)session.getAttribute("user_name");
    String id=(String)session.getAttribute("id");
    

    String host = "smtp.gmail.com";
    Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", "25");

	//Get the Session object.
	Session mailSession = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username,
							password);
				}
			});

	try {
		// Create a default MimeMessage object.
		Message message = new MimeMessage(mailSession);

		// Set From: header field of the header.
		message.setFrom(new InternetAddress(from));

		// Set To: header field of the header.
		message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to));

		// Set Subject: header field
		message.setSubject("Food Delivery Confirmation");

		// Now set the actual message
		message.setText("Hello,"+s+" this is your confirmation mail for food delivery "
				+ "You can use this as reference id: "+id);

		// Send message
		Transport.send(message);

		System.out.println("Sent message successfully....");
		result = "Sent message successfully....";

	} catch (MessagingException e) {
		//e.printStackTrace();
		result = "Error: unable to send message , enter correct mail address....";

	}
%>
<html>
<head>
<title>Sent Email using JSP</title>
</head>
<body bgcolor="#CC9966">

	<div align="center">
		<h1>Sent Email </h1>
	</div>
	<p align="center">
		<%
			out.println("Result: " + result + "\n");
		%>
	</p>
	<div align="center"><button  onclick= "location.href='index.jsp' ">go back to main page</button></div>
</body>
</html>
