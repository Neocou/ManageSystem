<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>问题添加</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
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
                            问题添加
                        </h2>
                    </div>
            <div class="col-md-12">
                    <form action="add" method="POST" >
                        <table class="table table-hover table-striped">
                            <tbody>
                                <tr>
                                    <th>上属分类</th>
                                    <td><select name = "quesBId" class = "form-control" >
                                    <option value = "1">登陆问题</option>
                                    <option value = "2">修改问题</option>
                                    <option value = "3">设备问题</option>
                                    <option value = "4">举报问题</option>
                                    </select></td>
                               </tr>
                               <tr>
                                    <th>问题内容</th>
                                    <td><textarea rows="5" cols="40" name="quesLName" class = "form-control"  >${question.quesLName }</textarea></td>
                              </tr>
                              <tr>
                                    <th>问题答案</th>
                                    <td><textarea rows="10" cols="40" name="answer" class = "form-control"  >${question.answer }</textarea></td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <input class="btn btn-primary" type="submit" onclick="if(confirm('确认添加问题吗')){return true;}else return false;"  value="添加" class="cEP_Table_Submit" />
                        <Button  type="button" name="back" onclick =  "window.location.href='http://localhost:8080/ManageSystem/question'" class="btn btn-info">返回</Button>
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