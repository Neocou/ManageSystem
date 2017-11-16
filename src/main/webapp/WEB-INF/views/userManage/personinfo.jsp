<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.mesg==0 }">
			<script >alert("修改失败")</script>
			</c:when>
		<c:when test="${ param.mesg==1 }">
			<script >alert("修改成功")</script>
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
			            <div class="col-md-12" id="main-content">
			                   <div class="col-md-12">
								<h2 class="text-center">用户信息修改</h2>
								</div>
			                <form action="personinfo" method="POST" >
			                	<table  class="table table-responsive table-bordered table-hover table-condensed">
			                        <tr>
			                            <td>姓名</td>
			                            <td><input type="text"  class = "form-control" value="${ userinfo.userName}" name="userName"/></td>
			                            <td>性别</td>
			                            <td>
			                           	 <select  class = "form-control" name ="gender" >
			                           	 <c:if test = "${userinfo.gender eq '女' } ">
			                           	 	<option >男</option>
		                                    <option selected="selected">女</option>
			                           	 </c:if>
			                           	 	<option selected="selected">男</option>
		                                    <option >女</option>
		                                 </select>
		                                 </td>
			                            <td>年龄</td>
			                            <td><input type="number"  class = "form-control" value="${userinfo.age }" name="age" /></td>
			                        </tr>
			                        <tr>
			                            <td>岗位</td>
			                            <td><input type="text" readonly="readonly"  class = "form-control" value="${userinfo.postName }" name="postName" /></td>
			                            <td>部门</td>
			                            <td><input type="text" readonly="readonly"  class = "form-control" value="${userinfo.departmentName }" name="departmentName"/></td>
			                          	<td>手机</td>
			                            <td><input type="text" value="${userinfo.phoneNum }"  class = "form-control" name="phoneNum"/></td>
			                        </tr>
			                        <tr>
			                        	<td>工号</td>
			                            <td><input type="text" readonly="readonly"  class = "form-control" value="${userinfo.userNumber }" name="userNumber" /></td>
			                        	<td>所属角色</td>
			                            <td><input type="text" readonly="readonly"  class = "form-control" value="${userinfo.roles }"  /></td>
			                            <td>负责区块</td>
			                            <td><input type="text" readonly="readonly"  class = "form-control" value=" ${userinfo.grids }"  /></td>
			                        </tr>
			                        <tr>
			                            <td><Button type="button" class="btn btn-success" onclick =  "window.location.href='http://localhost:8080/ManageSystem/personinfo/password'" >修改密码</Button></td>
			                        </tr>
			                    </table>
			                    <input type="submit" value="更新" onclick="if(confirm('确认更改信息吗')){return true;}else return false;" class="btn btn-success"/>
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