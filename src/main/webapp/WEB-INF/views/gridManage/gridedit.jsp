<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>区块${grid}分配情况</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.mesg==1 }">
			<script >alert("添加成功")</script>
			</c:when>
		<c:when test="${ param.mesg==0 }">
			<script >alert("添加失败")</script>
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
                            区块${grid}分配情况
                        </h2>
                    </div>
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-responsive table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>负责人员编号</th>
                                    <th>**删除操作**</th>
                                </tr>
                           </thead>
                           <tbody>
                                <c:forEach items = "${users }" var ="user">
                                	<tr>
                                    	<td>${user}</td>
                                    	<td><Button type="button" name="del"  onclick ="if(confirm('确认删除?')){window.location.href='http://localhost:8080/ManageSystem/grid/del/${grid}/${user}';} else {return false;}" class="btn btn-warning">删除</Button></td>
                                	</tr>
                                </c:forEach>
                            </tbody>
                        </table>

            </div>   
                            <Button  type="button" name="add" onclick =  "window.location.href='http://localhost:8080/ManageSystem/grid/${grid}/add'" class="btn btn-info">添加负责人</Button>
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/grid'" class="btn btn-info">返回</Button>
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>
