<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理系统登录页面</title>
	<%@ include file="common/js.jsp"%> 
		<c:if test="${param.mesg == 0}">
    		<script >alert("请先登陆！")</script>
    	</c:if>
		<c:if test="${param.mesg == 1}">
    		<script >alert("你已经退出登陆。")</script>
    	</c:if>
    	<c:if test="${param.loginmesg == 0}">
    		<script >alert("密码或者账号不正确！")</script>
    	</c:if>
</head>
<body  >
<div  style="position:absolute; width:100%; height:100%; z-index:-1">
<img style="position:fixed;" src="http://localhost:8080/ManageSystem/assets/images/timg.jpg" height="100%" width="100%" />
</div>
	<div class="container">
	<div class="row clearfix" id="header">
	<div class="col-md-2"></div>
	<div class="col-md-8 page-header">
			<h1 class="text-center"><font size="20">管理系统</font></h1>
	</div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row clearfix">
		<div class="col-md-8">
		</div>
		<div class="col-md-4">
			<form action="login" method="POST">
			<div >
				<table class="table table-responsive">
				<!-- 账户只能输入数字 -->
					<tr>
					<td>账号：</td>
					<td><input type="number" placeholder="工号" name="userNumber" ></td>
					</tr>
					<tr>
					<td>密码：</td>
					<td>
					<input type="password" placeholder="密码" name="passWord">
					</td>
					</tr>
				</table>
				<div >
				<input class="btn btn-success" type="submit" value="登录">
					 <input class="btn btn-info" type="reset" name="重置">
				</div>
			</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>