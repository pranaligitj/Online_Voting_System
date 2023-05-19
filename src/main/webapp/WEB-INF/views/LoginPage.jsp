<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:include page="NavBar.jsp"/>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style type="text/css">
body{
background-color: linen;
}
#login {
	margin-top: 10px;
	width:500px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	font-size: 25px;
	display: flex;
	border: none;
	border: 1px solid;
}

#legend {
	width: 500px;
	height: 30px;
	margin: 0 auto;
	padding: 0 auto;
	text-align: center;
	background-color: gray;
	color: black;
	margin-top: 200px;
}

#form {
	display: flex;
	justify-content: center;
	width: 700px;
	height: 200px;
	border: none;
	margin-top: 30px;
}
</style>
</head>
<body>
<div style="height: 50px;"></div>
	<%
	if (msg != null) {
	%>
	<h3 align="center">
		<%=msg%>
		<%
		}
		%>
	</h3>
	<fieldset id="login">
		<legend id="legend">Login to proceed</legend>
		<form action="./login" method="post" id="form">
			<table>
				<tr>
					<td>Username :</td>
					<td><input type="text" name="username"
						style="height: 25px; width: 400px;"></td>
				</tr>
				<tr>
					<td>Password :</td>
					<td><input type="password" name="password"
						style="height: 25px; width: 400px;"></td>
				</tr>
				<tr align="center">
					<td align="center"><input type="submit" value="Login"
						style="padding: 10px 20px 10px 20px;"></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>