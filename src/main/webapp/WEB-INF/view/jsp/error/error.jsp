<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>EGG流量管理系统 - 错误</title>

<link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="middle-box text-center animated fadeInDown">
        <h1>Error</h1>
        <h3 class="font-bold">出错咯</h3>

        <div class="error-desc">
        	不知道为什么，反正出错了
            <br/>您可以返回主页看看
            <br/><a href="<%=request.getContextPath()%>/index" class="btn btn-primary m-t">主页</a>
        </div>
    </div>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>

</html>
