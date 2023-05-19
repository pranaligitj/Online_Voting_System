<%@page import="com.jspiders.votingapp.pojo.VotePOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<%
VotePOJO pojo = (VotePOJO) request.getAttribute("pojo");
%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
body{
background-color: linen;
}
#register {
	width: 400px;
	height: 350px;
	margin: 0 auto;
	margin-top: 70px;
	flex-flow: column;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	display: flex;
	display: flex
}

#legend {
	width: 200px;
	height: 20px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 0 auto;
	text-align: center;
	background-color: gray;
	color: black;
	padding: 0 auto;
}
</style>
</head>
<body>
	<div id="register">
		<fieldset
			style="width: 300px; height: 600px; flex-flow: column; justify-content: space-between; align-items: center;">
			<legend id="legend">Register Here</legend>
			<form action="./register" method="post" style="margin-top: 50px">
				<table>
					<tr>
						<td>Id :</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td>Username :</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td>Password :</td>
						<td><input type="text" name="password"></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td>Email Id :</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr style="height: 20px;"></tr>
					<tr>
						<td>Phone No :</td>
						<td><input type="text" name="contact"></td>
					</tr>
					<tr style="height: 30px;"></tr>
					<tr align="center">
						<td align="center"><input type="submit" value="Register"
							style="padding: 5px 10px 5px 10px; text-align: center;"></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
	<%
	if (pojo != null) {
	%>
	<h3 align="center">
		<%=pojo.getUsername()%>
		registered successfully now please login to proceed..!!
	</h3>
	<%
	} else if (msg != null) {
	%>
	<h3 align="center">
		<%=msg%>
	</h3>
	<%
	}
	%>
</body>
</html>