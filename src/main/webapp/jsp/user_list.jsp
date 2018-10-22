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
<script src="static/jquery/jquery-3.3.1.min.js"></script>
<!-- Bootstrap -->
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
<!--弹出模态框 -->
	$(function() {

		to_page(1);

	});

	function to_page(pn) {
		$.ajax({
			url : "http://localhost:8080/bookstore/user_list.do",
			data : "pn=" + pn,
			type : "GET",
			success : function(result) {
				build_user_list(result);

				build_pageinfo(result);

				build_pagesplit(result)
				//console.log(result);
			}
		});
	}

	function build_user_list(result) {
		$("#tablebody").empty();
		var userlist = result.extend.Pageinfo.list;
		$.each(userlist, function(index, item) {
			var id = $("<td></td>").append(item.id);
			var name = $("<td></td>").append(item.name);
			var dept = $("<td></td>").append(item.dept);
			var editbtn = $("<button></button>").append($("<span></span>"))
					.append("编辑");
			var changebtn = $("<button></button>").append($("<span></span>"))
					.append("删除");
			var btn = $("<td></td>").append(editbtn).append(" ").append(
					changebtn)
			$("<tr></tr>").append(id).append(name).append(dept).append(btn)
					.appendTo("#tablebody");
		});
	}

	function build_pageinfo(result) {
		$("#pageinfo").empty();

		$("#pageinfo").append("<span></span>").append(
				"当前为第" + result.extend.Pageinfo.pageNum + "页,总页数:"
						+ result.extend.Pageinfo.pages + ",总记录数:"
						+ result.extend.Pageinfo.total);

	}

	function build_pagesplit(result) {
		$("#pagenav").empty();
		var ul = $("<ul></ul>").addClass("pagination");
		var firstpage = $("<li></li>").append(
				$("<a></a>").append("首页"));
		var prepage = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if (result.extend.Pageinfo.hasPreviousPage == false) {
			firstpage.addClass("disabled");
			prepage.addClass("disabled");
		} else {
			firstpage.click(function() {
				to_page(1);
			})

			prepage.click(function() {
				to_page(result.extend.Pageinfo.pageNum - 1);
			})
		}



		var nextpage = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastpage = $("<li></li>").append(
				$("<a></a>").append("末页"));


		
		if (result.extend.Pageinfo.hasNextPage == false) {
			nextpage.addClass("disabled");
			lastpage.addClass("disabled");
		} else {
			lastpage.click(function() {
				to_page(result.extend.Pageinfo.pages);
			})

			nextpage.click(function() {
				to_page(result.extend.Pageinfo.pageNum + 1);
			})
		}

		ul.append(firstpage).append(prepage);
		$.each(result.extend.Pageinfo.navigatepageNums, function(index, item) {
			var numli = $("<li></li>").append($("<a></a>").append(item));

			if (result.extend.Pageinfo.pageNum == item) {
				numli.addClass("active");
			}
			numli.click(function() {
				to_page(item);
			})

			ul.append(numli);
		});

		ul.append(nextpage).append(lastpage).appendTo("#pagenav");

	}

	/* 	function getDepts() {
	 $.ajax({
	 url : "http://localhost:8080/bookstore/dept.do",
	 type : "GET",
	 success : function(result) {

	 $("#dept_option").empty;
	 //	[{"dept":"运维部门"},{"dept":"测试部门"},{"dept":"开发部门"}]
	 //	console.log(result);

	 $.each(result, function() {
	 var optionEL = $("<option></option>").append(this.dept);
	 optionEL.appendTo("#dept_option");
	 });

	 }
	 });
	 } */
</script>

</head>
<body>




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
						class="btn btn-primary btn-sm" value="增加" id="user_add_model_btn" />
				</form>

			</div>
		</div>

		<br>

		<div class="row">
			<div class="col-md-12">

				<table class="table table-hover" id="userlist_table">
					<thead>
						<tr>
							<th>号码</th>
							<th>姓名</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="tablebody">

					</tbody>

					<%-- <c:forEach items="${pageInfo.list }" var="user1">
						<tr>
							<td>${user1.id }</td>
							<td>${user1.name}</td>
							<td>${user1.dept}</td>
							<td><a href="user_update.do?id=${user1.id }">修改</a> <a
								href="user_delete.do?id=${user1.id }">删除</a></td>
						</tr>
					</c:forEach> --%>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<nav aria-label="Page navigation">
				<ul class="pagination" id="pageinfo">

				</ul>
				</nav>
			</div>

		</div>

		<div class="row">
			<div class="col-xs-6 col-sm-4 col-sm-offset-9">
				<nav aria-label="Page navigation" id="pagenav"> <%-- 	<ul class="pagination" id="pagesplit">

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

				</ul> --%> </nav>
			</div>

		</div>

	</div>
</body>
</html>