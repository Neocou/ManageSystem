<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>问题详细</title>
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
                            问题详细
                        </h2>
                    </div>
            <div class="col-md-12">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>问题内容</th>
                                    <td>
                                    <textarea rows="5" cols="40"  class = "form-control" readonly name="quesLName" >${question.quesLName }</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>问题答案</th>
                                    <td>
                                    <textarea rows="10" cols="40"  class = "form-control" readonly name="answer" >${question.answer }</textarea>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                            <input type="hidden" name="quesLId" value = "${question.quesLId}"/>
                            <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/question/view'" class="btn btn-info">返回</Button>
           
            </div>   
            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>