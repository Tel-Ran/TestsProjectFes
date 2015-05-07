<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, java.text.*,tel_ran.tests.controller.Maintenance"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1251">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link
	href='<c:url value="/static/css_folder/maintenance_styles/MaintenanceUpdatePage.css"></c:url>'
	rel="stylesheet"> 
<script type="text/javascript">	
    function test(questionId) {	    	
    	var EDIT_Q = document.getElementsByName("edit_q")[0];
    	var att = document.createAttribute("style");
    	att.value = "display:inline-block";
    	EDIT_Q.setAttributeNode(att);
    	
    	var FORM_C = document.getElementsByName("questionID")[0];
    	var att = document.createAttribute("value");
    	att.value = questionId;
    	FORM_C.setAttributeNode(att);
    	
    	var DELETE_Q = document.getElementsByName("delete_q")[0];
    	var att = document.createAttribute("style");
    	att.value = "display:inline-block";
    	DELETE_Q.setAttributeNode(att);
    	
    	var FORM_B = document.getElementsByName("questionIDdelete")[0];
    	var att = document.createAttribute("value");
    	att.value = questionId;
    	FORM_B.setAttributeNode(att);
      }  
</script>
<title>UPDATE</title>
</head>
<body onload="actionTypeChange()">
	<a class="myButton" href='.'>home</a>&nbsp;<a class="myButton" href='maintenanceadd'>add</a>
	<form name="delete_q" class="displayAction" action='deleteAction' method="post">
		Question N: <input type='text' name='questionIDdelete' size="8">&nbsp;&nbsp;
		<input type="submit" class="myButton" value='Delete ?'>
	</form>
	<form name="edit_q" class="displayAction" action="fillFormForUpdateQuestion" method="post">
		Question N: <input type="text" name="questionID" size="8">&nbsp;&nbsp;
		<input type="submit" class="myButton" value="Edit ?">
	</form>
	<p onclick="test('1')">Update - Change/Delete issues</p>
	<!-- test working java script in this jsp file -->
	<form name="searchCODE" action="search_actions" method="post">
	<select name="category">
	<option value="Java">Select Category For Search</option>
	<%= Maintenance.AutoGeneratedInformationTextHTML() %>	
	</select>	
		<br><br>
		<select name="levelOfDifficulty">
					<option value=1>level Of Difficulty</option>
					<option value=1>level  1</option>
					<option value=2>level  2</option>
					<option value=3>level  3</option>
					<option value=4>level  4</option>
					<option value=5>level  5</option>
					</select>
		 <input	class="myButton" type="submit" value="SEARCH"><br>
	</form>
	<br><br>
	
	<%= Maintenance.AutoGeneratedHTMLForm() %>	
</body>
</html>
