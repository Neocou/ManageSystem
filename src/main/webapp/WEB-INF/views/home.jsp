<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>首页</title>
	<%@ include file="common/js.jsp"%> 
    	<c:if test="${param.powermesg == 0}">
    		<script >alert("权限不够！");</script> 
    	</c:if>
</head>
<body>
<div class="container">
	<%@ include file="common/moren.jsp"%> 
    <div class="row clearfix">
		<%@ include file="common/left.jsp"%> 
    	<div class="col-md-8 column" id="main-page">
    		<div class="container-fluid">
			<%@ include file="common/top.jsp"%> 
				<div>
					<h1>这里本来应该有个LOGO</h1><br>
					<h1>不过找不到合适的</h1><br>
					<h1>随便写点应付</h1><br>
					<h1>就这样</h1>
				</div>
			</div>
        </div>
		<%@ include file="common/right.jsp"%> 
	</div>

</div>
</body>
</html>

