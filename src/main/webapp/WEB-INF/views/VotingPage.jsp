<%@page import="com.jspiders.onlinevotingapp.pojo.VotePOJO"%>
<%@page import="java.util.List"%>
<%@page import="com.jspiders.onlinevotingapp.pojo.CandidatePOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<%
List<CandidatePOJO> candidates = (List<CandidatePOJO>) request.getAttribute("candidates");
%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

#legend {
	width: 300px;
	height: 25px;
	margin: 0 auto;
	padding: 0 auto;
	text-align: center;
	background-color: gray;
	color: black;
	margin-top: 200px;
	border: 1px solid;
}

#fieldset {
	margin-top: 10px;
	width: 450px;
	height: 450px;
	margin: 0 auto;
	flex-flow: column;
	justify-content: space-between;
	align-items: center;
	font-size: 25px;
	border: 1px solid;
}

body {
	flex-flow:column;
	justify-content: center;
	align-items: center;
	background-color: linen;
}

.content {
	width: 250px;
	height: 50px;
	text-align: center;
	font-size: 25px;
}

.input {
	width: 300px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-left: 60px;
}
</style>
</head>
<body>
	<%
	if (candidates != null) {
	%>
	<fieldset id="fieldset">
		<legend id="legend">Voting Page</legend>
		<div style="margin-top: 50px;">
			<form action="./submitVote"
				method="post">
				<table>
					<%
					for (CandidatePOJO candidate : candidates) {
					%>

					<tr>
						<td class="content"><%=candidate.getCandidateName()%></td>
						<td class="content"><input type="radio"
							style="height: 20px; width: 20px;" name="candidateName"
							value="<%=candidate.getCandidateName()%>"></td>
					</tr>
					<%
					}
					}
					%>
				</table>
				<div class="input">
					<input type="text" name="username" placeholder="Username" required
						style="width: 100%; font-size: 20px; text-align: center;">
				</div>
				<div class="input">
					<input type="submit" value="VOTE"
						style="width: 100px; height: 30px; font-size: 20px;">
				</div>

			</form>
		</div>
		<%
		if (msg != null) {
		%>
		<h3 align="center"><%=msg%></h3>
		<%
		}
		%>
	</fieldset>
</body>
</html>
