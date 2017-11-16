<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>角色信息编辑</title>
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
            <div class="col-md-12">
                        <h2 class="text-center">
                            角色信息编辑
                        </h2>
                    </div>
                    
            <div class="col-md-12">
                    <form action="edit" method="POST" >
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>角色名称</th>
                                    <td><input type="text" name="roleName"  class = "form-control"  value = "${editrole.roleName }"/></td>
                                    <th>角色描述</th>
                                    <td><input type="text" name="roleDescription"  class = "form-control"  value = "${editrole.roleDescribe }"/></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="roleId" value = "${editrole.roleId }"/>
                            <input class="btn btn-primary" type="submit"  onclick="if(confirm('确认更新角色吗')){return true;}else return false;" value="提交" class="cEP_Table_Submit" />
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/role'" class="btn btn-info">返回</Button>
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
