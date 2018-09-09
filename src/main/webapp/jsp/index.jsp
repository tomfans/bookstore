<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<!-- Bootstrap -->
<link href="static/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="static/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="addUser.do" method="post">
		号码： <input type="text" name="id" /> <br /> 姓名： <input type="text"
			name="name" /> <br /> <input type="submit" value="add" />


	</form>

</body>
</html>

