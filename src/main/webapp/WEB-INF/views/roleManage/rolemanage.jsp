<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>角色管理</title>
<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.delmesg==0 }">
			<script >alert("删除失败")</script>
			</c:when>
		<c:when test="${ param.delmesg==1 }">
			<script >alert("删除成功")</script>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ param.editmesg==1 }">
			<script >alert("更新成功")</script>
			</c:when>
		<c:when test="${ param.editmesg==0 }">
			<script >alert("更新失败")</script>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ param.updatemesg==1 }">
			<script >alert("权限分配成功")</script>
			</c:when>
		<c:when test="${ param.updatemesg==0 }">
			<script >alert("权限分配失败")</script>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${ param.usermesg==1 }">
			<script >alert("用户分配成功")</script>
			</c:when>
		<c:when test="${ param.usermesg==0 }">
			<script >alert("用户分配失败")</script>
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
                            角色管理
                        </h2>
                    </div>
                 <form action="role/add" method="GET" style="position:absolute;right:15px;">
                	<input class="btn btn-info" type="submit" value="添加角色"></input>
                </form>
            <div class="col-md-12 table-area pre-scrollable">

                <c:forEach items="${roles}" var="a">
                    <form action="role/next" method="POST" >
                      <div class="col-md-2">
                        <label for="sumform" >选择操作</label>
                            <select class="form-control" name = "doname"  >
                                <option value = "编辑">编辑</option>
                                <option value = "删除">删除</option>
                                <option value = "权限分配">权限分配</option>
                                <option value = "用户分配">用户分配</option>
                            </select>
                            </div>
                            <div class="col-md-2" style="padding-top:25px">
                                <input class="btn btn-primary"  type="submit" value="确认" />
                                </div>
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>角色编号</th>
                                    <td><input type = "text" name = "roleId"   class = "form-control" readonly="readonly" value = "${a.roleId}" /></td>
                                    <th>角色名称</th>
                                    <td><input type = "text" name = "roleName"   class = "form-control" readonly="readonly"  value = "${a.roleName}" /></td>
                                </tr>
                                <tr>
                                    <th>角色描述</th>
                                    <td><input type = "text" name = "roleDescribe"  class = "form-control"  readonly="readonly" value= "${ a.roleDescribe}" /></td>
                                </tr>
                            </tbody>
                        </table>
                      
                    </form>
                    </c:forEach>
                
            </div>   
            </div>
 			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>

</body>
</html>
