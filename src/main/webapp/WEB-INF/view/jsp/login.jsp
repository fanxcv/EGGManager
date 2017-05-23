<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Custom Theme">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<title>EGG流量管理系统 - 登录</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style-responsive.css" rel="stylesheet">
</head>
<body class="login-screen">
	<div class="container">
		<form class="form-signin" action="<%=request.getContextPath() %>/LoginCtrl/login.do" method="post">
			<h2 class="form-signin-heading">EGG流量管理登录</h2>
			<div class="login-wrap">
				<div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="用户名" required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="密码" required="required">
                </div>
                <div class="form-group">
                	<p style="color:red">${error}</p>
                </div>
				<button class="btn btn-lg btn-login btn-block" type="submit">
					立即登录</button>
				<p class="text-muted text-center">
					<a href="<%=request.getContextPath() %>/register">注册一个新账号</a>
				</p>
			</div>
		</form>
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</body>
</html>

