<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户角色分配</title>
<%@ include file="/WEB-INF/views/common/js.jsp"%> 
<script type="text/javascript">
$(function(){  
      var roles = ${userRole};  
      $.each(roles, function(i,item){  
            $("input[name=roleId][value="+item+"]").attr("checked","checked");
      });  
    });  
</script>
	<c:choose>
		<c:when test="${ param.mesg==1 }">
			<script >alert("角色分配成功")</script>
			</c:when>
		<c:when test="${ param.mesg==0 }">
			<script >alert("角色分配失败")</script>
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
                            角色分配
                        </h2>
                    </div>
                    <form action="/ManageSystem/user/edit/role" method="POST" >
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-responsive table-bordered table-hover table-condensed">
                            <thead>
                                <tr class="success">
                                    <th>角色编号</th>
                                    <th>角色名称</th>
                                    <th>角色描述</th>
                                </tr>
                            </thead>
                           <c:forEach items="${roles}" var="a" >
                            <tbody>
                                <tr>
                                    <td><input type = "checkbox"   name = "roleId" value = "${a.roleId}" />${a.roleId}</td>
                                    <td><input readonly name = "roleName"  class = "form-control" value = "${a.roleName}" /></td>
                                    <td><input readonly name = "roleDescribe" class = "form-control"  value = "${a.roleDescribe}" /></td>
                                </tr>
                            </tbody>
                           </c:forEach>
                        </table>
                        <input type = "hidden" name = "userid" value = "${userid}" />
                        <br>
            </div>  
             <input class="btn btn-info" type="submit" onclick="if(confirm('确认分配吗')){return true;}else return false;"value="提交" />
              <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/user/edit/${userid}'" class="btn btn-info">返回</Button>
            </form> 
            </div>

 			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>

