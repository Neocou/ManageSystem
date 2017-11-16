<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>事件信息编辑</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.mesg==1 }">
			<script >alert("更新成功")</script>
			</c:when>
		<c:when test="${ param.mesg==0 }">
			<script >alert("更新失败")</script>
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
                            事件信息编辑
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="/ManageSystem/event/edit" method="POST" >
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>事件名称</th>
                                    <td><input type="text" name="eventLName"  class = "form-control" value = "${event.eventLName }"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="eventLId" value = "${event.eventLId}"/>
                            <input class="btn btn-primary" type="submit" onclick="if(confirm('确认更新事件吗')){return true;}else return false;"  value="提交" class="cEP_Table_Submit" />
                            <Button type="button" name="del" onclick = "if(confirm('确认删除部门?')){window.location.href='http://localhost:8080/ManageSystem/event/del/${event.eventLId}';} else {return false;}" class="btn btn-warning">删除</Button>
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/event'" class="btn btn-info">返回</Button>
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
