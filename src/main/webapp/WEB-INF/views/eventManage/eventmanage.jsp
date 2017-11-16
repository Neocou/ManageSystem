<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事件管理</title>
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
                            事件管理
                        </h2>
                    </div>
                <form action="event/add" style="position:absolute;right:15px;">
                <input class="btn btn-info" type="submit" value="添加事件" ></input>
                </form>
				<Button type="button"  class="btn btn-primary center-block clearfix" data-toggle="collapse" data-target="#events">事件编辑</Button>
					<ul id="events" class="collapse">
						<c:forEach items = "${events}" var = "eventone">
							<li><Button type="button" class="btn btn-info" data-toggle="collapse" data-target="#eventone${ eventone.eventBId}">${eventone.eventBName}</Button>	</li>
								<ul id="eventone${ eventone.eventBId}" class="collapse">
										<c:forEach items = "${eventone.eventSeconds}" var = "eventtwo" >
											<li ><a class="btn btn-danger" href="http://localhost:8080/ManageSystem/event/${eventtwo.eventLId}">${eventtwo.eventLName}</a></li>
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
