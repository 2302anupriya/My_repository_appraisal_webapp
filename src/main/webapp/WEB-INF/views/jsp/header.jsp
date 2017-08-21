<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <script>

    $(".nav").on("click", "li", function(){
    	$('.nav li').emptyClass('active');  // Clear any existing active <li>'s
    	    $(this).addClass('active');
    })

</script>
<%
HttpSession sessions = request.getSession(false);
String user = (String) sessions.getAttribute("userName");
//String ent = sessions.getAttribute("userRoleList").toString();
%>

<c:if test="${true == sessionScope.userallowed}">
<ul>
    <li><a href="servletName">MyfirstSubmenu</a></li>
    <li><a href="servletName1">MyfirstSubmenu1</a></li>
</ul>
</c:if> --%>

	<header class="clearfix header"> <img alt="Logo"
			  src="<%=request.getContextPath()%>/static-content/images/tricon-logo-01.jpg" class="pull-left" />
			  <div class="pull-right user-name" style=" color: #fff; font-size: 18px; font-weight: bold;">Welcome: <%=request.getSession().getAttribute("username")%></div>
	<%-- 	      <ul class="nav navbar-nav header-menu">
             
             <sec:authorize  access="hasAccess('User Management')">    
              <li><a id="usermanagementactive" href="<%=request.getContextPath()%>/userManagement">User Management</a></li>   
             </sec:authorize>
             
              <sec:authorize  access="hasAccess('Project Management')">  
              <li><a id="projectmgmtactive" href="<%=request.getContextPath()%>/project.htm">Project Management</a></li>
              </sec:authorize>
              <li><a id="task" href="<%=request.getContextPath()%>/task.htm">Task Management</a></li>
              <li><a id="logoutactive" href="<%=request.getContextPath()%>/logout">Sign out</a></li>
               <li class="pull-right"><a  id="logoutactive" href="<%=request.getContextPath()%>/logout" style=" color: #fff">Sign out</a></li>
               <li><a id="logoutactive" href='<c:url value="/j_spring_security_logout"/>'>Sign out</a></li>
            </ul> --%>
		</header>