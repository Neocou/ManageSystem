<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>指定区块${grid}负责人</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<c:if test="${param.user==0 }">
		<script >
			alert("没有该用户");
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
                            指定区块${grid}负责人
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="/ManageSystem/grid/${grid}/add" method="POST" >
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <td>请输入负责人编号</td>
                                </tr>
                                <tr>
                                    <td><input type = "number" name = "userid"  /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <input type = "hidden" name = "grid" value = "${grid}"  />
                        <input class="btn btn-primary" type="submit"  onclick="if(confirm('确认添加负责人吗')){return true;}else return false;" value="添加" class="cEP_Table_Submit" />
                        <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/grid/${grid}'" class="btn btn-info">返回</Button>
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