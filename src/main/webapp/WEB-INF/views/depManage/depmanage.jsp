<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>部门管理</title>
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
                            部门管理
                        </h2>
                    </div>
                <form action="dep/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="添加部门" ></input>
                </form>
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>部门编号</th>
                                    <th>部门名称</th>
                                    <th>部门地址</th>
                                    <th>部门描述</th>
                                    <th>    </th>
                                    <th>    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${departments}" var="a">
	                            <tr>
	                            	<td><input type = "text"  class = "form-control" name = "departmentNum" readonly="readonly" value = "${a.departmentNum}" /></td>
	                            	<td><input type = "text"  class = "form-control" name = "departmentName" readonly="readonly" value = "${a.departmentName}" /></td>
	                            	<td><input type = "text"  class = "form-control" name = "address" readonly="readonly" value= "${ a.address}" /></td>
	                            	<td><input type = "text"  class = "form-control" name = "depDescribe"  readonly="readonly"  value = "${a.depDescribe}"/></td>
	                            	<td><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/dep/edit/${ a.departmentNum }'">编辑</Button></td>
	                            	<td><Button type="submit"    class="btn btn-success" onclick = "if(confirm('确认删除部门?')){window.location.href='http://localhost:8080/ManageSystem/dep/del/${ a.departmentNum }';} else {return false;}">删除</Button></td>
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
