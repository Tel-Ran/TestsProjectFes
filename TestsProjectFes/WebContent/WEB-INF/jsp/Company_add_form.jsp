<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="/CSS/reg.css" />
<script src="/JS/cPassword.js" type="text/javascript"></script>

<style type="text/css">
table {
	width: 600px;
	margin-top: 10px;
	margin-bottom: 10px;
}

table td {
	padding: 8px;
}

.td_left {
	width: 150px;
	vertical-align: top;
}

.td_right {
	
}

.td_info {
	width: 150px;
	color: #666;
	font-size: 10px;
	vertical-align: top;
}

.td_button {
	border-top: 1px solid #e8e8e8;
}

.mini {
	color: #666;
	font-size: 10px;
}

.correct {
	color: green;
	font-size: 10px;
}

.acorrect {
	color: red;
	font-size: 10px;
}
</style>
<script type="text/javascript">
	function CountLogin(item) {
		var item_view = 'login_view';
		var item_correct = 'login_correct';
		document.getElementById(item_view).innerHTML = document
				.getElementById(item).value.length++;
		if (document.getElementById(item).value.length >= 5) {
			document.getElementById(item_correct).innerHTML = 'OK';
			document.getElementById(item_correct).className = 'correct';
			document.getElementById('check_login').value = 1;
		} else {
			document.getElementById(item_correct).innerHTML = 'Minimum 5 characters';
			document.getElementById(item_correct).className = '';
			document.getElementById('check_login').value = 0;
		}
		checkAll();
	}

	function CountPass(item) {
		var item_view = 'pass_view';
		var item_correct = 'pass_correct';
		var item_login_value = document.getElementById('login_id').value;
		var item_login_length = document.getElementById('login_id').value.length;
		document.getElementById(item_view).innerHTML = document
				.getElementById(item).value.length++;
		if (document.getElementById(item).value == item_login_value
				&& item_login_length >= 5) {
			document.getElementById(item_correct).innerHTML = 'acorrect';
			document.getElementById(item_correct).className = 'acorrect';
			document.getElementById('check_pass').value = 0;
		} else {
			if (document.getElementById(item).value.length >= 4) {
				document.getElementById(item_correct).innerHTML = 'OK';
				document.getElementById(item_correct).className = 'correct';
				document.getElementById('check_pass').value = 1;
			} else if (document.getElementById(item).value.length < 4) {
				document.getElementById(item_correct).innerHTML = 'Password must be between 4 and 20 characters';
				document.getElementById(item_correct).className = '';
				document.getElementById('check_pass').value = 0;
			}
		}
		checkAll();
	}

	function CorrectPass(item) {
		var item_pass_value = document.getElementById('pass_id').value;
		var item_pass_length = document.getElementById('pass_id').value.length
		var item_correct = 'repass_correct';
		if (item_pass_length >= 4) {
			if (document.getElementById(item).value == item_pass_value) {
				document.getElementById(item_correct).innerHTML = 'correct';
				document.getElementById(item_correct).className = 'correct';
				document.getElementById('check_repass').value = 1;
			} else if (document.getElementById(item).value.length >= 4) {
				document.getElementById(item_correct).innerHTML = 'acorrect';
				document.getElementById(item_correct).className = 'acorrect';
				document.getElementById('check_repass').value = 0;
			}
		}
		checkAll();
	}
	
	function checkAll() {
		var x;
		var check_login = document.getElementById('check_login').value;
		var check_pass = document.getElementById('check_pass').value;
		var check_repass = document.getElementById('check_repass').value;
		/* var check_email = document.getElementById('check_email').value; */
		x = check_login + check_pass + check_repass/*  + check_email */;
		document.getElementById('check_all').value = x;
		if (document.getElementById('check_all').value == 111) {
			document.getElementById('submit_id').disabled = false;
		} else {
			document.getElementById('submit_id').disabled = true;
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<form name="registration" action="add_processing">
		<table>
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
			</tr>
			<tr>
				<td class="td_left">RePassword</td>
				<td class="td_right"><input type="password" name="repass"
					size="40" id="repass_id" onkeypress="CorrectPass('repass_id')"
					onfocus="CorrectPass('repass_id')"
					onkeyup="CorrectPass('repass_id')" value="" /></td>

				<td class="td_info"><div id="repass_correct"></div></td>
			</tr>
			<tr>
				<td class="td_button" colspan="3"><input type="submit"
					name="submit" id="submit_id" value="Registration" disabled />
					<div id="check_correct"></div></td>
			</tr>
		</table>
		<input type="hidden" name="check_login" id="check_login" value="0" />
		<input type="hidden" name="check_pass" id="check_pass" value="0" /> <input
			type="hidden" name="check_repass" id="check_repass" value="0" />
		<!--  <input	type="hidden" name="check_email" id="check_email" value="0" /> -->
		<input type="hidden" name="check_all" id="check_all" value="0" />
	</form>
	<br>
	<a href=".">Home</a>
</body>
</html>