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
<link href="<%=request.getContextPath()%>/css/style-responsive.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/customer/common.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>
<body>
	<section id="container">
		<%@ include file="/WEB-INF/view/jsp/header.jsp"%>
		<section id="main-content">
        	<section class="wrapper">
				<div class="jumbotron">
					<h2>代理列表</h2>
					<pre>这里包含你的所有的代理账号
你可以在这里对他们进行管理与操作</pre>
				</div>
				<div class="col-lg-12">
					<form id="form" action="" method=post>
						<section class="panel">
							<header class="panel-heading">
								<span>
									<button type=button class="btn btn-primary" onclick="add('agent')">
										<i class="fa fa-plus"></i> 添加代理
									</button>
									<c:if test="${logged.role == '1'}">
										<button type=button class="btn btn-primary" onclick="add('admin')">
											<i class="fa fa-plus"></i> 添加管理
										</button>
									</c:if>
								</span>
								<span class="tools pull-right">
									<a href="javascript:;" class="fa fa-chevron-down"></a>
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
	function agentlist() {
		$.post("<%=request.getContextPath()%>/Admin/User/getUser/agent", function(data) {
			var context = "<table class='table table-striped table-bordered table-hover dataTables-example table-condensed'>"
				+ "<thead>"
				+ "<tr>"
				+ "<th class='text-center' style='width: 15px'><input type='checkbox' class='i-checks' name='all' onclick='check_all(this,\"ids[]\")' /></th>"
				+ "<th class='text-center'>账号</th>"
				+ "<th class='text-center'>备注</th>"
				+ "<th class='text-center'>余额</th>"
				+ "<th class='text-center'>状态</th>"
				+ "<th class='text-center'>分组</th>"
				+ "<th class='text-center'>Key</th>"
				+ "<th class='text-center' style='width: 30px'>操作</th>"
				+ "</tr>"
				+ "</thead>"
				+ "<tbody>";
			$(data).each(function(i, v) {
				context += "<tr>"
						 + "<td class='text-center'><input type='checkbox' name='ids[]' value='" + v.id + "' /></td>"
						 + "<td class='text-center'><a href='javascript:showPass(\"" + v.password + "\");'>" + v.username + "</a></td>"
						 + "<td class='text-center'>" + ((v.remarks == null) ? '' : v.remarks) + "</td>"
						 + "<td class='text-center'>" + (v.money/100) + "元</td>"
						 + "<td class='text-center'>" + ((v.locked == '1') ? '锁定' : '正常') + "</td>"
						 + "<td class='text-center'>" + v.name + "</td>"
						 + "<td class='text-center'><a href='javascript:showPass(\"" + ((v.key == null) ? '未查询到key值' : v.key) + "\");'>点击查看</a></td>"
						 + "<td class='text-center'>"
						 + "<a href='javascript:edit(\"<%=request.getContextPath()%>/Admin/User/editUser/get\", " + v.id + ");' class='btn btn-xs btn-info'><i class='fa fa-pencil'></i></a>"
						 + "</td>"
						 + "</tr>";
			});
			context += "</tbody>"
	 		 	+ "</table>";
			$('.table-responsive').empty();
			$('.table-responsive').append(context);
			$('.dataTables-example').dataTable({
	    		iDisplayLength : 15,
	    		bLengthChange : false,
	    		bSort : false
	    	});
		}, "json");
	}
	</script>
	<script>
		$(document).ready(function() {
			agentlist();
			$.post("<%=request.getContextPath()%>/Admin/Group/getGroupJson", function(data) {
				if (data) {
					var context = "";
					$(data).each(function(i, v) {
						context += '<option value="'+ v.id + '">'+ v.name +'</option>';
					});
					$('#group').append(context);
					$('#groups').append(context);
				}
			}, "json");
			$(".modal").on("hide.bs.modal", function() {
				var text = $(".backinfo").text();
				$("#btn .btn-info").remove();
				$(".backinfo").text("");
				if (text.indexOf("加成功") > 0 || text.indexOf("改成功") > 0) {
					agentlist();
				}
			});
		});
	</script>
</body>

</html>
