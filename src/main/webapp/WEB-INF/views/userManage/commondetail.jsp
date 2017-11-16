<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户信息</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
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
							<h2 class="text-center">用户查看</h2>
							</div>
		
						<div >
		                    <div class="col-md-12 table-area ">
							
		                            <table  class="table table-responsive table-bordered table-hover table-condensed">
		                                <tr>
		                                    <td >用户姓名</td>
		                                    <td><input type = "text" class = "form-control" name ="userName" readonly value = ${ result.userName} /></td>
		                                    <td >部门名称</td>
		                                    <td><input type = "text" class = "form-control"  name = "departmentName" readonly  value = ${ result.departmentName } /></td>
		                                </tr>
		                                <tr>
		                                    <td >岗位名称</td>
		                                    <td><input type = "text" class = "form-control"  name ="postName" readonly value = ${ result.postName } /></td>
		                                    <td >性别</td>
		                                    <td><input type = "text" class = "form-control"  name ="gender" readonly value = ${ result.gender} /></td>
		                                <tr>
		                                    <td >年龄</td>
		                                    <td><input type = "text" class = "form-control"  name = "age" readonly  value = ${ result.age } /></td>
		                                    <td >电话</td>
		                                    <td><input type = "text" class = "form-control"  name = "phoneNum"  readonly value = ${ result.phoneNum } /></td>
		                                </tr>
		                            </table>
		                            <input type = "hidden" name ="userNumber"  value = ${ result.userNumber } />
		                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/users/select'" class="btn btn-info">返回</Button>
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