<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>休息日管理</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.delmesg==0 }">
			<script >alert("删除失败")</script>
			</c:when>
		<c:when test="${ param.delmesg==1 }">
			<script >alert("删除成功")</script>
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
                            休息日管理
                        </h2>
                    </div>
                <form action="restTime/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="添加休息日" ></input>
                </form>
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>休息日编号</th>
                                    <th>休息日开始</th>
                                    <th>休息日结束</th>
                                    <th>    </th>
                                    <th>    </th>
                                </tr>
                                </thead>
                            <tbody>
                            	<c:forEach items="${restTimes}" var="a">
                            	<tr>
                            		<td><input type = "text"  class = "form-control" name = "restNum" readonly="readonly" value = "${a.restNum}" /></td>
                            		<td><input type = "date"  class = "form-control" name = "startTime" readonly="readonly" value = "${a.startTime}" /></td>
                            		<td><input type = "date"  class = "form-control" name = "endTime" readonly="readonly" value = "${a.endTime}" /></td>
                                    <td><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/restTime/edit/${ a.restNum }'">编辑</Button></td>
									<td><Button type="submit"    class="btn btn-success" onclick = "if(confirm('确认删除部门?')){window.location.href='http://localhost:8080/ManageSystem/restTime/del/${ a.restNum }';} else {return false;}" >删除</Button></td>
                            	</tr>
                            	</c:forEach>
                            </tbody>
                        </table>

               
            </div>   
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>
