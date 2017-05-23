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
</head>
<body>
	<section id="container">
		<%@ include file="/WEB-INF/view/jsp/header.jsp"%>
		<section id="main-content">
			<section class="wrapper">
				<div class="jumbotron">
					<h2>分组管理</h2>
					<pre>建个分组，给你的代理归归类吧
到时候你就可以给不同的代理创建不同价格的流量包了</pre>
				</div>
				<c:choose>
					<c:when test="${error != null}">
						<div class="col-sm-12">
								<p class="text-danger text-center" style="font-size: 30px">${error}</p>
						</div>
					</c:when>
					<c:otherwise>
						<table class='table table-striped table-bordered table-hover dataTables-example table-condensed'>
							<thead>
								<tr>
									<th class='text-center' style='width: 50%'>组名</th>
									<th class='text-center' style='width: 50%'>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr>
										<td class='text-center'>
											<button type=button class="btn btn-info">
												${list.name}
											</button>
										</td>
										<td class='text-center'>
											<button type=button class="btn btn-danger" onclick="del(this, ${list.id})">
												<i class="fa fa-trash-o"></i> 删除
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
			</section>
		</section>
		<%@ include file="/WEB-INF/view/jsp/footer.jsp"%>
	</section>

	<script src="<%=request.getContextPath()%>/js/demo/dome.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/assets/advanced-datatable/media/js/jquery.js"></script><!-- BASIC JQUERY JS  -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
	<script src="<%=request.getContextPath()%>/js/respond.min.js" ></script><!-- RESPOND JS  -->
	<script src="<%=request.getContextPath()%>/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
	<script type="text/javascript">
	function del(demo, id) {
		$.post("<%=request.getContextPath()%>/Admin/Group/delGroup", {id : id}, function() {
			$(demo).parent().parent().remove();
		});
	}
	</script>
</body>

</html>