<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题管理</title>
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
            <div class="col-md-12">
                        <h2 class="text-center">
                            问题管理
                        </h2>
                    </div>
                <form action="question/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="添加问题" ></input>
                </form>
				<Button type="button"  class="btn btn-primary center-block clearfix" data-toggle="collapse" data-target="#questions">问题编辑</Button>
					<ul id="questions" class="collapse">
						<c:forEach items = "${questions}" var = "questionone">
							<li><Button type="button" class="btn btn-info" data-toggle="collapse" data-target="#questionone${ questionone.quesBId}">${questionone.quesBName}</Button>	</li>
								<ul id="questionone${ questionone.quesBId}" class="collapse">
										<c:forEach items = "${questionone.questionDetails}" var = "questiontwo" >
											<li ><a class="btn btn-danger" href="http://localhost:8080/ManageSystem/question/${questiontwo.quesLId}">${questiontwo.quesLName}</a></li>
										</c:forEach>
								</ul>
						</c:forEach>
					</ul>

            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>
