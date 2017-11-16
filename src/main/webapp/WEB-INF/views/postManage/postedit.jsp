<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>岗位信息编辑</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.editmesg==0 }">
			<script >alert("更新成功")</script>
			</c:when>
		<c:when test="${ param.editmesg==1 }">
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
                            岗位信息编辑
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="/ManageSystem/post/edit" method="POST" >
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>岗位名称</th>
                                    <td><input type="text"  class = "form-control" name="postName" value = "${post.postName }"/></td>
                                    <th>岗位描述</th>
                                    <td><input type="text" class = "form-control"  name="pDiscribe" value = "${post.pDiscribe }"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="postNum" value = "${post.postNum }"/>
                            <input class="btn btn-primary" type="submit"  onclick="if(confirm('确认更新岗位吗')){return true;}else return false;" value="提交" class="cEP_Table_Submit" />
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/post'" class="btn btn-info">返回</Button>
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
