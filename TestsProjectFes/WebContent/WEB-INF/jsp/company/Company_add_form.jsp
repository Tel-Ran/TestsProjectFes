<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/TestsProjectFes/static_js/js/CompanyJS/add_company.js"></script>
<link href="static/css_folder/company_styles/add_company.css" rel="stylesheet">

<link
	href='<c:url value="/static/css_folder/user_styles/IndexPage.css"></c:url>'
	rel="stylesheet">
<link
	href='<c:url value="/static/css_folder/style.css"></c:url>'
	rel="stylesheet">
<title>Company Adding</title>


</head>
<body>
		<div id="conatiner">
	 	<div id ="header">
	 		<div id="logo">
	 			
	 		</div>
	 		<div id="search_area">
	 			<input id="text_Area" type="text" placeholder="Search.."/>
	 			<input id="button" type="button" value="search"/>
	 		</div>
	 		
	 	</div>
	 	<div id="nav_area">
	 			<ul>
	 				<li><a href=".">Home</li></a>
	 				<li><a href="login">User Login</li></a>
	 				<li><a href="CompanyActions">Company Login</li></a>
	 				<li><a href=".">FAQ</li></a>
	 				<li><a href=".">Contact Us</li></a>
	 			</ul>
	 	</div><!--end nav area-->

	 	<div id="left_side">
        
        
	 		<div id="testexamples">
               <div>
	 			<h2>Test Examples</h2>
              </div>
	 			<ul>
                
	 				<li><a href=".">JAVA</li></a><hr>
	 				<li><a href=".">C++</li></a><hr>
	 				<li><a href=".">C#</li></a><hr>
	 				<li><a href=".">Android</li></a><hr>
	 				<li><a href=".">Javascript</li></a><hr>
                    <li><a href=".">HTML&CSS</li></a><hr>
                    <li><a href=".">Other Tests</li></a>
	 			</ul>
 		  </div><!--end test examles-->

 	  </div><!--end left_side area-->


 	  <div id="right_side">

	 		<div id="formDiv">
               <h2>Company Registration</h2>
               <form name="registration" action="add_processing">
		<table >
			<tr>
				<td class="td_left">Company Name</td>
				<td class="td_right"><input type="text" name="C_Name"
					id="login_id" size="40" onkeypress="CountLogin('login_id')"
				onfocus="CountLogin('login_id')" onkeyup="CountLogin('login_id')"
				value="" />
				<div class="mini">
					Input: <span id="login_view">0</span>
				</div></td>
			<td class="td_info"><div id="login_correct">Minimum 5 simbols </div></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="td_left">Specialization</td>
			<td class="td_right"><select name="C_Specialization">
					<option value="Education">Education</option>
					<option value="Software development">Software development</option>
					<option value="Telecommunication">Telecommunication</option>
					<option value="Other">Other</option>
			</select></td>
			<td class="td_info"></td>
		</tr>
		<tr>
			<td class="td_left">WEB-SITE</td>

			<td class="td_right"><input type="text" name="C_Site"
				id="login_id" size="40" /></td>
			<td class="td_info"></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="td_left">Amount Employees :</td>
			<td class="td_right"><select id="myselect"
				name="C_AmountEmployes">
					<option value="up to 10">up to 10</option>
					<option value="10-50">10-50</option>
					<option value="50-100">50-100</option>
					<option value="100-500">100-500</option>
					<option value="500-1000">500-1000</option>
					<option value="more 1000">more 1000</option>
			</select></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="td_left">Password</td>
			<td class="td_right"><input type="password" name="C_Password"
				id="pass_id" maxlength="20" size="40"
				onkeypress="CountPass('pass_id')" onfocus="CountPass('pass_id')"
				onkeyup="CountPass('pass_id')" value="" />
				<div class="mini">
					Input: <span id="pass_view">0</span>
				</div></td>
			<td class="td_info"><div id="pass_correct">Password must
					be between 4 and 20 characters</div></td>
					<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="td_left">RePassword</td>
			<td class="td_right"><input type="password" name="repass"
				size="40" id="repass_id" onkeypress="CorrectPass('repass_id')"
				onfocus="CorrectPass('repass_id')"
				onkeyup="CorrectPass('repass_id')" value="" /></td>

			<td class="td_info"><div id="repass_correct"></div></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td class="td_button" colspan="4"><input type="submit"
				name="submit" id="submit_id" value="Registration" disabled />
				<div id="check_correct"></div></td>
		</tr>
	</table>
	<input type="hidden" name="check_login" id="check_login" value="0" />
	<input type="hidden" name="check_pass" id="check_pass" value="0" /> <input
		type="hidden" name="check_repass" id="check_repass" value="0" />
			<input type="hidden" name="check_all" id="check_all" value="0" />
	</form>
             
            </div>
			<div id="additional_area"> </div>
				 		
 	  </div><!--end of right area-->
 	


 	<div id="footer_area">
	
 	<p> Copyright &copy; 2014 HrTrueTest</p>
	</div>
</div>
</body>
</html>