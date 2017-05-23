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
					<h2>流量包</h2>
					<pre>设置流量包数据
代理用流量包购买激活码
代理购买时根据购买数量扣除账户余额并生成相应数量的流量码
你只需要给代理充值，其余的就让代理自己动手吧</pre>
				</div>
				<c:choose>
					<c:when test="${error != null}">
						<div class="col-sm-12">
								<p class="text-danger text-center" style="font-size: 30px">${error}</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<div class="col-lg-6" id="pka${list.id}">
								<section class="panel panel-info">
									<header class="panel-heading">
										<span class="label label-inverse">${list.name} - ${list.groupName}</span>
										<span class="tools pull-right">
											<a href="javascript:;" class="fa fa-chevron-down"></a>
											<a href="javascript:;" class="fa fa-times"></a>
										</span>
									</header>
									<div class="panel-body">
										<h3 class="text-center">
											￥<span style="color: red">${list.price/100}</span>元
										</h3>
										<p class="text-center">
											套餐详情：
											<span style="color: red">${list.time}</span>天
											<span style="color: red">无限</span>流量
										</p>
										<p class="text-center">
											<a href="javascript:;" onclick="buy(${list.id})">点击购买 </a>
										</p>
										<c:if test="${logged.role < '3'}">
											<p class="text-center">
												<button type=button class="btn btn-danger" onclick="del(${list.id})">
													<i class="fa fa-trash-o"></i> 删除
												</button>
												<button type=button class="btn btn-primary"
													onclick="edit(${list.id})">
													<i class="fa fa-edit"></i> 编辑
												</button>
											</p>
										</c:if>
									</div>
								</section>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</section>
		</section>
		<%@ include file="/WEB-INF/view/jsp/footer.jsp"%>
	</section>
	<%@ include file="/WEB-INF/view/jsp/admin/package/modal.jsp" %>
	
	<script src="<%=request.getContextPath()%>/js/demo/dome.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/assets/advanced-datatable/media/js/jquery.js"></script><!-- BASIC JQUERY JS  -->
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js" ></script><!-- BOOTSTRAP JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.dcjqaccordion.2.7.js"></script><!-- ACCORDING JS -->
	<script src="<%=request.getContextPath()%>/js/jquery.scrollTo.min.js" ></script><!-- SCROLLTO JS  -->
	<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js" > </script><!-- NICESCROLL JS  -->
	<script src="<%=request.getContextPath()%>/js/respond.min.js" ></script><!-- RESPOND JS  -->
	<script src="<%=request.getContextPath()%>/js/common-scripts.js" ></script><!-- BASIC COMMON JS  -->
	<script type="text/javascript">
	function buy(id) {
		$("#addCode input[name='pid']").attr("value", id);
		$("#addCode").modal('show');
	}
	function download(batch) {
		window.location.href = "<%=request.getContextPath()%>/Common/downloadCode/" + batch;
	}
	function del(id) {
		$.post("<%=request.getContextPath()%>/Admin/Pack/delPack", {id: id}, function() {
			$("#pka" + id).remove();
		});
	}
	function edit(id) {
		$.post("<%=request.getContextPath()%>/Admin/Pack/editPack/get", {id : id}, function(data) {
			if (data != null) {
				$(data).each(function(i, v) {
					$("input[name='id']").attr("value", v.id);
					$("input[name='name']").attr("placeholder", v.name);
					$("input[name='time']").attr("placeholder", v.time);
					$("input[name='price']").attr("placeholder", v.price/100);
					$("#out select option[value=" + v.gId + "]").prop("selected", true);
				});
			}
		}, "json");
		$("#out").modal('show');
	}
	</script>
	<script>
		$(document).ready(function() {
			$.post("<%=request.getContextPath()%>/Admin/Group/getGroupJson", function(data) {
				if (data) {
					var context = "";
					$(data).each(function(i, v) {
						context += '<option value="'+ v.id + '">'+ v.name +'</option>';
					});
					$('select').append(context);
				}
			}, "json");
			$(".modal").on("hide.bs.modal", function() {
				var text = $(".backinfo").text();
				$("#btn .btn-info").remove();
				$(".backinfo").text("");
				if (text.indexOf("改成功") > 0) {
					window.location.href = "<%=request.getContextPath()%>/Admin/Pack/getPack/admin";
				}
			});
		});
	</script>
</body>

</html>
