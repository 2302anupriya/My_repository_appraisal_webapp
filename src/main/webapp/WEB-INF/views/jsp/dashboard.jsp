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
<%-- <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>

<link href="<c:url value="/static-content/css/appraisal.css" />"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="./static-content/js/appraisal.js"></script>

<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="./static-content/js/appraisal.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./static-content/css/appraisal.css"
	type="text/css"> -->
</head>
<body class="dashboard">
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>
	<div class="text-center">
		<H1>APPRAISAL DASHBOARD</H1>
	</div>
	<div class="row no-margin dash-board-box">

		<div class="col-md-6 col-sm-12">
			<form name="dashboardForm" id="dashform"
				action="appraisalDetailController" method="post">

				<!-- year list for the employee -->

				<div class="row space-top-bottom">
					<div class="col-xs-6 text-right">Select The Appraisal Cycle
						Year:</div>
					<div class="col-xs-6 text-left">
						<select name="cycleyear" id="cycleYear">
							<!-- <option>select year</option> -->
							<c:forEach var="year" items="${yearsList}">
								<option><c:out value="${year}" /></option>
							</c:forEach>

						</select>
					</div>
				</div>
				<div class="row space-top-bottom">
					<div class="col-xs-6 text-right">Select The Appraisal Cycle
						Type:</div>
					<div class="col-xs-6 text-left">
						<select class="dropdown" id="appcycle" name="appraisalCycle">
							<!-- 	<option selected="selected">--</option> -->
							<option value="H1">H1</option>
							<option value="H2">H2</option>
						</select>
					</div>
				</div>
				<div class="text-center">
					<input type="submit" name="addAppraisal" id="addAppraisal"
						class="button" value="addAppraisal" /> <input type="submit"
						name="viewAppraisal" class="button" value="viewAppraisal"
						id="viewAppraisal" />
				</div>

			</form>
		</div>
		<c:if test="${not empty associateEmpList}">
			<div class="col-md-6 col-sm-12">
				<form name="dashboardForm" id="dashform"
					action="appraisalDetailController" method="post">

					<!-- associate list of a mannager -->

			<%-- 		<c:if test="${not empty associateEmpList}">	 --%>


						<div class="row space-top-bottom">
			  <div class="col-xs-6 text-right">
			    Select The Associate id :
			  </div>
			  <div class="col-xs-6 text-left">
				<select name="associateId" id="assId"
					onchange="doPrintYearList()">
					<option>select id</option>
					<c:forEach var="associateId" items="${associateEmpList}">
						<option><c:out value="${associateId}" /></option>
					</c:forEach>

				</select>
			  </div>
			</div>
							<div class="row space-top-bottom">
			  <div class="col-xs-6 text-right">
			    Select The Associate Appraisal Cycle Type:
			  </div>
			  <div class="col-xs-6 text-left">
			    <select class="dropdown"
					id="appcycle" name="appraisalCycle">
					<!-- <option selected="selected">--</option> -->
					<option value="H1">H1</option>
					<option value="H2">H2</option>
				</select>
			  </div>
			</div>
					<div class="row space-top-bottom">
			  <div class="col-xs-6 text-right">
			    Select The Associate Appraisal Cycle Year:
			  </div>
			  <div class="col-xs-6 text-left">
			    <select name="cycleyear"
				id="associateYearlist">
				</select>
			  </div>
			</div>
			
			<!-- 	<div class="text-center">
						<input type="submit" name="viewAppraisal" class="button"
							value="ViewAppraisal" id="viewAppraisal" />
					</div> -->
					<div class="text-center">
						<input type="submit" name="viewAssAppraisal" class="button"
							value="AssociateAppraisal" id="viewAssAppraisal" />
					</div>
					
					<!-- according to new changes -->

					<!-- <div class="text-center">
						<input type="submit" name="viewPersonalAppraisal" class="button"
							value="PersonalAppraisal" id="viewPersonalAppraisal" />
					</div>
					<div class="text-center">
						<input type="submit" name="viewAssAppraisal" class="button"
							value="AssociateAppraisal" id="viewAssAppraisal" />
					</div> -->

				</form>
			</div>
		</c:if>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>