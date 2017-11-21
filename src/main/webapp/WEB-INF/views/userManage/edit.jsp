<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户信息</title>
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
		            <div class="col-md-12" id="main-content">
		                   <div class="col-md-12">
							<h2 class="text-center">用户编辑</h2>
							</div>
		
						<div >
		                    <div class="col-md-12 table-area ">
							
		                        <form action="/ManageSystem/user/edit" method="post">
		                            <table id="DepartmentTable" class="table table-responsive table-bordered table-hover table-condensed">
		                                <tr>
		                                    <td >用户姓名</td>
		                                    <td><input type = "text"  class = "form-control" name ="userName"  value = ${ result.userName} /></td>
		                                    <td >部门编号</td>
		                                    <td><input type = "number" class = "form-control"  name = "departmentNum"   value = ${ result.departmentNum } /></td>
		                                </tr>
		                                <tr>
		                                    <td >岗位编号</td>
		                                    <td><input type = "number"  class = "form-control" name ="postNum"  value = ${ result.postNum } /></td>
		                                    <td >性别</td>
		                                    <td>
		                                 <select name ="gender" class = "form-control"  >
			                           	 <c:choose>
				                           	 <c:when test="${result.gender=='女'}">
				                           	 	<option>男</option>
			                                    <option selected="selected">女</option>
				                           	 </c:when>
				                           	 <c:otherwise>
				                           	 	<option selected="selected">男</option>
			                                    <option>女</option>
			                                 </c:otherwise>
		                                 </c:choose>
		                                 </select>
											</td>
		                                <tr>
		                                    <td >年龄</td>
		                                    <td><input type = "text" name = "age"   class = "form-control"  value = ${ result.age } /></td>
		                                    <td >电话</td>
		                                    <td><input type = "text" name = "phoneNum"  class = "form-control"   value = ${ result.phoneNum } /></td>
		                                </tr>
		                            </table>
		                            <input type = "hidden" name ="userNumber"  value = ${ result.userNumber } />
									<input type="submit" name="edit"  onclick="if(confirm('确认更新用户吗')){return true;}else return false;" class="btn btn-success" value = "更新" />
									<Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/user/select'" class="btn btn-info">返回</Button>
							</form>
		                    </div>
					</div>
		            </div>   
		            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>