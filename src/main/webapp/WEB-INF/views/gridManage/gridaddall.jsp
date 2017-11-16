<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>任意区块负责人添加</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:if test="${param.user==0 }">
		<script >
			alert("没有该用户");
		</script>
	</c:if>
	<c:if test="${param.grid==0 }">
		<script >
			alert("没有该区块");
		</script>
	</c:if>
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
            <div class="col-md-12">
                        <h2 class="text-center">
                            任意区块负责人添加
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="add" method="POST" >
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <td>请输入区块编号</td>
                                    <td>请输入负责人编号</td>
                                </tr>
                                <tr>
                                    <td><input type = "number"  class = "form-control" name = "gridId"   /></td>
                                    <td><input type = "number"  class = "form-control" name = "userNumber"   /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <input class="btn btn-primary" type="submit" onclick="if(confirm('确认添加负责人吗')){return true;}else return false;"  value="添加" class="cEP_Table_Submit" />
                        <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/grid'" class="btn btn-info">返回</Button>
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