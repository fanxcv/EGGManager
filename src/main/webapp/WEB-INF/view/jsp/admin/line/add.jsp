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
</head>
<body>
	<section id="container">
		<%@ include file="/WEB-INF/view/jsp/header.jsp"%>
		<section id="main-content">
			<section class="wrapper">
				<div class="jumbotron">
					<h2>添加线路</h2>
					<pre>添加步骤：
1：准备好线路文件
2：将可以使用的线路文件内容复制到输入框
3：点击保存即可</pre>
				</div>
				<div class="col-lg-6">
					<section class="panel panel-info">
						<header class="panel-heading">
							<span class="label label-inverse">添加线路</span>
							<span class="tools pull-right">
								<a href="javascript:;" class="fa fa-chevron-down"></a>
								<a href="javascript:;" class="fa fa-times"></a>
							</span>
						</header>
						<div class="panel-body">
							<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/Line/addLine')">
								<input type="hidden" name="cid" value="${logged.id}" />
								<div class="item">
									<div class="form-group text-center">
										<label for="name">线路名称</label>
										<input type="text" class="form-control" name="name" id="name" placeholder="输入线路名称">
									</div>
									<div class="form-group text-center">
										<div><label for="type">线路类型</label></div>
										<select class="form-control m-bot15" id="type" name="type">
											<option value="0">Tiny模式</option>
											<option value="1">FMNS3模式</option>
										</select>
									</div>
									<div class="form-group text-center">
										<div><label for="flag">线路归属</label></div>
										<select class="form-control m-bot15" id="flag" name="flag">
												<option value="1">移动</option>
												<option value="2">联通</option>
												<option value="3">电信</option>
											</select>
									</div>
									<div class="form-group text-center">
										<label for="index">线路排序</label>
										<input type="text" class="form-control" name="index" id="index" placeholder="0-999(值越小越靠前)">
									</div>
									<div class="form-group text-center">
										<label for="value">线路内容</label>
										<textarea class="form-control" name="value" id="value" style="height: 80px;"></textarea>
									</div>
									<div class="form-group text-center">
										<button type="submit" class="btn btn-primary" type="button">保存</button>
										&nbsp;&nbsp;
										<a type="button" class="btn btn-success" href="<%=request.getContextPath()%>/Admin/Line/getLine">进入列表</a>
									</div>
									<div class="form-group text-center backinfo" style='color: red'></div>
								</div>
							</form>
						</div>
					</section>
				</div>
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
</body>
</html>