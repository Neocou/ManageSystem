<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>公告查看</title>
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
                            公告查看
                        </h2>
                    </div>
            <div class="col-md-12 table-area pre-scrollable">
                        <table class="table table-hover table-striped">
                            <thead>
                               <tr>
                                    <th>公告编号</th>
                                    <th>发布组织</th>
                                    <th>发布时间</th>
                                    <th>公告内容</th>
                                    <th>    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${notices}" var="a">
                            	<tr>
                            	<td><input type = "text"  class = "form-control" name = "noticeId" readonly="readonly" value = "${a.noticeId}" /></td>
                            	<td><input type = "text"  class = "form-control" name = "noticeOrganization" readonly="readonly" value = "${a.noticeOrganization}" /></td>
                            	<td><input type = "date"  class = "form-control" name = "noticeTime"  readonly="readonly"  value = "${a.noticeTime}"/></td>
                            	<td><input type = "text"  class = "form-control" name = "noticeContent"  readonly="readonly"  value = "${a.noticeContent}"/></td>
                            	<td><Button type="submit"    class="btn btn-success" onclick="window.location.href='http://localhost:8080/ManageSystem/notice/view/${ a.noticeId }'">详情</Button></td>
                            	</tr>
                            </c:forEach>
                            </tbody>
                        </table>
               
            </div>   
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>
