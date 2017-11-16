<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>案件查看</title>
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
                            案件查看
                        </h2>
                    </div>
            <div class="col-md-12 table-area pre-scrollable">
                <c:forEach items="${cases}" var="a">
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>案件编号</th>
                                    <td><input type = "text" class="form-control" name = "caseId" readonly="readonly" value = "${a.caseId}" /></td>
                                    <th>所属事件编号</th>
                                    <td><input type = "text" class="form-control" name = "eventLId" readonly="readonly" value = "${a.eventLId}" /></td>
                                </tr>
                                <tr>
                                    <th>所属部件编号</th>
                                    <td><input type = "text" class="form-control" name = "partLId" readonly="readonly" value= "${ a.partLId}" /></td>
                                    <th>所属区块编号</th>
                                    <td><input type = "text" class="form-control" name = "gridId"  readonly="readonly"  value = "${a.gridId}"/></td>
                                </tr>
                                <tr>
                                    <th>案件时限</th>
                                    <td><input type = "text" class="form-control" name = "timeLimit" readonly="readonly" value= "${ a.timeLimit}天" /></td>
                                    <th>案件描述</th>
                                    <td><input type = "text" class="form-control"  name = "caseDescribe"  readonly="readonly"  value = "${a.caseDescribe}"/></td>
                                </tr>
                                <tr>
                                    <th>案件状态</th>
                                    <td><input type = "text" class="form-control" name = "stage" readonly="readonly" value= "${ a.stage}" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </c:forEach>
               
            </div>   
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
      
</body>
</html>
