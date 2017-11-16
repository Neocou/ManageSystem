<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>休息日编辑</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.editmesg==1 }">
			<script >alert("更新成功")</script>
			</c:when>
		<c:when test="${ param.editmesg==0 }">
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
                            休息日编辑
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="/ManageSystem/restTime/edit" method="POST" >
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>休息日开始</th>
                                    <td><input type="text" class = "form-control" id = "from" name="startTime" value = "${restTime.startTime }"/></td>
                                    <th>休息日结束</th>
                                    <td><input type="text"class = "form-control"  id = "to" name="endTime" value = "${restTime.endTime }"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="restNum" value = "${restTime.restNum }"/>
                            <input class="btn btn-primary" type="submit" onclick="if(confirm('确认更新吗')){return true;}else return false;"  value="提交" class="cEP_Table_Submit" />
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/restTime'" class="btn btn-info">返回</Button>
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
