<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tricon.appraisal.vo.Appraisal"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%-- <link href="<%=request.getContextPath()%>/static-content/css/appraisal.css"
	rel="stylesheet"> --%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>

	<form name="associatedashboardForm" id="dashform"
		action="appraisalDetailController" method="get">

		<div class="row space-top-bottom">
			<div class="col-xs-6 text-right">Select The Associate id :</div>
			<div class="col-xs-6 text-left">
				<select name="associateId" id="assId" onchange="doPrintYearList()">
					<option>select id</option>
					<c:forEach var="associateId" items="${associateEmpList}">
						<option><c:out value="${associateId}" /></option>
					</c:forEach>

				</select>
			</div>
		</div>
		<div class="row space-top-bottom">
			<div class="col-xs-6 text-right">Select The Associate Appraisal
				Cycle Type:</div>
			<div class="col-xs-6 text-left">
				<select class="dropdown" id="appcycle" name="appraisalCycle">
					<option selected="selected">--</option>
					<option value="H1">H1</option>
					<option value="H2">H2</option>
				</select>
			</div>
		</div>
		<div class="row space-top-bottom">
			<div class="col-xs-6 text-right">Select The Associate Appraisal
				Cycle Year:</div>
			<div class="col-xs-6 text-left">
				<select name="cycleyear" id="associateYearlist">
				</select>
			</div>
		</div>
		
		<!-- new requirement -->
		<a
			href="<%=request.getContextPath()%>/view?appraisalCycle=${applist.appraisalCycle}&cycleyear=${applist.cyclePeriodFrom}">view</a>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>