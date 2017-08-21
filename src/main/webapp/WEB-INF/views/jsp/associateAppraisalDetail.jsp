<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tricon.appraisal.vo.Appraisal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Associate Appraisal Detail Page</title>

<%-- <spring:url value="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js" var="jqueryJs" />
<spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" var="jqueryJs" /> --%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script> -->

<link href="<c:url value="/static-content/css/appraisal.css" />"
	rel="stylesheet">
<link href="<c:url value="/static-content/js/appraisal.js" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- importing without spring---starts here -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript" src ="./static-content/js/appraisal.js"></script> -->
<!-- importing without spring --ends here -->
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>

	<!-- <form name="viewDetail"> -->
	<%
		ArrayList<Appraisal> applist = (ArrayList<Appraisal>) session
				.getAttribute("appList");
	%>
	
	  <c:if test="${empty appList}">
    <center>NO DATA FOUND</center>
    </c:if>
    
	<%="Welcome to Appraisal Details of the Associate"%>



	<c:set var="appCycle" value="${appCycle}" scope="request" />


	<%-- block for H1 appraisal cycle --%>

	<c:if test="${appCycle == 'H1'}">

		<!--  loop for popluating the value: starts here -->
		<%
			for (int i = 0; i <= applist.size() - 1; i++) {
		%>


		<div class="main-wrapper">
			<h1 class="text-center page-title">TRICON INFOTECH - EMPLOYEE
				OBJECTIVE SETTING SHEET - Half Yearly/Annual</h1>
			<div class="body-wrapper">
				<div class="row">

					<div class="col-lg-6 col-sm-12 setting-sheet-box">
						<div class="text-center header">Employee</div>
						<div class="row header-row">
							<div class="col-xs-4">Details</div>
							<div class="col-xs-4 text-center">H1</div>
							<div class="col-xs-4 text-center">H2</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Name</div>
							<div class="col-xs-8 text-center no-border">
								<input type="text" value="${emp.empName}"
									placeholder="Employee NAME" class="input-sm" name="ename" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Employee ID</div>
							<div class="col-xs-8 text-center no-border">
								<input type="text" value="${emp.empId}"
									placeholder="Employee Id" class="input-sm" name="eid" readonly />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Designation/ Title</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="<%=applist.get(i).getDesignation()%>"
									placeholder="H1" class="input-sm" name="edesignationh1" />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="H2" class="input-sm"
									name="edesignationh2" readonly />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Project</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="<%=applist.get(i).getCycleProject()%>"
									placeholder="Project H1" class="input-sm" name="eprojecth1" />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="Project H2"
									class="input-sm" name="eprojecth2" readonly />
							</div>
						</div>
						<div class="row date-picker">
							<div class="col-xs-4">Goal setting Period</div>
							<div class="col-xs-4 text-center">
								<div class="pull-left">
									From: <input type="text" name="bday" name="empfromGoal"
										value="<%=applist.get(i).getCyclePeriodFrom()%>">
								</div>
								<div class="pull-right">
									To: <input type="text" name="bday" name="emptoGoal"
										value="<%=applist.get(i).getCyclePeriodTo()%>">
								</div>
							</div>
							<div class="col-xs-4 text-center">
								<div class="pull-left">
									From: <input type="text" name="bday" name="empfromGoal"
										value="" readonly />
								</div>
								<div class="pull-right">
									To: <input type="text" name="bday" name="emptoGoal" value=""
										readonly />
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-sm-12 setting-sheet-box">
						<div class="text-center header">Manager</div>
						<div class="row header-row">
							<div class="col-xs-4">Details</div>
							<div class="col-xs-4 text-center">H1</div>
							<div class="col-xs-4 text-center">H2</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Name</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="${mgr.mgrName}"
									placeholder="ManagerNameH1" class="input-sm" name="mgrnameH1" />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="ManagerName H2"
									class="input-sm" name="mgrnameH2" readonly />
							</div>
							<!--  <div class="col-xs-4">
                Name
              </div>
              <div class="col-xs-8 text-center no-border">
                <input type="text" value="" placeholder="Manager NAME" class="input-sm" name="mgrname" />
              </div> -->
						</div>
						<div class="row">
							<div class="col-xs-4">Manager ID</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="${mgr.mgrId}"
									placeholder="ManagerId H1" class="input-sm" name="mgrIdH1" />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="ManagerId H2"
									class="input-sm" name="mgrIdH2" readonly />
							</div>
						</div>
					</div>


					<div class="col-xs-12 goal-setting-box-wrapper">
						<!-- 	<form name="myform" id="myappraisalForm"
						action="AppraisalController" method="get"
						onsubmit="return validateform()"> -->
						<div class="goal-setting-box" id="goalSettingBox">
							<div class="row no-space">
								<div class="col-xs-1">AppraisalCycle</div>
								<div class="col-xs-1">SNo.</div>
								<div class="col-xs-1">Category</div>
								<div class="col-xs-1">Objectives</div>
								<div class="col-xs-1">Remarks by Manager to substantiate
									or provide reasons for allocation of particular Objectives</div>
								<div class="col-xs-1">Weightage</div>
								<div class="col-xs-1">Training & Development Needs</div>
								<div class="col-xs-1">Achievement Self Assessment</div>
								<div class="col-xs-1">Manager Assessment</div>
								<div class="col-xs-1">Manager's Comments</div>
								<div class="col-xs-1">Performance Rating</div>
								<div class="col-xs-1">Final Assessment</div>
							</div>
							<div class="row no-space">
								<div class="col-xs-12 text-center sub-header"></div>
							</div>

							<div class="row no-space objective-row">
								<div class="col-xs-1">
									<select class="dropdown" id="appcycle" name="appraisalCycle">
										<!-- <option selected="selected">H1</option> -->
										<option value="H1"><%=applist.get(i).getAppraisalCycle()%></option>
										<!--    <option value="H2">H2</option> -->
									</select>
								</div>
								<div class="col-xs-1 text-center">
									<input type="number" value="1" class="" name="sno" readonly />
								</div>
								<div class="col-xs-1">
									<select class="dropdown" id="cat" name="category">
										<!-- 	<option selected="selected">Enabler</option>
										<option value="Enabler">Enabler</option>
										<option value="Enhancer">Enhancer</option> -->
										<option value="Execution"><%=applist.get(i).getCategory()%></option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getObjectives()%>"
										class="input-sm" name="objectives" id="obj" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getRemark()%>"
										class="input-sm" name="remark" readonly />
									<!-- <textarea rows="4" cols="50" name = "remark">
         </textarea> -->

								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getWeightage()%>"
										class="input-sm" name="weightage" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getTrainingNeeds()%>"
										class="input-sm" name="trainingNeeds" readonly />
								</div>

								<!-- making the achievement field as text field -->

								<%-- 	<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="achievement"/> -->
									<select class="dropdown" id="achievement_self_asses"
										name="achievement">
									<!-- 	<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option> -->
										<option value="five"><%=applist.get(i).getAchievementSelfAsses()%></option>
									</select>
								</div> --%>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getAchievementSelfAsses()%>"
										class="input-sm" name="achievementSelfAsses" readonly />
								</div>

								<div class="col-xs-1">
									<input type="text" value="a<%=applist.get(i).getMgrAsses()%>"
										class="input-sm" name="mgrAsses" readonly />
								</div>
								<!-- <div class="col-xs-1">
									<select class="dropdown" id="mgr_asses" name="mgrasses">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select>
								</div> -->
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getMgrComment()%>"
										class="input-sm" name="mgrComment" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getPerformRating()%>"
										class="input-sm" name="performRating" readonly />
									<!-- <select class="dropdown" id="perform_rating"
										name="performancerating">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select> -->
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getFinalAsses()%>"
										class="input-sm" name="finalAsses" readonly />
									<!-- <select class="dropdown" id="final_asses" name="finalasses">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select> -->
								</div>
							</div>







						</div>


					</div>
				</div>
			</div>
		</div>
		 <%
			}
		%>
	</c:if>


	<%-- block for H2 appraisal cycle --%>


	<c:if test="${appCycle == 'H2'}">

		<!--  loop for popluating the value: starts here -->
		<%
			for (int i = 0; i <= applist.size() - 1; i++) {
		%>

		<div class="main-wrapper">
			<h1 class="text-center page-title">TRICON INFOTECH - EMPLOYEE
				OBJECTIVE SETTING SHEET - Half Yearly/Annual</h1>
			<div class="body-wrapper">
				<div class="row">

					<div class="col-lg-6 col-sm-12 setting-sheet-box">
						<div class="text-center header">Employee</div>
						<div class="row header-row">
							<div class="col-xs-4">Details</div>
							<div class="col-xs-4 text-center">H1</div>
							<div class="col-xs-4 text-center">H2</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Name</div>
							<div class="col-xs-8 text-center no-border">
								<input type="text" value="${emp.empName}"
									placeholder="Employee NAME" class="input-sm" name="ename" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Employee ID</div>
							<div class="col-xs-8 text-center no-border">
								<input type="text" value="${emp.empId}"
									placeholder="Employee Id" class="input-sm" name="eid" readonly />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Designation/ Title</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="H1" class="input-sm"
									name="edesignationh1" readonly />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="<%=applist.get(i).getDesignation()%>"
									placeholder="H2" class="input-sm" name="edesignationh2" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Project</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="Project H1"
									class="input-sm" name="eprojecth1" readonly />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="<%=applist.get(i).getCycleProject()%>"
									placeholder="Project H2" class="input-sm" name="eprojecth2" />
							</div>
						</div>
						<div class="row date-picker">
							<div class="col-xs-4">Goal setting Period</div>
							<div class="col-xs-4 text-center">
								<div class="pull-left">
									From: <input type="text" name="bday" name="empfromGoal"
										value="" readonly />
								</div>
								<div class="pull-right">
									To: <input type="text" name="bday" name="emptoGoal" value=""
										readonly />
								</div>
							</div>
							<div class="col-xs-4 text-center">
								<div class="pull-left">
									From: <input type="text" name="bday" name="empfromGoal"
										value="<%=applist.get(i).getCyclePeriodFrom()%>">
								</div>
								<div class="pull-right">
									To: <input type="text" name="bday" name="emptoGoal"
										value="<%=applist.get(i).getCyclePeriodTo()%>">
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-sm-12 setting-sheet-box">
						<div class="text-center header">Manager</div>
						<div class="row header-row">
							<div class="col-xs-4">Details</div>
							<div class="col-xs-4 text-center">H1</div>
							<div class="col-xs-4 text-center">H2</div>
						</div>
						<div class="row">
							<div class="col-xs-4">Name</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="ManagerNameH1"
									class="input-sm" name="mgrnameH1" readonly />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="${mgr.mgrName}"
									placeholder="ManagerName H2" class="input-sm" name="mgrnameH2" />
							</div>
							<!--  <div class="col-xs-4">
                Name
              </div>
              <div class="col-xs-8 text-center no-border">
                <input type="text" value="" placeholder="Manager NAME" class="input-sm" name="mgrname" />
              </div> -->
						</div>
						<div class="row">
							<div class="col-xs-4">Manager ID</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="" placeholder="ManagerId H1"
									class="input-sm" name="mgrIdH1" readonly />
							</div>
							<div class="col-xs-4 text-center">
								<input type="text" value="${mgr.mgrId}"
									placeholder="ManagerId H2" class="input-sm" name="mgrIdH2" />
							</div>
						</div>
					</div>


					<div class="col-xs-12 goal-setting-box-wrapper">
						<!-- 	<form name="myform" id="myappraisalForm"
						action="AppraisalController" method="get"
						onsubmit="return validateform()"> -->
						<div class="goal-setting-box" id="goalSettingBox">
							<div class="row no-space">
								<div class="col-xs-1">AppraisalCycle</div>
								<div class="col-xs-1">SNo.</div>
								<div class="col-xs-1">Category</div>
								<div class="col-xs-1">Objectives</div>
								<div class="col-xs-1">Remarks by Manager to substantiate
									or provide reasons for allocation of particular Objectives</div>
								<div class="col-xs-1">Weightage</div>
								<div class="col-xs-1">Training & Development Needs</div>
								<div class="col-xs-1">Achievement Self Assessment</div>
								<div class="col-xs-1">Manager Assessment</div>
								<div class="col-xs-1">Manager's Comments</div>
								<div class="col-xs-1">Performance Rating</div>
								<div class="col-xs-1">Final Assessment</div>
							</div>
							<div class="row no-space">
								<div class="col-xs-12 text-center sub-header"></div>
							</div>

							<div class="row no-space objective-row">
								<div class="col-xs-1">
									<select class="dropdown" id="appcycle" name="appraisalCycle">
										<!-- <option selected="selected">H1</option> -->
										<option value="H1"><%=applist.get(i).getAppraisalCycle()%></option>
										<!--    <option value="H2">H2</option> -->
									</select>
								</div>
								<div class="col-xs-1 text-center">
									<input type="number" value="1" class="" name="sno" readonly />
								</div>
								<div class="col-xs-1">
									<select class="dropdown" id="cat" name="category">
										<!-- 	<option selected="selected">Enabler</option>
										<option value="Enabler">Enabler</option>
										<option value="Enhancer">Enhancer</option> -->
										<option value="Execution"><%=applist.get(i).getCategory()%></option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getObjectives()%>"
										class="input-sm" name="objectives" id="obj" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getRemark()%>"
										class="input-sm" name="remark" readonly />
									<!-- <textarea rows="4" cols="50" name = "remark">
         </textarea> -->

								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getWeightage()%>"
										class="input-sm" name="weightage" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getTrainingNeeds()%>"
										class="input-sm" name="trainingNeeds" readonly />
								</div>

								<!-- making the achievement field as text field -->

								<%-- 	<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="achievement"/> -->
									<select class="dropdown" id="achievement_self_asses"
										name="achievement">
									<!-- 	<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option> -->
										<option value="five"><%=applist.get(i).getAchievementSelfAsses()%></option>
									</select>
								</div> --%>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getAchievementSelfAsses()%>"
										class="input-sm" name="achievementSelfAsses" readonly />
								</div>

								<div class="col-xs-1">
									<input type="text" value="a<%=applist.get(i).getMgrAsses()%>"
										class="input-sm" name="mgrAsses" readonly />
								</div>
								<!-- <div class="col-xs-1">
									<select class="dropdown" id="mgr_asses" name="mgrasses">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select>
								</div> -->
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getMgrComment()%>"
										class="input-sm" name="mgrComment" readonly />
								</div>
								<div class="col-xs-1">
									<input type="text"
										value="<%=applist.get(i).getPerformRating()%>"
										class="input-sm" name="performRating" readonly />
									<!-- <select class="dropdown" id="perform_rating"
										name="performancerating">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select> -->
								</div>
								<div class="col-xs-1">
									<input type="text" value="<%=applist.get(i).getFinalAsses()%>"
										class="input-sm" name="finalAsses" readonly />
									<!-- <select class="dropdown" id="final_asses" name="finalasses">
										<option selected="selected">1</option>
										<option value="one">1</option>
										<option value="two">2</option>
										<option value="three">3</option>
										<option value="four">4</option>
										<option value="five">5</option>
									</select> -->
								</div>
							</div>







						</div>


					</div>
				</div>
			</div>
		</div>
	 <%}%>



	</c:if>

	<jsp:include page="footer.jsp" />

</body>
</html>