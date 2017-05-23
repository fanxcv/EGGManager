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
					<h2>系统和App设置</h2>
					<pre>一些常用的设置项</pre>
				</div>
				<div class="col-lg-6">
					<section class="panel panel-info">
						<header class="panel-heading">
							<span class="label label-inverse">基本设置</span>
							<span class="tools pull-right">
								<a href="javascript:;" class="fa fa-chevron-down"></a>
								<a href="javascript:;" class="fa fa-times"></a>
							</span>
						</header>
						<div class="panel-body">
							<form action="" onsubmit="return false" id="setting">
								<div class="item">
									<c:if test="${logged.role == '1'}">
										<div class="form-group text-center">
											<label for="indexExplain">全网公告</label>
											<textarea class="form-control" name="indexExplain" id="indexExplain" style="margin-bottom: 10px;"></textarea>
											<button type="submit" class="btn btn-sm btn-success" onclick="jssubmit($('#setting'), '<%=request.getContextPath()%>/Admin/Setting/indexExplain')">保存</button>
										</div>
									</c:if>
									<div class="form-group text-center">
										<label for="AppExplain">APP公告</label>
										<textarea class="form-control" name="AppExplain" id="AppExplain" style="margin-bottom: 10px;"></textarea>
										<button type="submit" class="btn btn-sm btn-success" onclick="jssubmit($('#setting'), '<%=request.getContextPath()%>/Admin/Setting/AppExplain')">保存</button>
									</div>
									<div class="form-group text-center">
										<label for="AppNotice">APP提示</label>
										<textarea class="form-control" name="AppNotice" id="AppNotice" style="margin-bottom: 10px;"></textarea>
										<button type="submit" class="btn btn-sm btn-success" onclick="jssubmit($('#setting'), '<%=request.getContextPath()%>/Admin/Setting/AppNotice')">保存</button>
									</div>
									<div class="form-group text-center">
										<label for="buyUrl">购买地址</label>
										<input type="text" class="form-control" name="buyUrl" id="buyUrl" style="margin-bottom: 10px;">
										<button type="submit" class="btn btn-sm btn-success" onclick="jssubmit($('#setting'), '<%=request.getContextPath()%>/Admin/Setting/buyUrl')">保存</button>
									</div>
									<div class="form-group text-center">
										<label for="QQ">联系QQ</label>
										<input type="text" class="form-control" name="QQ" id="QQ" style="margin-bottom: 10px;">
										<button type="submit" class="btn btn-sm btn-success" onclick="jssubmit($('#setting'), '<%=request.getContextPath()%>/Admin/Setting/QQ')">保存</button>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</section>
		</section>
		<%@ include file="/WEB-INF/view/jsp/footer.jsp"%>
	</section>
	<div class="modal fade" id="notice" role="basic"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 id="context" class="modal-title text-center">修改成功</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/assets/advanced-datatable/media/js/jquery.js"></script><!-- BASIC JQUERY JS  -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
	<script src="<%=request.getContextPath()%>/js/respond.min.js" ></script><!-- RESPOND JS  -->
	<script src="<%=request.getContextPath()%>/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
	<script type="text/javascript">
	function jssubmit(Form, url) {
		var options = {
			url: url,
			type: 'post',
			dataType: 'text',
			data: $(Form).serialize(),
			success: function(data) {
				if (data == "1") {
					$("#context").text('修改成功');
				} else {
					$("#context").text('修改失败');
				}
				$("#notice").modal('show');
			}
		};
		$.ajax(options);
		return false;
	}
	</script>
</body>
</html>