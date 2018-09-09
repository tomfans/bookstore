<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/jquery/jquery-3.3.1.min.js"></script>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 	<form action="user_list.do" method="post"> -->

	<!-- 		姓名: <input type="text" name="name" /> <input type="submit" -->
	<!-- 			class="btn btn-primary btn-sm" value="查询" /> <input type="button" -->
	<!-- 			class="btn btn-primary btn-sm" value="增加" -->
	<%-- 			onclick="javascript:window.location='<%=basePath%>jsp/index.jsp'" /> --%>

	<!-- 	</form> -->



	<div class="container">

		<div class="row">
			<div class="col-md-8">
				<h1>SSM CRUD</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-md-8">
				<form action="user_list.do" method="post">
					姓名: <input type="text" name="name" /> <input type="submit"
						class="btn btn-primary btn-sm" value="查询" /> <input type="button"
						class="btn btn-primary btn-sm" value="增加"
						onclick="javascript:window.location='<%=basePath%>jsp/index.jsp'" />
				</form>
			</div>
		</div>

		<br>

		<div class="row">
			<div class="col-md-12">

				<table class="table table-hover">
					<tr>
						<th>号码</th>
						<th>姓名</th>
						<th></th>
					</tr>

					<c:forEach items="${pageInfo.list }" var="user1">
						<tr>
							<td>${user1.id }</td>
							<td>${user1.name}</td>
							<td><a href="user_update.do?id=${user1.id }">修改</a> <a
								href="user_delete.do?id=${user1.id }">删除</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>

		<div class="row">
			<div class="col-xs-6 col-sm-4 col-sm-offset-9">
				<nav aria-label="Page navigation">
				<ul class="pagination">

					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="user_list.do?pn=${pageInfo.pageNum - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>


					<c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">

						<c:if test="${pageNum == pageInfo.pageNum }">
							<li class="active"><a href="user_list.do?pn=${pageNum }">${pageNum }</a></li>
						</c:if>

						<c:if test="${pageNum != pageInfo.pageNum }">
							<li><a href="user_list.do?pn=${pageNum }">${pageNum }</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="user_list.do?pn=${pageInfo.pageNum + 1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>

				</ul>
				</nav>
			</div>

		</div>

	</div>
</body>
</html>