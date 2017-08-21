<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accessdenied Page</title>
<%-- <link href="<c:url value="/static-content/css/appraisal.css" />"
       rel="stylesheet">
<link href="<c:url value="/static-content/js/appraisal.js" />"
       rel="stylesheet">
<link rel="stylesheet"
       href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./static-content/css/appraisal.css"
	type="text/css">
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>

	<div class="loginform text-center">

		<H1>Please login:</H1>

		<form name="loginform" action="loginController" method="post">
			<div class="text-center">

				<div class="row container">
					<div class="col-xs-5 text-right">
						<b>UserId: </b>
					</div>
					<div class="col-xs-7 text-left">
						<input type="text" placeholder="Enter UserId" name="uid" required>
					</div>
				</div>
				<div class="row container">
					<div class="col-xs-5 text-right">
						<b>Password:</b>
					</div>
					<div class="col-xs-7 text-left">
						<input type="password" placeholder="Enter Password" name="pwd"
							required>
					</div>
				</div>
				<div class>
					<button class="bg-primary login-button" type="submit">Login</button>
				</div>
				<div class="accessDenied">
					<h4>
						<br>Please enter a valid Username and Password
					</h4>
				</div>
			</div>
		</form>


	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>