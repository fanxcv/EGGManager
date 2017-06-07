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
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style-responsive.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/morris.js-0.4.3/morris.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/clndr.css" rel="stylesheet">
</head>
<body>
	<section id="container">
		<%@ include file="/WEB-INF/view/jsp/header.jsp"%>
		<section id="main-content">
			<section class="wrapper">
				<div class="col-lg-4">
					<section class="panel">
						<div class="twt-feed blue-bg">
							<h1>${logged.username}</h1>
							<p>
								<c:choose>
									<c:when test="${logged.role == '1'}">超级管理</c:when>
									<c:when test="${logged.role == '2'}">普通管理</c:when>
									<c:when test="${logged.role == '3'}">高级代理</c:when>
									<c:when test="${logged.role == '4'}">普通代理</c:when>
									<c:otherwise>普通用户</c:otherwise>
								</c:choose>
								${due_time}到期
							</p>
							<a href="#"> <img
								src="<%=request.getContextPath()%>/img/EGG.jpg" width="112px"
								height="112px">
							</a>
						</div>
						<div class="wid-category twt-category">
							<ul>
								<li>
									<h5>已激活</h5> 激活状态
								</li>
								<li>
									<h5>${logged.money/100}元</h5> 账户余额
								</li>
								<li>
									<h5>
										<c:choose>
											<c:when test="${logged.locked == '0'}">未锁定</c:when>
											<c:when test="${logged.locked == '1'}">已锁定</c:when>
											<c:otherwise>未知</c:otherwise>
										</c:choose>
									</h5> 账号状态
								</li>
							</ul>
						</div>
					</section>
				</div>
				<c:if test="${logged.role != 0}">
					<div class="row state-overview">
						<div class="col-lg-4 col-sm-6">
							<section class="panel">
								<div class="symbol">
									<i class="fa fa-users blue"> </i>
								</div>
								<div class="value">
									<h1 class="count">${all}</h1>
									<p>账号数量</p>
								</div>
							</section>
						</div>
						<div class="col-lg-3 col-sm-6">
							<section class="panel">
								<div class="symbol">
									<i class="fa fa fa-user-md purple"> </i>
								</div>
								<div class="value">
									<h1 class="count4">${daili}</h1>
									<p>代理数量</p>
								</div>
							</section>
						</div>
						<div class="col-lg-4 col-sm-6">
							<section class="panel">
								<div class="symbol">
									<i class="fa fa-money red"> </i>
								</div>
								<div class="value">
									<h1 class="count3">${code}</h1>
									<p>卡密数量</p>
								</div>
							</section>
						</div>
						<div class="col-lg-3 col-sm-6">
							<section class="panel">
								<div class="symbol">
									<i class="fa fa-user yellow"> </i>
								</div>
								<div class="value">
									<h1 class="count2">0</h1>
									<p>这个没用</p>
								</div>
							</section>
						</div>
					</div>
				</c:if>
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading tab-bg-dark-navy-blue">
							<span class="tools pull-right"> <a href="javascript:;"
								class="fa fa-chevron-down"></a> <a href="javascript:;"
								class="fa fa-times"></a>
							</span>
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#home">全网公告</a>
								</li>
								<c:if test="${logged.role <= 2}">
									<li class=""><a data-toggle="tab" href="#about">更新说明</a></li>
								</c:if>
							</ul>
						</header>
						<div class="panel-body">
							<div class="tab-content">
								<div id="home" class="tab-pane active">
									<pre>${indexExplain}</pre>
								</div>
								<c:if test="${logged.role <= 2}">
									<div id="about" class="tab-pane">
										<pre>EGG流量控制EGGProxy适配版v1.0更新说明
1：仅完成部分功能
2：仅适用于EGGProxy和EGGProxy的内核软件使用</pre>
									</div>
								</c:if>
							</div>
						</div>
					</section>
				</div>

				<div class="col-md-12">
					<section class="panel">
						<header class="panel-heading">
							<span class="label label-primary">Wellcome</span> <span
								class="tools pull-right"> <a href="javascript:;"
								class="fa fa-chevron-down"></a> <a href="javascript:;"
								class="fa fa-times"></a>
							</span>
						</header>
						<div class="panel-body">
							<div class="jumbotron text-center">
								<h1>欢迎使用EGG流量管理系统</h1>
							</div>
						</div>
					</section>
				</div>
			</section>
		</section>
		<%@ include file="/WEB-INF/view/jsp/footer.jsp"%>
	</section>
	<!-- BEGIN JS -->
	<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<!-- BASIC JQUERY 1.8.3 LIB. JS -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<!-- BOOTSTRAP JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script>
	<!-- ACCORDIN JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.min.js"></script>
	<!-- SCROLLTO JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js"></script>
	<!-- NICESCROLL JS -->
	<script src="<%=request.getContextPath()%>/js/respond.min.js"></script>
	<!-- RESPOND JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.sparkline.js"></script>
	<!-- SPARKLINE JS -->
	<script src="<%=request.getContextPath()%>/js/sparkline-chart.js"></script>
	<!-- SPARKLINE CHART JS -->
	<script src="<%=request.getContextPath()%>/js/common-scripts.js"></script>
	<!-- BASIC COMMON JS -->
	<script src="<%=request.getContextPath()%>/js/count.js"></script>
	<!-- COUNT JS -->
	<!--Morris-->
	<script src="<%=request.getContextPath()%>/assets/morris.js-0.4.3/morris.min.js"></script>
	<!-- MORRIS JS -->
	<script src="<%=request.getContextPath()%>/assets/morris.js-0.4.3/raphael-min.js"></script>
	<!-- MORRIS  JS -->
	<script src="<%=request.getContextPath()%>/js/chart.js"></script>
	<!-- CHART JS -->
	<!--Calendar-->
	<script src="<%=request.getContextPath()%>/js/calendar/clndr.js"></script>
	<!-- CALENDER JS -->
	<script src="<%=request.getContextPath()%>/js/calendar/evnt.calendar.init.js"></script>
	<!-- CALENDER EVENT JS -->
	<script src="<%=request.getContextPath()%>/js/calendar/moment-2.2.1.js"></script>
	<!-- CALENDER MOMENT JS -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js"></script>
	<!-- UNDERSCORE JS -->
	<script src="<%=request.getContextPath()%>/assets/jquery-knob/js/jquery.knob.js"></script>
	<!-- JQUERY KNOB JS -->
	<script>
		$(".knob").knob();
	</script>
	<!-- END JS -->
</body>
</html>