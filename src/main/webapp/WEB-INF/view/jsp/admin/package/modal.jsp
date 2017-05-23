<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="out" tabindex="-1" role="basic"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated">
			<section class="panel">
				<header class="panel-heading tab-bg-dark-navy-blue">
					<span class="label label-primary">流量包编辑</span>
				</header>
				<div class="panel-body">
					<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/Pack/editPack/update')">
						<input type="hidden" name="id" value="" />
						<div class="item">
							<div class="form-group text-center">
								<label for="name">流量包名称</label>
								<input type="text" class="form-control" name="name" id="name" placeholder="请输入流量包名">
							</div>
							<div class="form-group text-center">
								<label for="stime">包含天数</label>
								<input type="text" class="form-control" name="time" id="stime" placeholder="请输入天数（单位天）">
							</div>
							<div class="form-group text-center">
								<label for="price">出售价格</label>
								<input type="text" class="form-control" name="price" id="price" placeholder="请输入价格(单位元，可以输入小数)">
							</div>
							<div class="form-group text-center">
								<div><label for="group">包归属</label></div>
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
<div class="modal fade" id="addCode" tabindex="-1" role="basic"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content animated">
			<section class="panel">
				<header class="panel-heading tab-bg-dark-navy-blue">
					<span class="label label-primary">购买流量码</span>
				</header>
				<div class="panel-body">
					<form action="" onsubmit="return jssubmit(this, '<%=request.getContextPath()%>/Admin/Code/addCode')">
						<input type="hidden" name="pid" value="" />
						<div class="item">
							<div class="form-group text-center">
								<label for="num">购买数量</label>
								<input type="text" class="form-control" name="num" id="num" placeholder="请输入个数">
							</div>
							<div class="form-group text-center">
								<label for="remark">备注信息</label>
								<input type="text" class="form-control" name="remark" id="remark">
							</div>
							<div class="form-group text-center" id="btn">
								<button type="submit" class="btn btn-primary" type="button">购买</button>
								&nbsp;&nbsp;
								<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
								&nbsp;&nbsp;
							</div>
							<div class="form-group text-center backinfo" style='color: red'></div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</div>