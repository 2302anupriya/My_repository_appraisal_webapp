<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>successful Insertion</title>
<link rel="stylesheet" href="./static-content/css/appraisal.css"
	type="text/css">
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>
	<div class="success">
		<H1>Data has been submitted successfully</H1>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>