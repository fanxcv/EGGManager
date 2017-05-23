<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Olive Enterprise">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<title>EGG流量管理系统</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/data-tables/DT_bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style-responsive.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body>
	<section id="container">
		<%@ include file="/WEB-INF/view/jsp/header.jsp"%>
		<section id="main-content">
        	<section class="wrapper">
				<div class="jumbotron">
					<h2>用户列表</h2>
					<pre>	可以分类浏览你的用户
	通过内建查询快速定位你的用户
	方便的对每个用户进行编辑，删除，下线等</pre>
				</div>
				<div class="col-lg-12">
					<form id="form" action="<%=request.getContextPath()%>/Common/download/user" method=post>
						<section class="panel">
							<header class="panel-heading">
								<span>
									<button type=button class="btn btn-danger" onclick="jssubmit($('#form'), '<%=request.getContextPath()%>/Admin/User/delete/users', 1)">
										<i class="fa fa-trash-o"></i> 删除选中
									</button>
									<button type=submit class="btn btn-info">
										<i class="fa fa-download"></i> 下载选中
									</button>
									<!-- <button type=button class="btn btn-primary" onclick="add('user')">
										<i class="fa fa-plus"></i> 添加用户
									</button> -->
								</span>
								<span class="tools pull-right">
									<a href="javascript:;" class="fa fa-times"></a>
								</span>
							</header>
							<div class="panel-body">
								<p style="color: red">${error}</p>
								<div class="table-responsive">
								</div>
							</div>
						</section>
					</form>
				</div>
			</section>
		</section>
		<%@ include file="/WEB-INF/view/jsp/footer.jsp"%>
	</section>
	<%@ include file="/WEB-INF/view/jsp/admin/user/modal.jsp"%>

	<script src="<%=request.getContextPath()%>/js/demo/dome.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/demo/usermodal.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/assets/advanced-datatable/media/js/jquery.js"></script><!-- BASIC JQUERY JS  -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
	<script src="<%=request.getContextPath()%>/js/respond.min.js" ></script><!-- RESPOND JS  -->
	<script src="<%=request.getContextPath()%>/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
	
    <script src="<%=request.getContextPath()%>/js/plugins/sweetalert/sweetalert.min.js"></script>
	<!-- Data Tables -->
    <script src="<%=request.getContextPath()%>/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script type="text/javascript">
	function userlist() {
		$.post("<%=request.getContextPath()%>/Admin/User/getUser/user", function(data) {
			var context = "<table class='table table-striped table-bordered table-hover dataTables-example table-condensed'>"
						+ "<thead>"
						+ "<tr>"
						+ "<th class='text-center' style='width: 15px'><input type='checkbox' class='i-checks' name='all' onclick='check_all(this,\"ids[]\")' /></th>"
						+ "<th class='text-center'>账号</th>"
						+ "<th class='text-center'>天数</th>"
						+ "<th class='text-center'>激活时间</th>"
						+ "<th class='text-center'>到期时间</th>"
						+ "<th class='text-center'>上次登录</th>"
						+ "<th class='text-center'>备注</th>"
						+ "<th class='text-center' style='width: 120px'>操作</th>"
						+ "</tr>"
						+ "</thead>"
						+ "<tbody>";
			$(data).each(function(i, v) {
				context += "<tr>"
						 + "<td class='text-center'><input type='checkbox' name='ids[]' value='" + v.id + "' /></td>"
						 + "<td class='text-center'><a href='javascript:showPass(\"" + v.password + "\");'>" + v.username + "</a></td>"
						 + "<td class='text-center'>" + ((v.active_time == null) ? '未激活' : v.active_time) + "</td>"
						 + "<td class='text-center'>" + ((v.due_time == null) ? '未激活' : v.due_time) + "</td>"
						 + "<td class='text-center'>" + ((v.lastLoginTime == null) ? '' : v.lastLoginTime) + "</td>"
						 + "<td class='text-center'>" + ((v.remarks == null) ? '' : v.remarks) + "</td>"
						 + "<td class='text-center'>"
						 + "<a href='javascript:edit(\"<%=request.getContextPath()%>/edituser.do?v=getedit\", " + v.id + ");' class='btn btn-xs btn-info'><i class='fa fa-pencil'></i></a>"
						 + "&nbsp;&nbsp;"
						 + "<a href='javascript:;' data-id='" + v.id + "' class='btn btn-xs btn-danger' onclick='deluser(this, \"<%=request.getContextPath()%>\")'><i class='fa fa-trash-o'></i></a>"
						 + "</td>"
						 + "</tr>";
			});
			context += "</tbody>"
		 		 	+ "</table>";
			$('.table-responsive').empty();
			$('.table-responsive').append(context);
			$('.dataTables-example').dataTable({
		    	"bLengthChange" : false,
		    	"iDisplayLength" : 15,
		    	"bSort" : false
		    });
		}, "json");
	}

	function download(file) {
		window.location.href = "<%=request.getContextPath()%>/download.do?v=file&file=" + file;
	}
	</script>
	<script>
		$(document).ready(function() {
			userlist();
			$(".modal").on("hide.bs.modal", function() {
				var text = $(".backinfo").text();
				$("#btn .btn-info").remove();
				$(".backinfo").text("");
				if (text.indexOf("成功增加") > 0 || text.indexOf("改成功") > 0) {
					userlist($("li.active a").attr("data-flag"));
				}
			});
			$('a[data-toggle="tab"]').click(function() {
				userlist($(this).attr("data-flag"));
			});
		});
	</script>
</body>

</html>
