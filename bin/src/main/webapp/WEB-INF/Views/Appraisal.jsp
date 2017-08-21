<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src ="../../static-content/js/appraisal.js"></script>
<link rel="stylesheet" href ="../../static-content/css/appraisal.css"  type="text/css">
<title>Appraisal Page</title>
</head>
<body>

<div class="EmpMgr">
<table width="600" class="Emp">
  <tr bgcolor="#000000">
    <th colspan="3"><font color="white">Employee</font></th>
  </tr>
  <tr bgcolor="#e6e6ff">
    <th class="left-align">Details</th>
    <th class="center-align">H1</th>
	<th class="center-align">H2</th>
  </tr>
  <tr>
    <td class="white">Name</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Employee Id</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td class="white">Designation/Title</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Project</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Goal Setting Period</td>
	<td class="center-align"></td>
	<td class="center-align"></td>
  </tr>
</table>

<table width="600" class="Mgr">
  <tr bgcolor="#000000">
    <th colspan="3"><font color="white">Manager</font></th>
  </tr>
  <tr bgcolor="#e6e6ff">
    <th class="left-align">Details</th>
    <th class="center-align">H1</th>
	<th class="center-align">H2</th>
  </tr>
  <tr>
    <td class="white">Name</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Employee Id</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td class="white">Designation/Title</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Project</td>
	<td></td>
	<td></td>
  </tr>
  <tr>
    <td class="white">Goal Setting Period</td>
	<td class="center-align"></td>
	<td class="center-align"></td>
  </tr>
</table>
</div>


<div class ="mainTable">
<font color='white'>
<table cellspacing="10" id ="myTable">
  <col width="230">
  <tr bgcolor="#6666ff">
    <th>AppraisalType.</th>
    <th width="5%">Sno.</th>
    <th>Category</th>
    <th>Objectives</th>
    <th width ="15%">Remarks by Manager to substantiate or provide reasons for allocation of particular Objectives </th>
    <th>Weightage</th>
    <th>Training & Development Needs</th>
    <th>Achievement Self Assessment</th>
    <th>Manager Assessment</th>
    <th>Manager's Comments</th>
    <th>Performance Rating </th>
    <th>Final Assessment</th>
  </tr>
 </font>
 </col>
  <tr bgcolor="#000000">
  <td align="center"  colspan="12"> H1 </td>
  </tr>
  <tr bgcolor="#e6e6ff">
  <td id ="appraisaltype">
       <select class="dropdown"> 
       <option selected="selected">H1</option>       
       <option value="H1">H1</option>
       <option value="H2">H2</option>
    </select>
    </td>
    <td id ="sno" cellspacing="15" align = "center"><input type="text"size="20" height="26px"/><font color="black"></font></td>
    <td id ="cat">
        <select class="dropdown"> 
       <option selected="selected">Category</option>       
        <option value="Enable">Enable</option>
        <option value="Enhance">Enhance</option>
    </select>
    </td>
    <td id ="obj"><input type="text"size="20" height="26px"/></td>
    <td id ="rem"><input type="text"size="20" height="26px"/></td>
    <td id ="weightage"><input type="text"size="20" height="26px"/></td>
    <td id ="training"><input type="text"size="20" height="26px"/></td>
    <td id ="achievement"><input type="text"size="20" height="26px"/></td>
    <td id ="mgrasses"><input type="text"size="20" height="26px"/></td>
    <td id ="mgrcomment"><input type="text"size="20" height="26px"/></td>
    <td id ="performancerating"><input type="text"size="20" height="26px"/></td>
    <td id ="finalasses"><input type="text"size="20" height="26px"/></td>
  </tr>
</table>
</div>
<button onclick="myFunction()">Add Objective</button>


</body>
</html>