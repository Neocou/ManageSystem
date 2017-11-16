<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:choose>
		<c:when test="${ param.mesg==1 }">
			<script >alert("添加成功")</script>
			</c:when>
		<c:when test="${ param.mesg==0 }">
			<script >alert("添加失败")</script>
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
							<h2 class="text-center">添加用户</h2>
							</div>
		
						<div >
		                    <div class="col-md-12 table-area ">
							
		                        <form action="/ManageSystem/user/add" method="post">
		                            <table  class="table table-responsive table-bordered table-hover table-condensed">
		                                <tr>
		                                    <td >用户姓名</td>
		                                    <td><input type = "text" name ="userName"   class = "form-control"   /></td>
		                                    <td >部门编号</td>
		                                    <td><input type = "number" name = "departmentNum"   class = "form-control"  /></td>
		                                </tr>
		                                <tr>
		                                    <td >岗位编号</td>
		                                    <td><input type = "number" name ="postNum"   class = "form-control"  /></td>
		                                    <td >性别</td>
		                                    <td>
		                                    <select name ="gender"  class = "form-control" >
		                                    <option >男</option>
		                                    <option >女</option>
		                                    </select>
		                                    </td>
		                                <tr>
		                                    <td >年龄</td>
		                                    <td><input type = "text" name = "age"   class = "form-control"    /></td>
		                                    <td >电话</td>
		                                    <td><input type = text name = "phoneNum"   class = "form-control"   /></td>
		                                </tr>
		                            </table>
									<input type="submit" name="edit"   class="btn btn-success" value = "确认" onclick="if(confirm('确认添加用户吗')){return true;}else return false;">
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/user'" class="btn btn-info">返回</Button>
                             <c:if test = "${not empty param.userId }">
		                            	 <h3><span class="label label-success">你创建的用户ID是:${ param.userId }</span></h3>
		                            	 <h3><span class="label label-success">默认密码是:123456</span></h3>
		                            </c:if>
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