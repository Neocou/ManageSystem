<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>角色权限分配</title>
<%@ include file="/WEB-INF/views/common/js.jsp"%> 
<script type="text/javascript">
$(function(){  
      var powers = ${rolePower};  
      $.each(powers, function(i,item){  
            $("input[name=powerId][value="+item+"]").attr("checked","checked");
      });  
    });  
</script>
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
                            权限分配
                        </h2>
                    </div>
                    <form action="powers" method="POST" >
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-responsive table-bordered table-hover table-condensed">
                            <thead>
                                <tr class="success">
                                    <th>权限编号</th>
                                    <th>权限名称</th>
                                    <th>权限描述</th>
                                </tr>
                            </thead>
                           <c:forEach items="${powers}" var="a" >
                            <tbody>
                                <tr>
                                    <td><input type = "checkbox"   name = "powerId" value = "${a.powerId}" />${a.powerId}</td>
                                    <td><input readonly name = "powerName"  class = "form-control" value = "${a.powerName}" /></td>
                                    <td><input readonly name = "powerDescribe" class = "form-control"  value = "${a.powerDescribe}" /></td>
                                </tr>
                            </tbody>
                           </c:forEach>
                        </table>
                        <input type = "hidden" name = "roleid" value = "${roleid}" />
                        <br>
            </div>  
             <input class="btn btn-info" type="submit" onclick="if(confirm('确认分配吗')){return true;}else return false;"value="提交" />
              <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/role'" class="btn btn-info">返回</Button>
            </form> 
            </div>

 			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>

