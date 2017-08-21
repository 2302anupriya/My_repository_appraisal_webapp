<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tricon.appraisal.vo.Appraisal"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equivdesigna="Content-Type"
	content="text/html; charset=ISO-8859-1">
<title>Appraisal Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="./static-content/js/appraisal.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./static-content/css/appraisal.css"
	type="text/css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>
	<c:set var="appCycle" value="${appCycle}" scope="request" />
	<c:if test="${appCycle == 'H1'}">
	<div class="main-wrapper">
		<h1 class="text-center page-title">TRICON INFOTECH - EMPLOYEE
			OBJECTIVE SETTING SHEET - Half Yearly/Annual</h1>

		<div class="body-wrapper">
				<form name="myform" id="myappraisalForm"
						action="appraisalDetailController" method="post"
						onsubmit="return validateform()">
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
								placeholder="Employee NAME" class="input-sm" name="empName"/>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">Employee ID</div>
						<div class="col-xs-8 text-center no-border">
							<input type="text" value="${emp.empId}" placeholder="Employee Id"
								class="input-sm" name="empId" />
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4">Designation/ Title</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="H1" class="input-sm"
								name="designation" />
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="H2" class="input-sm"
								name="designation1" readonly/>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">Project</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="Project H1"
								class="input-sm" name="cycleProject"/>
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="Project H2"
								class="input-sm" name="cycleProject1" readonly/>
						</div>
					</div>
					<div class="row date-picker">
						<div class="col-xs-4">Goal setting Period</div>
						<div class="col-xs-4 text-center">
							<div class="pull-left">
								From: <input type="date" name="cyclePeriodFrom">
							</div>
							<div class="pull-right">
								To: <input type="date" name="cyclePeriodTo">
							</div>
						</div>
						<div class="col-xs-4 text-center">
							<div class="pull-left">
								From: <input type="date" name="cyclePeriodFrom2" readonly/>
							</div>
							<div class="pull-right">
								To: <input type="date" name="cyclePeriodTo2" readonly/>
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
								placeholder="ManagerNameH1" class="input-sm" name="mgrName" />
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value=""
								placeholder="ManagerName H2" class="input-sm" name="mgrName" readonly />
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
							placeholder="ManagerId H1" class="input-sm"
								name="mgrId" />
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value=""
							placeholder="ManagerId H2" class="input-sm"
								name="mgrId2" readonly />
						</div>
					</div>



					<!-- 
            <div class="row">
              <div class="col-xs-4">
                Designation/ Title
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="H1" class="input-sm" name="mgrDesigH1"/>
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="H2" class="input-sm" name="mgrDesigH2"/>
              </div>
            </div>
             -->
					<!--   <div class="row">
              <div class="col-xs-4">
                Project
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="Project H1" class="input-sm" name="mgrProjectH1"/>
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="Project H2" class="input-sm" name="mgrProjectH2"/>
              </div>
            </div> -->
					<!--   <div class="row date-picker">
              <div class="col-xs-4">
                Goal setting Period
              </div>
              <div class="col-xs-4 text-center">
                From: <input type="date" name="bday" name="mgrfromGoal">
              </div>
              <div class="col-xs-4 text-center">
                To: <input type="date" name="bday" name="mgrtoGoal"/>
              </div>
            </div> -->
				</div>


				<div class="col-xs-12 goal-setting-box-wrapper">
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
										<!-- 	<option selected="selected">H1</option>
										<option value="H1">H1</option> -->
										<option><c:out value="${appCycle}" /></option>
									</select>
								</div>
								<div class="col-xs-1 text-center">
									<input type="number" value="1" class="" name="sno" readonly />
								</div>
								<div class="col-xs-1">
									<select class="dropdown" id="cat" name="category">
										<!-- <option selected="selected">Enabler</option> -->
										<option value="Enabler">Enabler</option>
										<option value="Enhancer">Enhancer</option>
										<option value="Execution">Execution</option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="objectives"
										id="obj" />
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="remark" />
									<!-- <textarea rows="4" cols="50" name = "remark">
         </textarea> -->

								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="weightage" />
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm"
										name="trainingNeeds" />
								</div>
								<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="achievement"/> -->
									<select class="dropdown" id="achievement_self_asses"
										name="achievementSelfAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<!--  <div class="col-xs-1">
                <input type="text" value="" class="input-sm" name ="mgrasses"/>
              </div> -->
								<div class="col-xs-1">
									<select class="dropdown" id="mgr_asses" name="mgrAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="mgrComment" />
								</div>
								<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="performancerating"/> -->
									<select class="dropdown" id="perform_rating"
										name="performRating">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<div class="col-xs-1">
									<!--  <input type="text" value="" class="input-sm" name ="finalasses"/> -->
									<select class="dropdown" id="final_asses" name="finalAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2 from-button">
							<input type="button" id="add_obj" value="AddObjective"
								class="bg-primary no-border" />
						</div>
						<div class="col-xs-2  from-button">
							<input type="submit" name="submitAppraisal" value="submit"
								class="bg-primary no-border" />
						</div>

					<!-- <div class="col-xs-2  from-button">
             <form action ="fetch.jsp">
             <input type="submit" value="fetch" class="bg-primary no-border" />
             </form>
           </div> -->

				</div>
			</div>
			</form>
		</div>
	</div>


	<!-- This is the template created for add objective -->


	<textarea id="objectiveRowTemplate" class="hide">
	<div class="row no-space objective-row">
    <div class="col-xs-1">
    <select class="dropdown" id="appcycle" name="appraisalCycle"> 
    <option selected="selected">H1</option>       
  <option value="H1">H1</option>
   <option value="H2">H2</option>
    </select>
   </div>
      <div class="col-xs-1 text-center">
        <input type="number" value="@@Serial_No@@" class="input-sm"
					name="sno" readonly />
      </div>
    <div class="col-xs-1">
            <select class="dropdown" id="cat" name="category"> 
            <option selected="selected">Enabler</option>       
          <option value="Enabler">Enabler</option>
           <option value="Enhancer">Enhancer</option>
           <option value="Execution">Execution</option>
            </select>
           </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="objectives" />
      </div>
      <div class="col-xs-1">
      <input type="text" value="" class="input-sm" name="remark" />
      </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="weightage" />
      </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm"
					name="trainingNeeds" />
      </div>
      <div class="col-xs-1">
       <!--  <input type="text" value="" class="input-sm" name ="achievement"/> -->
       <select class="dropdown" id="achievement_self_asses"
					name="achievementSelfAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
      <!-- <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name ="mgrasses"/>
      </div> -->
            <div class="col-xs-1">
            <select class="dropdown" id="mgr_asses" name="mgrAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
           </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="mgrComment" />
      </div>
      <div class="col-xs-1">
        <!-- <input type="text" value="" class="input-sm" name ="performancerating"/> -->
          <select class="dropdown" id="rating_perform"
					name="performRating"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
      <div class="col-xs-1">
        <!-- <input type="text" value="" class="input-sm" name ="finalasses"/> -->
             <select class="dropdown" id="final_asses" name="finalAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
    </div>
</textarea>
</c:if>
<!-- 
//this is the insert for for cycle =H2 -->

	<c:if test="${appCycle == 'H2'}">

	<div class="main-wrapper">
		<h1 class="text-center page-title">TRICON INFOTECH - EMPLOYEE
			OBJECTIVE SETTING SHEET - Half Yearly/Annual</h1>

		<div class="body-wrapper">
								<form name="myform" id="myappraisalForm"
						action="appraisalDetailController" method="post"
						onsubmit="return validateform()">
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
								placeholder="Employee NAME" class="input-sm" name="empName" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">Employee ID</div>
						<div class="col-xs-8 text-center no-border">
							<input type="text" value="${emp.empId}" placeholder="Employee Id"
								class="input-sm" name="empId" />
						</div>
					</div>

					<div class="row">
						<div class="col-xs-4">Designation/ Title</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="H1" class="input-sm"
								name="designation3" readonly/>
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="H2" class="input-sm"
								name="designation" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-4">Project</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="Project H1"
								class="input-sm" name="cycleProject2" readonly/>
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="" placeholder="Project H2"
								class="input-sm" name="cycleProject" />
						</div>
					</div>
					<div class="row date-picker">
						<div class="col-xs-4">Goal setting Period</div>
						<div class="col-xs-4 text-center">
							<div class="pull-left">
								From: <input type="date" name="cyclePeriodFrom4" readonly/>
							</div>
							<div class="pull-right">
								To: <input type="date" name="cyclePeriodTo4" readonly/>
							</div>
						</div>
						<div class="col-xs-4 text-center">
							<div class="pull-left">
								From: <input type="date" name="cyclePeriodFrom">
							</div>
							<div class="pull-right">
								To: <input type="date" name="cyclePeriodTo">
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
							<input type="text" value=""
								placeholder="ManagerNameH1" class="input-sm" name="mgrName" readonly/>
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="${mgr.mgrName}"
								placeholder="ManagerName H2" class="input-sm" name="mgrName" />
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
							<input type="text" value=""
							placeholder="ManagerId H1" class="input-sm"
								name="mgrId1" readonly/>
						</div>
						<div class="col-xs-4 text-center">
							<input type="text" value="${mgr.mgrId}"
							placeholder="ManagerId H2" class="input-sm"
								name="mgrId" />
						</div>
					</div>



					<!-- 
            <div class="row">
              <div class="col-xs-4">
                Designation/ Title
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="H1" class="input-sm" name="mgrDesigH1"/>
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="H2" class="input-sm" name="mgrDesigH2"/>
              </div>
            </div>
             -->
					<!--   <div class="row">
              <div class="col-xs-4">
                Project
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="Project H1" class="input-sm" name="mgrProjectH1"/>
              </div>
              <div class="col-xs-4 text-center">
                <input type="text" value="" placeholder="Project H2" class="input-sm" name="mgrProjectH2"/>
              </div>
            </div> -->
					<!--   <div class="row date-picker">
              <div class="col-xs-4">
                Goal setting Period
              </div>
              <div class="col-xs-4 text-center">
                From: <input type="date" name="bday" name="mgrfromGoal">
              </div>
              <div class="col-xs-4 text-center">
                To: <input type="date" name="bday" name="mgrtoGoal"/>
              </div>
            </div> -->
				</div>


				<div class="col-xs-12 goal-setting-box-wrapper">

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
										<!-- 	<option selected="selected">H1</option>
										<option value="H1">H1</option> -->
										<option><c:out value="${appCycle}" /></option>
									</select>
								</div>
								<div class="col-xs-1 text-center">
									<input type="number" value="1" class="" name="sno" readonly />
								</div>
								<div class="col-xs-1">
									<select class="dropdown" id="cat" name="category">
										<!-- <option selected="selected">Enabler</option> -->
										<option value="Enabler">Enabler</option>
										<option value="Enhancer">Enhancer</option>
										<option value="Execution">Execution</option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="objectives"
										id="obj" />
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="remark" />
									<!-- <textarea rows="4" cols="50" name = "remark">
         </textarea> -->

								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="weightage" />
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm"
										name="trainingNeeds" />
								</div>
								<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="achievement"/> -->
									<select class="dropdown" id="achievement_self_asses"
										name="achievementSelfAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<!--  <div class="col-xs-1">
                <input type="text" value="" class="input-sm" name ="mgrasses"/>
              </div> -->
								<div class="col-xs-1">
									<select class="dropdown" id="mgr_asses" name="mgrAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<div class="col-xs-1">
									<input type="text" value="" class="input-sm" name="mgrComment" />
								</div>
								<div class="col-xs-1">
									<!-- <input type="text" value="" class="input-sm" name ="performancerating"/> -->
									<select class="dropdown" id="perform_rating"
										name="performRating">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<div class="col-xs-1">
									<!--  <input type="text" value="" class="input-sm" name ="finalasses"/> -->
									<select class="dropdown" id="final_asses" name="finalAsses">
										<option selected="selected">1</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
							</div>
						</div>
						<div class="col-xs-2 from-button">
							<input type="button" id="add_obj" value="AddObjective"
								class="bg-primary no-border" />
						</div>
						<div class="col-xs-2  from-button">
							<input type="submit" name="submitAppraisal" value="submit"
								class="bg-primary no-border" />
						</div>


					<!-- <div class="col-xs-2  from-button">
             <form action ="fetch.jsp">
             <input type="submit" value="fetch" class="bg-primary no-border" />
             </form>
           </div> -->

				</div>
			</div>
			
					</form>
			
		</div>
	</div>


	<!-- This is the template created for add objective -->


	<textarea id="objectiveRowTemplate" class="hide">
	<div class="row no-space objective-row">
    <div class="col-xs-1">
    <select class="dropdown" id="appcycle" name="appraisalCycle"> 
    <option selected="selected">H1</option>       
  <option value="H1">H1</option>
   <option value="H2">H2</option>
    </select>
   </div>
      <div class="col-xs-1 text-center">
        <input type="number" value="@@Serial_No@@" class="input-sm"
					name="sno" readonly />
      </div>
    <div class="col-xs-1">
            <select class="dropdown" id="cat" name="category"> 
            <option selected="selected">Enabler</option>       
          <option value="Enabler">Enabler</option>
           <option value="Enhancer">Enhancer</option>
           <option value="Execution">Execution</option>
            </select>
           </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="objectives" />
      </div>
      <div class="col-xs-1">
      <input type="text" value="" class="input-sm" name="remark" />
      </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="weightage" />
      </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm"
					name="trainingNeeds" />
      </div>
      <div class="col-xs-1">
       <!--  <input type="text" value="" class="input-sm" name ="achievement"/> -->
       <select class="dropdown" id="achievement_self_asses"
					name="achievementSelfAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
      <!-- <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name ="mgrasses"/>
      </div> -->
            <div class="col-xs-1">
            <select class="dropdown" id="mgr_asses" name="mgrAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
           </div>
      <div class="col-xs-1">
        <input type="text" value="" class="input-sm" name="mgrComment" />
      </div>
      <div class="col-xs-1">
        <!-- <input type="text" value="" class="input-sm" name ="performancerating"/> -->
          <select class="dropdown" id="rating_perform"
					name="performRating"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
      <div class="col-xs-1">
        <!-- <input type="text" value="" class="input-sm" name ="finalasses"/> -->
             <select class="dropdown" id="final_asses" name="finalAsses"> 
            <option selected="selected">1</option>       
          <option value="one">1</option>
           <option value="two">2</option>
           <option value="three">3</option>
            <option value="four">4</option>
             <option value="five">5</option>
            </select>
      </div>
    </div>
</textarea>
</c:if>

	<jsp:include page="footer.jsp" />
</body>
</html>