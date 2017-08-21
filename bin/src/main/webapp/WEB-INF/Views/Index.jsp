<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appraisal Page</title>
<script type="text/javascript" src ="../../static-content/js/appraisal.js"></script>
<link rel="stylesheet" href ="../../static-content/css/appraisal.css"  type="text/css">
</head>

<body bgcolor="#E6E6FA">
<H1 align="center"><br>Appraisal Form</br></H1>

<div class ="select" align="center">

<form name="appraisalSelect">
    <select name="menu" onChange = "changeFunction()">
        <option selected="selected">Appraisal Cycle</option>
        <option value="Views/appraisal.html">H1</option>
        <option value="Views/appraisal.html">H2</option>
    </select>
</form>
</div>
</body>
</html>