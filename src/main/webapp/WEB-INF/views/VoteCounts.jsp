<%@page import="java.util.List"%>
<%@page import="com.jspiders.onlinevotingapp.pojo.CandidatePOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<CandidatePOJO> candidates = (List<CandidatePOJO>) request.getAttribute("candidates");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
#vote {
	width: 550px;
	height: 400px;
	margin: 0 auto;
	margin-top: 50px;
	flex-flow: column;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	display: flex;
	display: flex
}

#legend {
	width: 200px;
	height: 25px;
	margin: 0 auto;
	margin-top: 100px;
	padding: 0 auto;
	text-align: center;
	background-color: gray;
	color: black;
	padding: 0 auto;
	font-size: 25px;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: linen;
}

.content {
	width: 250px;
	height: 50px;
	border: 1px solid;
	text-align: center;
	font-size: 25px;
}
</style>
</head>
<body>
	<div id="vote">
		<fieldset style="width:400px; height:600px;">
			<legend id="legend">Vote Counts</legend>
			<form style="margin-top: 50px" action="./voteCounts" method="get">
				<table>
					<thead>
						<tr>
							<th class="content">Candidate Names</th>
							<th class="content">Vote Counts</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (CandidatePOJO candidate : candidates) {
						%>
						<tr>
							<td class="content"><%=candidate.getCandidateName()%></td>
							<td class="content"><%=candidate.getVoteCount()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</form>
		</fieldset>
	</div>

</body>
</html>