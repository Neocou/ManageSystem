<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
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
		            <div class="col-md-12" id="main-content">
		                   <div class="col-md-12">
							<h2 class="text-center">用户查询</h2>
							</div>
		
						<div >
		                    <div class="col-md-12">
		                        <div class="input-group col-md-12"> 
		                        <form action="select" method="post">
									 <input class="form-control" type="search" placeholder="输入用户编号" name="userNumber" id="queryId">
									  <input class="form-control" type="search" placeholder="输入用户姓名" name="userName" id="queryId">
									   <input class="form-control" type="search" placeholder="输入部门" name="departmentName" id="queryId">
										<input class="form-control" type="search" placeholder="输入岗位" name="postName" id="queryId">
		                            <span class="input-group-btn">
								        <Button  type="submit" name="serach" id="serachBtn" class="btn btn-info">搜索</Button>
                            			<Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/user'" class="btn btn-info">返回</Button>
		                             </span>
		                             </form>
		                        </div>
		
		                    </div>
		                    <div class="col-md-12 table-area pre-scrollable">
							
		                            <table id="DepartmentTable" class="table table-responsive table-bordered table-hover table-condensed">
			                                <tr>
			                                	<th>用户编号</th>
			                                    <th>用户姓名</th>
			                                    <th>负责区块</th>
			                                    <th>所属角色</th>
			                                    <th>部门</th>
			                                    <th>岗位</th>
			                                    <th>性别</th>
			                                    <th>年龄</th>
			                                    <th>电话</th>
			                                    <th>    </th>
			                                    <th>    </th>
			                                </tr>
			                            <tbody>
			                            <c:forEach items="${users}" var="a">
			                                <tr>
			                                    <td>${a.userNumber}</td>
			                                    <td>${a.userName}</td>
			                                    <td>${a.grids}</td>
			                                    <td>${a.roles}</td>
			                                    <td>${a.departmentName}</td>
			                                    <td>${a.postName}</td>
			                                    <td>${a.gender}</td>
			                                    <td>${a.age}</td>
			                                    <td>${a.phoneNum}</td>
			                                    <td><Button type="button" name="edit"   class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/user/edit/${ a.userNumber }'">编辑</Button></td>
			                                	<td><Button type="button" name="del" onclick = "if(confirm('确认删除用户?')){window.location.href='http://localhost:8080/ManageSystem/user/del/${a.userNumber }';} else {return false;}" class="btn btn-info" >删除</Button></td>
			                                </tr>
			                            </c:forEach>
			                            </tbody>
		                            </table>
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