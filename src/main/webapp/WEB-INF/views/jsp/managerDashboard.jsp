<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tricon.appraisal.vo.Appraisal"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
</head>
<body>
	<header class="header"> <img alt="Logo"
		src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" />
	</header>
	<!--  <form name="fetchDetail" > -->
	<%--    	<%
		ArrayList<Appraisal> applist = (ArrayList<Appraisal>) session
				.getAttribute("appList");
	%> --%>
	<%="Welcome to Personal Details of Manager"%>
	<br></br>
	<form name="dashboardForm" id="dashform"
		action="appraisalDetailController" method="get">
		<table border="1" cellspacing="0">
			<tr>
				<th>Cycle_Year</th>
				<th>AppraisalCycle</th>
				<th>Cycle_Month</th>
				<th>view</th>
			</tr>
			<%--    <%for(int i=0;i<=applist.size()-1;i++){ %> --%>

			        
			<tr>

				<c:forEach items="${appList}" var="applist">
					<tr>
						<td>${applist.appraisalCycle}</td>
						<td>${applist.cyclePeriodFrom}</td>
						<td>${applist.cycleMonth}</td>
						<td><a
							href="<%=request.getContextPath()%>/view?appraisalCycle=${applist.appraisalCycle}&cycleyear=${applist.cyclePeriodFrom}">view</a></td>
					</tr>
				</c:forEach>

				<%--  <td><%= applist.get(i).getCyclePeriodFrom()%></td> 
 <td><%= applist.get(i).getAppraisalCycle()%></td> 
<td><%= applist.get(i).getCycleMonth()%></td> --%>
				<!-- 
<input type="hidden" name="cycleyear" value="applist.get(i).getCyclePeriodFrom()" />
<input type="hidden" name="appraisalCycle" value="applist.get(i).getAppraisalCycle()" /> -->

				<%-- <td><%= applist.get(i).getCategory()%></td> 
<td><%= applist.get(i).getObjectives()%></td> 
<td><%= applist.get(i).getRemark()%></td> 
<td><%= applist.get(i).getWeightage()%></td> 
<td><%= applist.get(i).getTrainingNeeds()%></td> 
<td><%= applist.get(i).getAchievementSelfAsses()%></td> 
<td><%= applist.get(i).getMgrAsses()%></td> 
<td><%= applist.get(i).getMgrComment()%></td> 
<td><%= applist.get(i).getPerformRating()%></td> 
<td><%= applist.get(i).getFinalAsses()%></td> --%>
				<%-- <td>
                    	<a href="<%=request.getContextPath()%>/view?cycleyear=applist.get(i).getCyclePeriodFrom()">View</a>

                    </td> --%>

				        
			</tr>
			    
			<%--   <%}%> --%>
		</table>
		<%-- <div class="col-xs-12 goal-setting-box-wrapper">
           <div class="goal-setting-box">
           <form name="fetchDetail">
            <div class="row no-space">
            <%for(int i=0;i<=applist.size()-1;i++){ %>
            
            <div class="col-xs-1">
            AppraisalType : <%= applist.get(i).getAppraisalType()%>
            </div>
            
              
            <div class="col-xs-1">
               SNo.: <%= applist.get(i).getSno()%>
             </div>
              <div class="col-xs-1">
                Category: <%= applist.get(i).getCategory()%>
              </div>
              <div class="col-xs-1">
                Objectives : <%= applist.get(i).getObjectives()%>
              </div>
              <div class="col-xs-1">
                Remarks by Manager to substantiate or provide reasons for allocation of particular Objectives :<%= applist.get(i).getRemark()%>
              </div>
              <div class="col-xs-1">
                Weightage : <%= applist.get(i).getWeightage()%>
              </div>
              <div class="col-xs-1">
                Training & Development Needs : <%= applist.get(i).getTrainingNeeds()%>
              </div>
              <div class="col-xs-1">
                 Achievement Self Assessment : <%= applist.get(i).getAchievementSelfAsses()%>
              </div>
              <div class="col-xs-1">
                Manager Assessment : <%= applist.get(i).getMgrAsses()%>
              </div>
              <div class="col-xs-1">
                Manager's Comments  : <%= applist.get(i).getMgrComment()%>
              </div>
              <div class="col-xs-1">
                Performance Rating : <%= applist.get(i).getPerformRating()%>
              </div>
              <div class="col-xs-1">
                Final Assessment : <%= applist.get(i).getFinalAsses()%>
              </div>
            
           <%}%>
             </div>
              </form>
             </div>
             </div> --%>

	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>