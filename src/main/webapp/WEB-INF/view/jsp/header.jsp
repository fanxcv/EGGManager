<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header white-bg">
	<div class="sidebar-toggle-box">
		<div data-placement="right" class="fa fa-bars tooltips"></div>
	</div>
	<a href="<%=request.getContextPath()%>/LoginCtrl/index.do" class="logo"> EGGProxy <span> 流量管理 </span>
	</a>
	<!-- START USER LOGIN DROPDOWN  -->
	<div class="top-nav">
		<ul class="nav pull-right top-menu">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#">
					<img src="<%=request.getContextPath()%>/img/EGG.jpg" width="29px" height="29px">
					<span class="username"> ${logged.username} </span>
					<b class="caret"> </b>
				</a>
				<ul class="dropdown-menu extended logout">
					<li class="log-arrow-up"></li>
					<li>
						<a href="<%=request.getContextPath()%>/LoginCtrl/logout.do">
							<i class="fa fa-key"> </i> 安全退出
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</header>

<aside>
	<div id="sidebar" class="nav-collapse">
		<ul class="sidebar-menu" id="nav-accordion">
			<li>
				<a href="<%=request.getContextPath()%>/LoginCtrl/index.do" class="active">
					<i class="fa fa-home"></i><span> 主页  </span>
				</a>
			</li>
			<%-- <li class="sub-menu">
				<a href="javascript:;">
					<i class="fa fa-user"></i><span> 个人中心 </span>
				</a>
				<ul class="sub">
					<c:if test="${logged.role == '0' || logged.role > '2'}">
						<li><a href="<%=request.getContextPath()%>/buylist.jsp">
							<span> 购买流量 </span>
						</a></li>
					</c:if>
					<li><a href="<%=request.getContextPath()%>/user/changepass.jsp">
						<span> 修改密码 </span>
					</a></li>
				</ul>
			</li> --%>
			<c:if test="${logged.role != '0'}">
				<c:if test="${logged.role < '3'}">
					<li class="sub-menu">
						<a href="javascript:;">
							<i class="fa fa-users"></i><span> 账号管理 </span>
						</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/admin/user/agent">
								<span> 代理管理 </span>
							</a></li>
							<%-- <li><a href="<%=request.getContextPath()%>/admin/user/user">
								<span> 用户管理 </span>
							</a></li> --%>
							<li><a href="<%=request.getContextPath()%>/Admin/Group/getGroup">
								<span> 分组管理 </span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/group/add">
								<span> 添加分组 </span>
							</a></li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;">
							<i class="fa fa-globe"></i><span> 线路管理 </span>
						</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/Admin/Line/getLine">
								<span> 线路列表 </span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/line/add">
								<span> 添加线路 </span>
							</a></li>
						</ul>
					</li>
					<li class="sub-menu">
						<a href="javascript:;">
							<i class="fa fa-sitemap"></i><span> 流量包管理 </span>
						</a>
						<ul class="sub">
							<li><a href="<%=request.getContextPath()%>/Admin/Pack/getPack/admin">
								<span> 流量包列表 </span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/admin/package/add">
								<span> 添加流量包 </span>
							</a></li>
						</ul>
					</li>
				</c:if>
				<li class="sub-menu">
					<a href="javascript:;">
						<i class="fa fa-shopping-cart"></i><span> 充值码管理 </span>
					</a>
					<ul class="sub">
						<li><a href="<%=request.getContextPath()%>/Admin/Code/getCodeGroup">
							<span> 充值码列表 </span>
						</a></li>
						<c:if test="${logged.role > '2'}">
							<li><a href="<%=request.getContextPath()%>/Admin/Pack/getPack/1">
								<span> 充值码购买 </span>
							</a></li>
						</c:if>
					</ul>
				</li>
				<li>
					<a href="<%=request.getContextPath()%>/admin/other/setting">
						<i class="fa fa-gear"></i><span> 设置  </span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
</aside>