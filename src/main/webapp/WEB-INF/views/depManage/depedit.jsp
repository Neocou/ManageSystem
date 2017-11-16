<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>部门信息编辑</title>
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
                            部门信息编辑
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="/ManageSystem/dep/edit" method="POST" >
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>部门名称</th>
                                    <td><input type="text"  class = "form-control" name="departmentName" value = "${department.departmentName }"/></td>
                                    <th>部门地址</th>
                                    <td><input type="text"  class = "form-control" name="address" value = "${department.address }"/></td>
                                </tr>
                                <tr>
                                    <th>部门描述</th>
                                    <td><input type="text"  class = "form-control" name="depDescribe" value = "${department.depDescribe }"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="departmentNum" value = "${department.departmentNum }"/>
                            <input class="btn btn-primary" type="submit"   value="提交" onclick="if(confirm('确认更新部门吗')){return true;}else return false;" class="cEP_Table_Submit" />
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/dep'" class="btn btn-info">返回</Button>
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
