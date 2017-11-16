<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>数据库管理</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.mesg==0 }">
			<script >alert("还原失败")</script>
			</c:when>
		<c:when test="${ param.mesg==1 }">
			<script >alert("还原成功")</script>
		</c:when>
	</c:choose>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/views/common/moren.jsp"%> 
    <div class="row clearfix">
		<%@ include file="/WEB-INF/views/common/left.jsp"%> 
    	<div class="col-md-8 column" id="main-page">
    		<div class="container-fluid">
			<%@ include file="/WEB-INF/views/common/top.jsp"%> 
            <div class="row">
            <div class="col-md-12">
                        <h2 class="text-center">
                            数据库管理
                        </h2>
                    </div>
	            <div class="col-md-12 table-area">
					<form action="upload" method="POST" enctype="multipart/form-data">
					  <input type="file" name="file" >
					<input type="submit" onclick="if(confirm('确认还原吗')){return true;}else return false;" value="还原"  class="btn btn-danger">
					</form>
					<form action="download" method="get">
							<input type="submit" name="download" onclick="if(confirm('确认备份吗')){return true;}else return false;" value="备份" class="btn btn-primary">
					</form>
	            </div>   
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>