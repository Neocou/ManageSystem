<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>岗位管理</title>
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
                            岗位管理
                        </h2>
                    </div>
                <form action="post/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="添加岗位" ></input>
                </form>
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th>岗位编号</th>
                                    <th>岗位名称</th>
                                    <th>岗位描述</th>
                                    <th>    </th>
                                    <th>    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${posts}" var="a">
                            	<tr>
                            		<td><input type = "text"  class = "form-control" name = "postNum" readonly="readonly" value = "${a.postNum}" /></td>
                            		<td><input type = "text"  class = "form-control" name = "postName" readonly="readonly" value = "${a.postName}" /></td>
                            		<td><input type = "text"  class = "form-control" name = "pDiscribe"  readonly="readonly"  value = "${a.pDiscribe}"/></td>
                                    <th><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/post/edit/${ a.postNum }'">编辑</Button></th>
                                    <th><Button type="submit"    class="btn btn-success" onclick = "if(confirm('确认删除岗位?')){window.location.href='http://localhost:8080/ManageSystem/post/del/${ a.postNum }';} else {return false;}">删除</Button></th>
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
