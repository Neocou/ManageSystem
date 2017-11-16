<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人操作记录</title>
	<%@ include file="/WEB-INF/views/common/js.jsp"%> 
	<script src="http://localhost:8080/ManageSystem/assets/css/bootstrap/js/tableExport.js" ></script>
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
							<h2 class="text-center">个人操作记录</h2>
							</div>
		
						<div >
						<div class="col-md-12">
							<Button type="button"  onClick ="$('#testtable').tableExport({type:'excel', separator:';', escape:'false'});"  class="btn btn-success" >导出Excel</button>
		                    </div>
		                    <div class="col-md-12 table-area pre-scrollable">
							
		                            <table  id= "testtable" class="table table-responsive table-bordered table-hover table-condensed">
		                                <thead>
		                                <tr>
		                                	<th >用户编号</th>
		                                    <th >用户姓名</th>
		                                    <th >操作内容</th>
		                                    <th >操作时间</th>
		                                </tr>
		                            	</thead>
		                            <tbody>
		                            	<c:forEach items="${records}" var="a">
		                                <tr>
		                                    <td>${ a.operationUser }</td>
		                                    <td>${ a.operationName}</td>
		                                    <td><textarea rows="5" cols="45" readonly="readonly" name="operationContext" >${a.operationContext }</textarea></td>
		                                    <td>${ a.operationTime }</td>
		                                </tr>
		                                </c:forEach>
		                            </tbody>
		                            </table>
		                            
		                    </div>
					</div>
		            </div>   
		            </div>
			</div>
        </div>
		<%@ include file="/WEB-INF/views/common/right.jsp"%> 
	</div>

</div>
</body>
</html>