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
					<h2>充值列表</h2>
					<pre>分批次显示你的充值码
这里仅显示不同批次下的剩余充值码数量</pre>
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
									<th class='text-center' style='width: 25%'>批次</th>
									<th class='text-center' style='width: 25%'>备注</th>
									<th class='text-center' style='width: 25%'>剩余数量</th>
									<th class='text-center' style='width: 25%'>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="list">
									<tr>
										<td class='text-center'>${list.batch}</td>
										<td class='text-center'>${list.remark}</td>
										<td class='text-center'>${list.num}</td>
										<td class='text-center'>
											<button type=button class="btn btn-xs btn-primary" onclick="download(${list.batch})">
												<i class="fa fa-download"></i> 下载
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
	
    <script src="<%=request.getContextPath()%>/js/plugins/sweetalert/sweetalert.min.js"></script>
	<!-- Data Tables -->
    <script src="<%=request.getContextPath()%>/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath()%>/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script type="text/javascript">
    function download(batch) {
		window.location.href = "<%=request.getContextPath()%>/Common/downloadCode/" + batch;
	}
    $(document).ready(function() {
    	$('.dataTables-example').dataTable({
    		iDisplayLength : 15,
    		bLengthChange : false,
    		bSort : false
    	});
    });
    </script>
</body>
</html>
