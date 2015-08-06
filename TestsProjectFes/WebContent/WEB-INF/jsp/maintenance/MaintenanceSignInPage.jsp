
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*, java.text.*, tel_ran.tests.controller.Maintenance"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
 <head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link
	href='<c:url value="/static/css_folder/user_styles/IndexPage.css"></c:url>'
	rel="stylesheet">
<link
	href='<c:url value="/static/css_folder/style.css"></c:url>'
	rel="stylesheet">
 <link
	href='<c:url value="/static/css_folder/maintenance_styles/MaintenanceHomePage.css"></c:url>'
	rel="stylesheet"> 

<script src="static/js_folder/header&&rightmenu_maintenace.js">
</script>	


<title>Maintenance login</title>
<style type="text/css">
#menuButton{
 display:none; 

}
</style>
</head>
<body>	

<div id="container">

	  <div id="right_side_company">
	<br>
	<div id="menuButton">
		<div id='homepage'>
			<a class='myButton' href='maintenanceadd'>Create new question</a> <br/>
			<a class='myButton' href='update'>Update/Delete Question</a>
			<a class='myButton' href='otherResursCreationMethod'>Adding questions from Other Resourses</a> 			
			<a class='myButton' href='.'>Home</a>
		</div>
	</div>	
	<br>
	<%= Maintenance.AutoGeneratedHTMLForm() %>	<!-- this methods work only for MaintenanceSignInPage !!!  -->
	
	</div>	
	<!--end of right area-->

		<div id="footer_area">

			<p>Copyright &copy; 2014 HrTrueTest</p>
		</div>
	</div>
</body> 
</html>
