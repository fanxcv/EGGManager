<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="modal fade" id="moadl1" role="basic"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">查看</h4>
				</div>
				<div class="modal-body">
					<p class="text-center"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${logged.role == '1'}">
		<div class="modal fade" id="moadl2_1" tabindex="-1" role="basic"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content animated">
					<section class="panel">
						<header class="panel-heading tab-bg-dark-navy-blue">
							<span class="label label-primary">添加管理</span>
						</header>
						<div class="panel-body">
							<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/User/addAdmin')">
								<input type="hidden" name="cid" value="${logged.id}" />
								<div class="item">
									<div class="form-group text-center">
										<label for="username">登录名</label>
										<input type="text" class="form-control" name="username" id="username">
									</div>
									<div class="form-group text-center">
										<label for="password">密码</label>
										<input type="password" class="form-control" name="password" id="password">
									</div>
									<div class="form-group text-center">
										<label for="remarks">备注</label>
										<input type="text" class="form-control" name="remarks" id="remarks">
									</div>
									<div class="form-group text-center">
										<button type="submit" class="btn btn-primary" type="button">保存</button>
										&nbsp;&nbsp;
										<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
									</div>
									<div class="form-group text-center backinfo" style='color: red'></div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
		</div>
	</c:if>
	<div class="modal fade" id="moadl2" tabindex="-1" role="basic"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated">
				<section class="panel">
					<header class="panel-heading tab-bg-dark-navy-blue">
						<span class="label label-primary">添加代理</span>
					</header>
					<div class="panel-body">
						<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/User/addUser')">
							<input type="hidden" name="cid" value="${logged.id}" />
							<div class="item">
								<div class="form-group text-center">
									<label for="username">登录名</label>
									<input type="text" class="form-control" name="username" id="username">
								</div>
								<div class="form-group text-center">
									<label for="password">密码</label>
									<input type="password" class="form-control" name="password" id="password">
								</div>
								<div class="form-group text-center">
									<label for="remarks">备注</label>
									<input type="text" class="form-control" name="remarks" id="remarks">
								</div>
								<div class="form-group text-center">
									<div><label for="group">用户分组</label></div>
									<select class="form-control m-bot15" id="group" name="group">
										<option value="0">未分组</option>
									</select>
								</div>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-primary" type="button">保存</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
								</div>
								<div class="form-group text-center backinfo" style='color: red'></div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div class="modal fade" id="moadl3" role="basic" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content animated">
				<section class="panel">
					<header class="panel-heading tab-bg-dark-navy-blue">
						<span class="label label-primary">账号编辑</span>
					</header>
					<div class="panel-body">
						<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/User/editUser/update')">
							<input type="hidden" name="cid"/>
							<div class="item">
								<div class="form-group text-center">
									<label for="username">登录名</label>
									<input type="text" class="form-control" name="username" id="username">
								</div>
								<div class="form-group text-center">
									<label for="password">密码</label>
									<input type="password" class="form-control" name="password" id="password">
								</div>
								<div class="form-group text-center">
									<label for="remarks">备注</label>
									<input type="text" class="form-control" name="remarks" id="remarks">
								</div>
								<div class="form-group text-center">
									<label for="money">账户余额</label>
									<input type="text" class="form-control" name="money" id="money">
								</div>
								<div class="form-group text-center">
									<div><label for="groups">用户分组</label></div>
									<select class="form-control m-bot15" id="groups" name="group">
										<option value="0">未分组</option>
									</select>
								</div>
								<div class="form-group text-center">
									<div><label>账号状态</label></div>
									<div class="text-center">
										<label class="checkbox-inline" style="margin: 0; padding: 0 5px;">
											<input type="radio" name="locked" value="1"/> 锁定
										</label>
										<label class="checkbox-inline" style="margin: 0; padding: 0 5px;">
											<input type="radio" name="locked" value="0"/> 正常
										</label>
									</div>
								</div>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-primary" type="button">保存</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
								</div>
								<div class="form-group text-center backinfo" style='color: red'></div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</div>