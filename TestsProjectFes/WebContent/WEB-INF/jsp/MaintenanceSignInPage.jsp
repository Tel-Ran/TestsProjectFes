<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choice Step</title>
</head>
<style type="text/css">
*{
	text-align: center;
}
a {
	font-size: 1.35em;
	color: blue;
}

a:HOVER {
	color: orange;
}
input:HOVER {
	background-color: yellow;
}
</style>
<body>
<br><a href='http://localhost:8080/TestsProjectFes/'>Home Page</a><br>
<form action="PersonalSignInAction">
user name: <input type="text" name="username" size=50/><br>
password: <input type="password" name="password" size=50/><br>
<input type="submit" value="PUSH">
</form>

<script type="text/javascript">
		document.write("${result}");
	</script>
</body>
</html>