<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>密码修改</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
<script >
    function checkForm(form){
        if(form.passWord.value==""){
            alert("请输入的原密码!");form.passWord.focus();return false;
        }
        if(form.newPassword.value==""){
            alert("请输入的新密码!");form.newPassword.focus();return false;
        }
        if (form.newPassword.value.length>25) { 
            alert("新密码长度不能太长了!");form.newPassword.focus();return false;
        }
        if(form.surePassword.value==""){
            alert("请确认新密码!");form.surePassword.focus();return false;
        }
        if(form.newPassword.value!=form.surePassword.value){
            alert("您两次输入的新密码不一致，请重新输入!");
            form.newPassword.value="";form.surePassword.value="";
            form.newPassword.focus();return false;
        }
        if(confirm('确认更改密码吗')){
        	return true;
        }
        else 
        	return false;
    }
</script>
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
					<h2 class="text-center">密码修改</h2>
					</div>
                <form name="pwd_change_form" action="/ManageSystem/personinfo/password" method="post">
                <table border="1" class="table table-responsive table-bordered table-hover table-condensed">  
                        <tr>                
                            <td style="text-align: center" >用户ID</td>
                            <td><input type="text"  class = "form-control" value="${userinfo.userNumber }" name="userNumber" readonly></td>                          
                        </tr>
                        <tr>                
                            <td style="text-align: center">原密码</td>
                            <td><input type="password"  class = "form-control" value="" name="passWord"></td>                            
                        </tr>
                        <tr>                
                            <td style="text-align: center">新密码</td>
                            <td><input type="password"  class = "form-control" value="" name="newPassword"></td>
                        </tr>
                        <tr>                
                            <td style="text-align: center">请再次输入新密码</td>
                            <td><input type="password"  class = "form-control" value="" name="surePassword"></td>
                        </tr>
                    </table>
                    <input type="submit" value="确认修改" name="btnSure" onClick=" return checkForm(pwd_change_form)" class="btn btn-success" > 
                    <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/personinfo'" class="btn btn-info">返回</Button>  
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



