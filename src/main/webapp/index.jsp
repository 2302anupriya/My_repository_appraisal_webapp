<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

    <head>
        <title>Test</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--     <script type="text/javascript">
        function codeAddress() {
        
        	  $.ajax({
		        	type : "GET",
		        	url : "getCycleYearsForAssociate/103",
		            success:function(id){
		            	  var len = response.length;

		            	 $("#associateYearlist").empty();
		                 for( var i = 0; i<len; i++){
		                     //var id = response[i]['id'];
		                     var year = id[i]['year'];
		                     
		                     $("#associateYearlist").append("<option value='"+year+"'>"+year+"</option>");

		              }
		            }
		        });
        }
        window.onload = codeAddress;
        </script>
    </head> -->
    <body>
    </body>
</html>